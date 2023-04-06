Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8FD6D9356
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 11:53:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518802.805681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkMIG-0004P4-TK; Thu, 06 Apr 2023 09:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518802.805681; Thu, 06 Apr 2023 09:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkMIG-0004NM-Q6; Thu, 06 Apr 2023 09:52:36 +0000
Received: by outflank-mailman (input) for mailman id 518802;
 Thu, 06 Apr 2023 09:52:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkMIF-0004NG-Ub
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 09:52:35 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be09b5b3-d460-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 11:52:32 +0200 (CEST)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 05:52:27 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6324.namprd03.prod.outlook.com (2603:10b6:806:1b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Thu, 6 Apr
 2023 09:52:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 09:52:25 +0000
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
X-Inumbo-ID: be09b5b3-d460-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680774752;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dpDlh5icSRVarVCK54bUow0cqNLbjUdRZ+A09A0AoZU=;
  b=evogiJ7wbkdQ6efMCOnaTUFQVV7YHBDA4N3VDTmVteOCEbyrslsGVDfK
   gLr69bvW8jW5mEJ3FYm0hlHV1RvVhvCJt8l7hqB0+tTEhst9s2ne5G0ev
   o4yyKYbulrL+k5Q3+6OBdeNVdb6ozNjU5A+Jh0E6vtb3+QQllZN86zYTr
   8=;
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 104949579
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:A13gU6uuSGDMQvKzDCQyQQdrYefnVHtfMUV32f8akzHdYApBsoF/q
 tZmKWDSP/mIYmukeN12a4W1900P7JPVnIQ1GQc/qio2RnwS+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5AOGySFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwOnMWQhyNruuPzpmWFeR0puUGLJTsM9ZK0p1g5Wmx4fcOZ7nmGv2Pz/kHmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ouiP60aIS9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgqq820QDMlwT/DjUWc3S6jPu+0nWlXuJFI
 WlJoBRtvJMLoRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2hBSQSN9mSfaxloesQW+2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN/xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:PE+laqsY6QuPr8Fa8uEVgEDT7skDS9V00zEX/kB9WHVpm62j5q
 OTdZEgviMc5wxxZJhNo7690cq7Lk80l6QFhLX5VI3KNGOK1FdARLsSj7cKqAeBJ8SRzJ866Y
 5QN4R4Fd3sHRxboK/BkXCF+51J+qjizElwv5a480tQ
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="104949579"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0hgq3DTqbUwTIZVf4TGGn1CCsbF2o2inFaaliXgsGg/Qt9FB8YDTubMOXkcTbIIi3hHlQRPUtTmvZSA/kP1Yw4fci2sjE9BsDVz+jmExBVgVTQ3xN5Qo7hDZm2NCszd2/H/74rWCmAyjl3Mgxx+5bBRbNAPf3hM8iyCXkX6O2m9ObE4RPjgCuLxBgatsNxNR8pf3LStGsGsICEhL43Voj0GkVlR7qwjV4B3+Z9dkUYBaAhd9oDPqnFMyJOM0SKYQBUgMDhvL72245hr7kCihe96B8XcYQV92k3I+4lnG4w1vxi3zb0wbsnaKipL6tdGPnmqX3sioMy/eNdhauqzyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DryfQqvKLhPUZKX04YcojEKABkspmMe186zBuIMmdKw=;
 b=aAw0Cc+ACP1iF9TYt8/EeRM80CqVx07H+cewXsgJuIR+nH3cjk+bcnn34zJJm7k9Jw/avcYtQllTdTmTzwp5ynkR53OLbqLCGfWOXMcSPOJzq1F1ELXQwpnLKTwf89hG/KeZIT+22YN60kZpOGxNgcXeKd0HZc50H2fHfcMGiluAPr8g4d8GEJGlUgTEmQehe5IgjhEL0liuSWw4p26LPWBmUktUJn3B+/+PIIdGb/3WoMXN1Z5MrP8dHqSkjWs34MZ+8pvycznqmzJNrU24M7FrIT5Yumi4CXHIiIM6YyB7gG4YDmDs76IjRN4dnyUOhGa/SYPHJuDHLdTNW9qDnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DryfQqvKLhPUZKX04YcojEKABkspmMe186zBuIMmdKw=;
 b=ZT5lApxF3kZmSdxwV26m7d6Qzv4i9JatLKBewaOT6U82TJzvm8WR21Qe9cYNnRTSZsf13buFhwH8XupUifx+T1Ja0qGDbo1d0J/UMNaYliaBTbBT7aTv26J0DYL/dKhaoHlMd3BCZebs1aWaWL/sI2BPa8+4bdLroN4aX4J44ik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <24133c6e-3e66-7be9-41af-daa3db4fa961@citrix.com>
Date: Thu, 6 Apr 2023 10:52:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/svm: Provide EXITINFO decodes for MOV CR/DR
 intercepts
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230405204423.2113418-1-andrew.cooper3@citrix.com>
 <313a2a18-020c-ca76-f620-f5694a74efeb@suse.com>
In-Reply-To: <313a2a18-020c-ca76-f620-f5694a74efeb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0354.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c28d9d-431c-4afd-d13d-08db36849fdb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OthXj+pOKt1VjDuRVUYnyZle4NED55VQao1ZA0+jjFEfu1W2hD2O+P3fBh99E3DNakAnOihdwBXPxZnbgocj4ml83Sr53wQnfKUcMKqIB1B7f2Ktc06ptuonE2wCj5+/czdM4DiMv5KgO9ihlVLLEHMl3PvHW/zcobk22qQVKbBEYIAcB5eo3OJvWqqoMWlB3zZIhppoVMp+6yJgnxMPVwJXeAHL0Dw+2Pb40qzXHdJJYiFkrBASobF+f4Cf83cN3hpOSbBPP65zI+ck+EB6XR9OtdC91JcmVGkdXHFoVc34Hc+tJtsj3/xY6odd0U+5vipNFq3RCUsNzftK55PccZAcu++RuE0gxv+ihhBpuyJBtla0w4Zs3NsaGRcAMd+fVjLjVsIwPPiB8rn+89Dx/MuXf0YaS2GbUDTIalMyg/XzouJKUPsjq62y1sldk4b0lDmljJeSsy2+qK7/o71jk1YX2vnf4msQcUts7/a1tZrH/+M78u+ksreu/QIayoTV7VHOumIcfbfvG4hcp2/hqvlI6AE3DZb+3I3msxzfdekuOcbVL9OWdQoXuv6dQzlo146XsQsbJSr05rp8G1B3vveUFQ30fw0DrMkeQmT44oOCMjRNKtL7AU/W+v3PlPXmfzKc6NpmYbZ52AXcLqHB1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199021)(6486002)(6506007)(38100700002)(26005)(6512007)(4326008)(41300700001)(53546011)(6916009)(66946007)(66556008)(66476007)(8676002)(82960400001)(8936002)(2616005)(83380400001)(478600001)(31696002)(186003)(36756003)(5660300002)(2906002)(31686004)(86362001)(6666004)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVJtODBENTd4aVFXNjNsdktuNk1aVzJOUFlKVGxCc3c1QXNtVDdMNGVic2RB?=
 =?utf-8?B?YVBMNjNaYnRnTXROS3NvaDhaSE5sVVdsM0JoRmMybEIwUU1HczBvc0dnR2VQ?=
 =?utf-8?B?Snl1OThhT3pubjdFRWZoMzZxbG9sL3E4NVVWK2VISkpHZVJmdTEyMHpFUnkz?=
 =?utf-8?B?M2NRRGJJOGJTWnJhbTBLOHhVN2VQbGFuQnlyblZFckE3L0J1Q2FNTm9ldWRr?=
 =?utf-8?B?UVZsL0FzalpJTzdBUGNYLzV3ZzVVUmhGTVpEZ1FlRHgzN2RmcUFnNnQ5U0lj?=
 =?utf-8?B?NVRnTllBa0JmcDVlRnFoWnYyMG1qdGNtZ1hpd0lEVzYxa1MyVFpPeXQ3R2pk?=
 =?utf-8?B?ZmRGMC9BaW9lRG1tWUVqUW9KNEtqWjZsT0VWQkRuaVdFcVhHOTRLcTNsN0oy?=
 =?utf-8?B?ZXlaTGpzTXY1ODVhdURQK015WGNzU0dkTDR1N3FiaUVEWXdwS0ttaFptOUxL?=
 =?utf-8?B?c2NPVXhoN3hYOXplWDVWYURFdXZ1V3JZTEVpaElORVl1OWdEMjhHSXRJNTIr?=
 =?utf-8?B?ZDNrendsYkxCNTd4TmZRdjhDcnVEaWx5TzBuVTVUdUs5ZGVhaTJHT2QrZjVL?=
 =?utf-8?B?cGZKUHVEWmw3bko3aE1wQ09kbDlkTXdwOHhRcE5nTGNkU25TVjJUZ0RJaFVV?=
 =?utf-8?B?MEdJWWpITE51a1pUTVVRaWNnWUl2U3NWR282djZ1N1JVYU9vYmNBalB4RGMx?=
 =?utf-8?B?V2lwTGU0NjJ6aWhCaXl2RkhxV3ZzeC9rMjJidDdIQTQ2a2pIL3hGb0UzZ2RO?=
 =?utf-8?B?d0VBOE90d1B3YnpvaG1SMlRHMjlONVFYL2J4QUtURjgwUDU3eVpFd1JWTnJE?=
 =?utf-8?B?eDVWMEEwWGdmNUYxdEhzeElSeFA4Z01rOGN6c2J2c1k5bVNkZkhHSWJJd21u?=
 =?utf-8?B?TUs2aFpyUE1TQ3lnQWtsNGdmL0JxY0ZQNUZiREhaejU3UE5GelY2cnFEVER2?=
 =?utf-8?B?WU82N1Z4d0RkOHBUYzlvalVoRjNTK2phSjRFMFVpaVNzZFZrM0EyTlhCL2lp?=
 =?utf-8?B?VUFXSFFNZHZGQlZTNVEyKzBHR2JQUmxHczFtUm9Ma3lxSHlrYVI3UWxMNzgr?=
 =?utf-8?B?Ym1reTNvL0FVUG04Rnp1U3hWQkpjMGY0YVVtTzB3KzBLQjNja21WdXo3S1pi?=
 =?utf-8?B?c29QaXdUU2tUWHo1c2hSOTd1QXBpRzY0aTZQVFB4d0hxT1BEZ05NZlV4RlJu?=
 =?utf-8?B?TlFyTDBHaTBPRFBsb1dVdm8zQ05PUFFyRDFzeEtXWjV6YTVUdkVHLzV6Vk1r?=
 =?utf-8?B?N2J6Rm1uUHhSaDdpUjlVMXpMbjlGeExnSjdYdDIwcU5zTlN6TVRXQ1hRT1o2?=
 =?utf-8?B?ODVIb0ZUbFlTSHNNN2pVMm1ZcDhxZFFDTXEzNHRrR29Mams2cVhzTU45d09r?=
 =?utf-8?B?V3kwQTdVdHQ5Qm5vSURWc3VVSy9tTW83ZEVqN08rL1VTNzVseVhFd0szMTM5?=
 =?utf-8?B?ZlFkeGV3VVBBeGN0VkRuVW82eWx0VUlYVHBLMU5IY3FOeEdZZFkvMktSRXBZ?=
 =?utf-8?B?d1kySUVJQ2NqUFlXcllIRTJnK2I3OHVNRU5qUzFMVnFZcmRtRWo4UU5GcnE0?=
 =?utf-8?B?UExKVWN3TktJb0Y2YThVU1FOSmQxNFFwT2FrdGI0dC9ONUlOR3VzbzNobUVS?=
 =?utf-8?B?VDJyQnArMzBjU1ZvR2x3TlVoYUNRcUhlRFFJYWNwOEczdml2MGVZL0MrS2dI?=
 =?utf-8?B?aW03ZXlSbGpyNDdDVG1vK0haS25COG5ORDVjMGlFeC9hZkRra3RwUWNlcExF?=
 =?utf-8?B?cGUxZHBQVFlhMEhDK0VpU1RBdTFUem1tNzVsbG1PVGVlUnMrdHpzOFBwTlVv?=
 =?utf-8?B?MzQ5RlZkWGhwalBhbDdvbFBINFo0QTlnWTlNVWlzT29zNXpacGtqNUYyK1I3?=
 =?utf-8?B?aXY4S3pzbHpQSUhIYm4yRU9CU1liSzlJTyt1Y3M1QXVjcG5oZERaWkg3MzZK?=
 =?utf-8?B?RkM1WHlOM05Qbk1nUHhwdnJueWRoQVNPRVNGK3RFSXUwdlphWmg5MkMxZDl0?=
 =?utf-8?B?SmRuZmhqZ1gzUzcxa0NWeXdSZFZ6US9xSUJweHVNRjc4aEFXbjhkbXowN3lp?=
 =?utf-8?B?UUloVnVJR0NFZkFMVFQzNk9CNUVtVFpQTDM0NzdrclAxdEVxNzNPZHc5Yzhm?=
 =?utf-8?B?c2F5bnlrNmdtR2QwK2tVK0cyOWk3YmF2dzlVV1JrUW14Y3lSYXhldXFVRUNF?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xoB2nCLB3QYiYYq/Lad3yuxFJbvLGMs3hDn9A7JItNHGbfF37QJrwzkY2zcuiP/4lfvzzN2ahKaM5kU5GZWdmDjvNWYlNALB12ImIC+WH9DTs1DU4lF3MoM3rgPJViyWZtDKk7A+0JoLF5wLcDiOlfAnAaT3Xp8ybTUo5PW9fRKgs55uz1WlOQi2PLWI5N3cGWp+zsny+hugRJt1c4PAxAUcF8E5ZC/sMudIVlEuJul+l47xUau1KtBZ3rDw0Bqyf85Tuh9q9uVaTaB58kyk760QznlkaeibeU2nWXFrIZuaGl8dpZ0gGe3DOjOf549Hj0c/0/17Rgy6wF8BdNwZwK8pw1mWSRM/iRDgZh1GWffvA0ouoWmy6tPbSGFTwEdmyjxIgJt3J6givk31ffIEbgKgftCgUXNE/FYUFtF+riAP9vQa3nPnb+RARmofEBnyVzptZQ+dP1GhRT/lh6mrNSz4TpfCZ39dGUkObriTTmQ6UbEyCf4BsjebN/ZA1f+7jTSzh/8gg6HWlkUrrz4LcGBuKxCTWnFqVrue9eKFH+/r2sUKJdDtB6JN8etshDQ8ivkfX/4dUrJ4eDf9//7p3YLk+3Z+Hue1KUtURy9/j3FZM3nfKUlKYyqjv8wWQLJji7/xFJFbfIeodJ93kTKAOu5snOfq4rl2p8O7DtQ68DWHsh6qzf8WpbYrAXu3sSHJJR9qBwDbEtNN5XkAJ+Nh0hC32gmP8uXuKRGdCUq3k39fadsY0vYVkljjHh8gELlVwocZbChWmLieXnNbP7T8frIAZASXTa9FkSiv43jEeFaBLN7eYKraVOO65mit3ZY6
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c28d9d-431c-4afd-d13d-08db36849fdb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 09:52:25.2381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjvxDHqIuGW3szLS4Yif1KB+nZk4wRF0TVRFdetZKOQ3mwHCgLkUn4L3WxBCsCgVga/DKoeCBHSRst8jjG49tzzLEXihYvLHMF0lwcTZk5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6324

On 06/04/2023 10:31 am, Jan Beulich wrote:
> On 05.04.2023 22:44, Andrew Cooper wrote:
>> This removes raw number manipulation, and makes the logic easier to follow.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> One remark though:
>
>> --- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>> +++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>> @@ -450,6 +450,11 @@ struct vmcb_struct {
>>  
>>                  uint64_t nrip;
>>              } io;
>> +            struct {
>> +                uint64_t gpr:4;
>> +                uint64_t :59;
>> +                bool     mov_insn:1; /* MOV, as opposed to LMSW, CLTS, etc */
>> +            } mov;
> The field being named just "mov" makes it apparently applicable to DRn
> moves, too (and the title supports this), yet the top bit doesn't have
> this meaning there. So perhaps say "MOV-CR" (or alike) in the comment?

Hmm - I'd not spotted that distinction.

Xen never decodes the exitinfo for a DR access - we just resync dr
state, drop the intercept and reenter the guest.

Therefore I think it would be better to rename "mov" to "mov_cr" so you
can't use the mov_insn field in a context that plausibly looks like a dr
access.

Thoughts?

~Andrew

