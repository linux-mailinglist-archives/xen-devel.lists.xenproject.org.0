Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B30E5EDE82
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 16:12:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413356.656980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odXmv-0001Og-4M; Wed, 28 Sep 2022 14:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413356.656980; Wed, 28 Sep 2022 14:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odXmv-0001LS-0X; Wed, 28 Sep 2022 14:11:49 +0000
Received: by outflank-mailman (input) for mailman id 413356;
 Wed, 28 Sep 2022 14:11:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG3S=Z7=citrix.com=prvs=2639d358c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1odXmt-0000S3-G7
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 14:11:47 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6faabdc5-3f37-11ed-9374-c1cf23e5d27e;
 Wed, 28 Sep 2022 16:11:26 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2022 10:11:33 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA0PR03MB5596.namprd03.prod.outlook.com (2603:10b6:806:b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Wed, 28 Sep
 2022 14:11:31 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 14:11:31 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6faabdc5-3f37-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664374304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=D0ar6Be/O6ceYvTffbwdzz9tYlDXEXceF7FBXTya4eM=;
  b=MDFm3VWjVCFgi8ByGAL0VBnnttZtC86+KHTMDgc+DPbCpX0TV6FHAO2Z
   xnfNBmQFjEkaWSVfoLH5ISc0z2fWLNmxdfwHeGfWwOcedRXBCd6a6FYOG
   jTnNcH4YnETldy0l0vMnPLm/zirBtnhaDG0U5eXWze48o2GUHsYfFUE8N
   4=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 84050010
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:whlHgq485/ZlzianDhgUQQxRtODGchMFZxGqfqrLsTDasY5as4F+v
 mRJWG2AaamNNjGhftwlbou29k4FvpWGndViTwA/rCpgHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPYwP9TlK6q4mlA7wZuPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5SOU1sz
 6cfIgkkTR+EqM2z45m/EPdV05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMkGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iLw3rKXxXqjMG4UPKe77qJkr1uM/HA8SywUcWW7juKkunfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAfVSJIYtEisM4wRBQp2
 0WPktevAiZg2JWXVHac+7G8vT60fy8PIgcqbyIeUREM5dWlpYgplw/OVf5qCqvzhdrwcRnOx
 DSNoDk7lq8kp8cB3KWm/njKmzup4JPOS2YICh7/W2uk6kZ1YdCjbonxs1zDt68fcMCeU0WLu
 2UCl46G9ucSAJqRlSuLBuIQALWu4PXDOzrZ6bJyI6QcG/2W0ybLVehtDPtWeC+F7u5slefVX
 XLu
IronPort-HdrOrdr: A9a23:npcqvavPOi+/cWkSteZp0ITH7skC7YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBHhHPlOkPMs1NaZLXLbUQ6TQL2KgrGSpwEIdxefygcZ79
 YYT0EcMqyOMbEFt7ec3ODQKb9Jrri6GeKT9J/jJh9WPH1XgspbnmJE42igYy5LrF4sP+tFKH
 PQ3LswmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZXbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczKgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenkPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesaMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO21GkeKp
 ghMCjg3ocWTbvDBEqp/lWHgebcFEjbJy32DXTr4aeuontrdHMQ9Tpr+CVQpAZDyHsHceg12w
 31CNUXqFhwdL5mUUsEPpZmfSKWMB24ffueChPkHX3XUIc6Blnql7nbpJ0I2cDCQu168HJ1ou
 WLbG9l
X-IronPort-AV: E=Sophos;i="5.93,352,1654574400"; 
   d="scan'208";a="84050010"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQhtuQJlpcsABc5iMYnJ9Lt4IPAQdYKblhgG0lBZRFecnwNqByxg8c3AzB+dLsc3FTMzxDWRCzhyoaFL9OvwGrboISkESFKtJ9VXuGbP+2jBmCmOxFws6HawFmXZ/Tc+obmCgBq9/sUoIBtFTircROUfduW4etW/JKRXJyr/p1fHlzMNeGeT0xUlwK8MvBtgh1Kl8rJgMLzWs/yaANVG4IlEVKTeFtTOtPoZUyreuk1Em7gUFTBwOgQX7B67Mjnn6+DxOru6gnR3ZUeFQVXuaKOWjE7IzjhDawYJ3zIbeLlH2JoBDlXNNEDjaPWPA/LUlgGPspil06EaUlOH8mmcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kB9mpVtnBT/eigFVC4SQfhSkRGs0sR28/Ucd8sfyyMM=;
 b=U1QGVCMwLdjR+XGFnguTZA+QVt4IlMFMUkR3sOEGw1jwJDvhGgD4E7z2ampH+d2gw6OJbW2QF0h2gra6xfqwpiMFu/GnCRHvDW35R3qEjuLoBChEAraWurqI37ddETNfC8UihQa/Kv3u2j5VYFA8Fe+ObSQSoS2GN4fL+rjsUSj+PBmQ6JtSu+b3ut8gib86daF3CHAJz5Twvh9UW8QdGpqBsiK8VeQWTY6wz3mw4Jxw6enrwPm4O3QziCQyVnm0AP5CdnV3o9J31L84g9eg8PTAv3UAoX9DHySEcTiVpJ9FIe70BeeFrGLv0H7IbjtfJN5v4JmKcprCFrBqQ9z/wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kB9mpVtnBT/eigFVC4SQfhSkRGs0sR28/Ucd8sfyyMM=;
 b=G3ROh199xkDZHkcfduRKAfmQrrEI0KQbNo8wHorsKKyX8yrJKv9HfAHobojg85+NIFELX8cBJgYiKRmMUUc2WdEWBmdnKn1620WBH6AJeZpagicvdnNS4J9FTp6tHRfljXqOJQ2wzZ96EMqNDrQnCJGchnHEk1xDHmLW3OI3Qww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 1/2] arm/vgic: drop const attribute from gic_iomem_deny_access()
Date: Wed, 28 Sep 2022 16:11:16 +0200
Message-Id: <20220928141117.51351-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928141117.51351-1-roger.pau@citrix.com>
References: <20220928141117.51351-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0143.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::35) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA0PR03MB5596:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b6f6ec-d389-4238-ea6b-08daa15b56a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c6+lnQxUiO3yJ5JyFvukG5b8aNRSdYfOiq59lfnLV+arBxI9GMGoF1PlI4UFWzKlOCRQ/0uKhpK7+/XQG+l90TWgLF/EdBbalDIfWYS/Mmd7eC+7kc6+vVm7TEFQIH0UC4k83CYAvAECa61lveWKgxmJ9ag8bXTl0aM4n9eboTUyQkCcU+IFG7QN6oQsLuoiv+41WZn1mNPBkseEPGREN9Y+o1+kErnWdZlhpu7XgtnVEvQoU/AjHFPVPHnpqUovjui/qW2D2+tmdoV+4oOntQRVLbF5G3fGxlI/Y/iNGqg4c3mXdEyUGwnavvCEONHZtMI1iiznO9ftGYtZqvzFJ0wooMms/ShK/NCeXCSAMmxXWXLrdyzDI2YvNKKf50qV0u5zVUKK8AW1e05jbVFGjT4lFBUcAkhaErKYV3kms40JdlaT4bLkk/gsBc2Cku3fHp8nyE4ZoDAz7xRZSNOSxvCfk8hFYOxO3eYmxTPepTPIojnGSU9S9A28e7UipRQX5OMV0qjaqnbxZfKfgo+SIp8ETyyZwwaiBXh3uz8F25gF+MyUoXbsUekOeOhNR64HUdFrRfYDzseCjQgcOrQE9R4mGDZii2nKli9eEM7dPQx5H3FXI85zjv3OSSQ2g29C+zIa9CqSEEbtt50Umx2cSv32zg7jSRFD/28HaL08iQweSTw78u0/34/m1jwkCB6hS8sV5WZh52mmzNAf5YnX6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199015)(82960400001)(6916009)(316002)(54906003)(5660300002)(8936002)(8676002)(36756003)(41300700001)(66556008)(66476007)(4326008)(2906002)(66946007)(6512007)(186003)(83380400001)(86362001)(2616005)(26005)(38100700002)(478600001)(1076003)(6486002)(6666004)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b05QYUk3SkZwZVdaK2pZd3M5NEZxWUpwSy9DVVFaaUNUWHJMckFuT3RobHJU?=
 =?utf-8?B?M1hBeG4zT1JBQndpcUZKK01udUFwS0hVSVNBV3Jtbnp1bFFJNnQ0N2NsaDl2?=
 =?utf-8?B?Uys1TGxXRCtMTk40L3dBR3ZyRXhIYXNjckluNk5RVTVWR2MxVWFlUGRKbk9r?=
 =?utf-8?B?Ly84allQL295ZmNzbUNoUmxzeDhocEp5aldVNjJMdlZ4bmtWTnBGZFdiNHpW?=
 =?utf-8?B?MTdBZ2JmbUhXUFJuWEJjNzZxUVNBVER1YXZwa0VRVUxSZWsvWGFIZXE2cEtH?=
 =?utf-8?B?aTBrTkdVUUVBWDRGcEtkc09nNXBoUGphVjlrbDVFZUVqUTc5ODl1Q0JwUHg0?=
 =?utf-8?B?OEMyTm4xb2tYYWF5UTJmNjlkSGlQaGVGL1dzejJSVllXVWxwZzgvV3dPemls?=
 =?utf-8?B?RytXVnJ1aTZzZjJJWm41YlFuQkhtOU11amNrR3VaT3JWNmQ1YVhuNHdJTGhj?=
 =?utf-8?B?Ri9SV3UxcHV2K1dSd1lOeGMxTWdOak9MdEo0MzljT1hhUlJoUGIzWnRQL2ov?=
 =?utf-8?B?M1l2UDJqQW8yWHNGTkNyaWhrdCtkOEZSeTVPVUVKS1BPcnhaT215dXNReXkw?=
 =?utf-8?B?Y1ZPUG9EWjQyVkpJaTRmY2gxSmZzVUd6RHpqQnRrcEF0YmlUYS9mU2UwT2Ry?=
 =?utf-8?B?Q1cySmt3NG1aaGZFVzl5blQ4MEFzcE9IeWpMdjNMYnNtbHFQSGNkK2x2bURI?=
 =?utf-8?B?cUFIYytDR1VRLzZNUmE0c3YreW5Fdk1MaC80TTY1NWhHNjNQSUN2b3ErWW9M?=
 =?utf-8?B?UW15VWg5YzY5alB2Y08reVFqRko5MUQydWFjQWhWSEhURXVOSjVaT0dMQStH?=
 =?utf-8?B?YTI2cmRtbjBOYmNnSGdEck13djQ3N2UwMTlva0JUOXBHZUpFOTkzOVBTSi9I?=
 =?utf-8?B?ODQ0eUlWQXUwTG1RSEM2MUQ1NkJ1UlNoTXFCUDJjWjNsY2QyT3d6MWhGU0ZD?=
 =?utf-8?B?RVZRemtDLzIwUVpvanpiN0ZEamkxSFMyVjlLbm4vV2VISktZZjVRWjdEZEZY?=
 =?utf-8?B?OUxjaDdnL0grU1BEcTVWVE9hMG5ESFhodzBXd0VpTjE1K21kMDhZanc0VEYw?=
 =?utf-8?B?K2NZemQyL01nVVhNUXVCZGJjaHFjaE9XU2Rodk5ZNWk3QVk1ZkhXZ050dEJq?=
 =?utf-8?B?TlE3S0NoOHczTHJXOEtMSXZab1BhN0l2aStBU2dJVk41b2kxTitPQzdtczM3?=
 =?utf-8?B?cThxc1liSG5mTnVFekFNYlk4VFBTNm9mOGlGZnorRmNYbDFxVHVvREpsWSth?=
 =?utf-8?B?Ym1HR0JHanAwYnV3SG14NWM0NWhoK3N1T3dzVmkyanFlVWhOdHdXeUt4UEN2?=
 =?utf-8?B?aDlITWtIci8wQ2Nqb2lWVXBRaTNMb1ZFT1RNdmgvSFJHQ2g4T3RHWVhDcUNW?=
 =?utf-8?B?TG9NTjA2UWZrZGFIeTdSVnlsNHFrSGo2TTE4SkFkN2IyUTVHV2ZXTmtVaWJi?=
 =?utf-8?B?V3BVUWRnZ1BYcUlPSWRLVlBnY0FEZ1ZyQkdsU2J6S3YySy9KeHJHRi9wVnNF?=
 =?utf-8?B?a21LMnIxcGx0OTNRazNlWlFaRVlkWWptVmEzUmpMZmZENDQ2Q2JVSkJFV0sw?=
 =?utf-8?B?ZHVBM0ZvK0dnTVJDSXplTFV4ZG9JV3h5MTZnT2MvNTNzbXZnMVBuR3hCQWVj?=
 =?utf-8?B?QlI3Sk1lUEVjcHhQM2tURjVqQTZtTnhVZnFYYXdJMDRSNWpGUDFqSzBEQVZK?=
 =?utf-8?B?RlJRb2FYZWpTNXU1aUFlUkY4bGVtL0tob2UxSHhDS3VwZTAyMjRwZVlDQ093?=
 =?utf-8?B?V2dsZEVzTC94K1ExcmlkVnJYNEhwUTlJdVIvQWF1R3FqZ1JXNXlMUEU0OGRJ?=
 =?utf-8?B?SHZ6eDMvcVF6eHpmdUp6OVcyODI3UjhCL1BhTkF5VnVVZ0lkdGNYcXF1RzJX?=
 =?utf-8?B?cEhpWXY5UEJnK1gwRmF6c0kyK0lxWkVLaytvNjZvZmptT0tpb0hoZ2NaMUVq?=
 =?utf-8?B?VUY0OWtmUGJnb0pOTkI4VzVxbzhHdTYxT1BpemdVT0FuZlNNeWNlUjZSYkVl?=
 =?utf-8?B?MlRZdDBBZHlTUUtxcWFFUzR2OEk1K0gxc1ZXVlZpdXFNTjlBMkNFUEE2WkpJ?=
 =?utf-8?B?UnE4WUNYVWNqYVloMUMzL09DK0V6V3BKV2NEOHJpQ1pmUkpZRXRSL2hTTFMx?=
 =?utf-8?B?Wi81NHZoVGFsNVNyakswZ0lpMUdqUFo5OHJZemlidytVNGsrSld4cFR4MU5T?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b6f6ec-d389-4238-ea6b-08daa15b56a8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 14:11:31.2736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvWCB8cyPgwk8DnmZ7u45+4WZO5WRfmFMcw8h/4+OtvU47L0b5P/FiVjWF6MuobRIK8tGBKgHIXbic+/8A4wmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5596

While correct from a code point of view, the usage of the const
attribute for the domain parameter of gic_iomem_deny_access() is at
least partially bogus.  Contents of the domain structure (the iomem
rangeset) is modified by the function.  Such modifications succeed
because right now the iomem rangeset is allocated separately from
struct domain, and hence is not subject to the constness of struct
domain.

Amend this by dropping the const attribute from the function
parameter.

This is required by further changes that will convert
iomem_{permit,deny}_access into a function.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/arm/gic-v2.c          | 2 +-
 xen/arch/arm/gic-v3.c          | 2 +-
 xen/arch/arm/gic.c             | 2 +-
 xen/arch/arm/include/asm/gic.h | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index bd773bcc67..ae5bd8e95f 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1083,7 +1083,7 @@ static void __init gicv2_dt_init(void)
     gicv2_extension_dt_init(node);
 }
 
-static int gicv2_iomem_deny_access(const struct domain *d)
+static int gicv2_iomem_deny_access(struct domain *d)
 {
     int rc;
     unsigned long mfn, nr;
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 64b36cec25..018fa0dfa0 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1424,7 +1424,7 @@ static void __init gicv3_dt_init(void)
                               &vbase, &vsize);
 }
 
-static int gicv3_iomem_deny_access(const struct domain *d)
+static int gicv3_iomem_deny_access(struct domain *d)
 {
     int rc, i;
     unsigned long mfn, nr;
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 3b0331b538..9b82325442 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -462,7 +462,7 @@ unsigned long gic_get_hwdom_madt_size(const struct domain *d)
 }
 #endif
 
-int gic_iomem_deny_access(const struct domain *d)
+int gic_iomem_deny_access(struct domain *d)
 {
     return gic_hw_ops->iomem_deny_access(d);
 }
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index 3692fae393..76e3fa5dc4 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -392,7 +392,7 @@ struct gic_hw_operations {
     /* Map extra GIC MMIO, irqs and other hw stuffs to the hardware domain. */
     int (*map_hwdom_extra_mappings)(struct domain *d);
     /* Deny access to GIC regions */
-    int (*iomem_deny_access)(const struct domain *d);
+    int (*iomem_deny_access)(struct domain *d);
     /* Handle LPIs, which require special handling */
     void (*do_LPI)(unsigned int lpi);
 };
@@ -449,7 +449,7 @@ unsigned long gic_get_hwdom_madt_size(const struct domain *d);
 #endif
 
 int gic_map_hwdom_extra_mappings(struct domain *d);
-int gic_iomem_deny_access(const struct domain *d);
+int gic_iomem_deny_access(struct domain *d);
 
 #endif /* __ASSEMBLY__ */
 #endif
-- 
2.37.3


