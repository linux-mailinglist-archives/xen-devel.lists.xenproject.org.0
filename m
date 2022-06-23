Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3762F557653
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354674.581915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Ipu-0000rh-4z; Thu, 23 Jun 2022 09:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354674.581915; Thu, 23 Jun 2022 09:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Ipu-0000ox-03; Thu, 23 Jun 2022 09:09:14 +0000
Received: by outflank-mailman (input) for mailman id 354674;
 Thu, 23 Jun 2022 09:09:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSRO=W6=citrix.com=prvs=166c34e93=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o4Ipr-0007sI-NR
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 09:09:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 247becdd-f2d4-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 11:09:10 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 05:09:08 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5934.namprd03.prod.outlook.com (2603:10b6:a03:2d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 09:09:06 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 09:09:06 +0000
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
X-Inumbo-ID: 247becdd-f2d4-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655975350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=teZsxeWDp9URVH3hkJcqy+gk4GBwS4EaVwF+XzaeVfs=;
  b=B056hFASSlqeI68HuCKsr6IJFLrsn6hnaTRi84dItQOkECf7v3G5hfqM
   hFOWckji09i98BTpFcN5vY5JRwwC2dcGNgXUujHmLV/Pk+CtSyzj0siZO
   JM2dSEmBRJXaT4dYkPB1x0eqvAplPmrJrEI1b7at8hwd+9TBR2w3sGV7v
   E=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 73582818
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:k1A9B6q035Dpbca6koab8tG/QgVeBmIFZBIvgKrLsJaIsI4StFCzt
 garIBnUO/2MM2Hyct0nPo/k8EgCusXcxt8xSFZprCw2E3sU9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrRRbrJA24DjWVvT4
 4mq/6UzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBAqKSssA9YzRhNApZZZ9pw5+eBSSRiJnGp6HGWyOEL/RGKmgTZNdd39ktRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkGgnFs2aiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3O+PptszGDpOB3+L/jacvMK5/bf5RQnE21j
 TL++HumWChPYbRzzhLAqBpAnNTnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQomOAvxMac8pdFas98g7l4rHP/w+TC2wATzhAQN8rrsk7QXotz
 FDht8ztLSxitvuSU331y1uPhTa7OCxQKHBYYyYBFFEB+4O7/N51iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:4LOPS6vKm1Kpp1cBctfmBGt/7skC5IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBHhHPlOkPMs1NaZLXLbUQ6TQL2KgrGSpwEIdxefygcZ79
 YYT0EcMqyOMbEFt7ec3ODQKb9Jrri6GeKT9J/jJh9WPH1XgspbnmJE42igYy5LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUsEPpZmfSKWMB27ffueChPlHbzYfJt3SE7lmtrQ3Igfwt2MVdgh8KYS8a
 6xIm+w81RCMX7TNQ==
X-IronPort-AV: E=Sophos;i="5.92,215,1650945600"; 
   d="scan'208";a="73582818"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxNREDdB0xe/kGVku9qpnfEpDJPSPRrwFTUw5vncVHWX/0jTxJnD4q+tdWOVJD3efmacbSRTICjWs/1ub27albqJnO9IjLKWdfc/uEMhg0VCAw6BASDzkF0yL3xUSmelbg3TcBiNT8EdsZyAlxV+PuQ5ODcqiTGnY1Ce4MIYCoKnUxHQfui72yaYK6jNp+hI2f583LSv+7ro3CxfFeF494qPdIvfXgGhDfvFEjGxhuXyW8kOEiuHe1Ack4SoA+Gbgy3XLdtn+zO5jtHUf8RBAgShyo4BK5XP/bQmDaqQNCeAXgpO1888si1CGHQPvXgmC+0O/GzRKGcjm/i2756BHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hH75V/WM2LVZxnBqVh030EFKsJy+Y/Gn6Q/hZLew5iQ=;
 b=Mp9Yor0QmzLrnUM8GAJLS6+NjewK9qxdw+LaZUKU/HP0eyFNDAazT0TbnHHorBdWB8rqDr/wDkiiAEUsXXjHBnAosDQfwAVDwtm+c/AecA3UMPJzqakh7f2j81qySPY5K3Cp4k5oh6TGI+Ce8fTg2111mRD8jv8pgk5WmuRaJ4pB1b5VgP1Vx2SHwdRIRg1zWpu96E8igXKvLuwhRQcUZGBElKc8MjildQ4kIYlRITOsZ9UH4rUxtx5pOmYSFlMnJLdwED1Ax9b63I+DtWFfu9hT9wtSnSgyMo8g9H0pRAnBUJ1ezm0QeeMpS2FbZJAOOqSP2gSqR3L+erDy3qyw2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hH75V/WM2LVZxnBqVh030EFKsJy+Y/Gn6Q/hZLew5iQ=;
 b=PLQSUsm5MKc+ynRuSEWLoq7dvAFLAXt917zkejZ9loT33CTmnz4uqYhkG/9OLnXy2WQvhc/UD9vJfqC263zhO1SDX9SBfrvilwsaRr+V83gTmZuJLl7p4naIkIeIcbpISdAoamB74kt281mO6rHlC29662F9Dzde/cLnJajOpRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] console/serial: set the default transmit buffer size in Kconfig
Date: Thu, 23 Jun 2022 11:08:51 +0200
Message-Id: <20220623090852.29622-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623090852.29622-1-roger.pau@citrix.com>
References: <20220623090852.29622-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0414.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca529437-7c94-4de7-6fb5-08da54f8063b
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5934:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB59342326E1EF442192A40DB78FB59@SJ0PR03MB5934.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9oP1EHGAYjd45eb4ek7C2AZhHljYdPt89+K29WOMl7D1gSSUuneUH8ZnAOOLLpvfJFFd6l4cgQd2uYoRyILbzKu1ApN3Z3cqnrD11voIUI/Lk/92uLXRpkLpVrUtSCAvdAR5ZPB2yalv296oZkxDsGV7jBEiTfHWUXFoJ+wjibzLpaFVg16WAYdWA+sUh8xJvum4CaLw5ZxjusXgdZNX6CCjtqMNX1WV7SZm20rFKUCN9UgM8SJ5dJQ0oQdbqvb4PvQYkB+ff17RchVeItgF/nx/4d+dtBh1ZBQaYQnVECRMfoFWMeyKl7951xbK0uSBXCUxAeQHhJ+X1BO8HPBzYqn+EJFlthsW3AKw1ENUMfT5U6Mf0N+EAzHwH1+iOmgskS5HdJh33Q7VHP6fRV23yVBVSIf0sDVNalslgSQkAgWhMAddVPavc6LWcC0jQc4eg1uoz6YkUgMuRlMLzb8J2aRtMdmefgExjIpYATG03dXrxfta1ibAddERXC7KnW58UGPWaKCDaFyqynPmodpsNLSQAnPjbN3CExUXLO9CWz4YSAaHM0ptce5x/gJNgX5MDeEK7z1wMjBCEz9XvgzW6lWS3mO3Wb/5bkJ9wf/gdX0kwQbh0aJyuzLPObH8o2IpVgh+8pdJJ8lPb/gs+vAuRBogOFslelQMQFWrNlODQTzStfbZtNauRCzQM0bNpA9oq9OA6R2qTOf/PGBw2blv8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(6506007)(1076003)(8676002)(4326008)(83380400001)(6486002)(66476007)(6512007)(54906003)(86362001)(66556008)(6916009)(2616005)(26005)(66946007)(41300700001)(6666004)(186003)(478600001)(316002)(5660300002)(38100700002)(36756003)(82960400001)(2906002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2FCWVNrK0gveHhobFl0OTNZQUt6T3lmcEpyTlNCYmRKS2pRUTF5T3lRK3hS?=
 =?utf-8?B?YTVOVjJFamkza3Fia3VYQnRmTFJGV3FsejU4cXErdzRFVjhlR2xnc0JBZjZk?=
 =?utf-8?B?V2J0OUpqdnZFN210ZzR6L2Z3ZUdtTEhvZWw1U1VGZlAyNjBTc3RaQnJJRHhE?=
 =?utf-8?B?Q09KYktuOFRiV0hMbGpYM1FWL2VxUVJuaTBlUDV0KzdMT1U4K0xFL2k3YnNL?=
 =?utf-8?B?YkxPdzNjeVpLY2oxTkNJcHQxcWlmWTNVZkRUYS9nOGJqZmxOQnhTQjUxQU5p?=
 =?utf-8?B?TUVoUlJUeVFWWWY3WEg5S0lST041amlTTDRCZW5Pa0xCUE9UL3hJenZhb2hq?=
 =?utf-8?B?MmtmUWFsTWFOMkhlNEVXdGhZa2Vyc2VMTzduaHBCa2wxVmx2V0dpQWNNSnR4?=
 =?utf-8?B?c29PcUNYVGFtSW5GYmc0UFJycEdtZm5JaUxocnpnUTYrVEhkUEVTcmp1L2tT?=
 =?utf-8?B?a0lqZTEyR0lYSkIwT1R2ZTN5b1VzUFF1bEwybWVYak5iNjRsTFFGdUxZMnBr?=
 =?utf-8?B?aDR2LzJaOUxZRzcvWXlFc0didjI2TWEwdytrbmJNWGRUY3IzbnVrYkxYR2RE?=
 =?utf-8?B?dzV5am1vTEthRVU3S2dnT3lxdk5zcmlWWmZJOW5oakUwU1NGRTkxMFRJelA1?=
 =?utf-8?B?cWRKVjRGTkFERWhTdmZ2MTRMQmtsZUh1SjRaOGZRZjdvN1lHQjNXK1hUVU5i?=
 =?utf-8?B?ait3UXB3YUVobjN6Yy90bEdsODliZDFtWHBFMHJVblo5YTVPYU43bVdKSCtS?=
 =?utf-8?B?RWFQUEF4UFh1ZVlmS29FWkxIZzdxaURGZ3VaNFN1TktXU1dycjFWSXlhakk1?=
 =?utf-8?B?cEUyL1QrclJuSWlGRzRudndBdWpvdkNnNzhmK0thd2JpWTF6Q0VEeFlXdEFD?=
 =?utf-8?B?SXFGT1dySXFiQStOclR3THJncHZ6d3lUakt3YkVHYlh6NS8xbXlqOGZSRVNI?=
 =?utf-8?B?Mm45NVkrdmx5YUVrV0FvYkZvR3ZQSjdRcW1lWFFCUWNSVXlNM1VvaFRSdUxq?=
 =?utf-8?B?akE2ZUpwOWczVU1reWlYVkFUU1JrYjYvbFI1RHZIM3ZLc2dsZzRTUk84NlBP?=
 =?utf-8?B?OGkzamN4N1YvZi9jbi9wSFltd0JDdFhldzU4REpNVDV0bk02Q0YyTXRnRDVq?=
 =?utf-8?B?WGdIRHZUWFM2QmNPc1lIYlRIRCt1cjRKdHhxMy80ZStzTmZETEcwN3VrVWtV?=
 =?utf-8?B?aHhERk9PeVRxVTk4cUI0eThjU21idG45OUkrL3dBNDRNOXl1OHpEMHVEYnR0?=
 =?utf-8?B?UUo4YWEzSXV4dXVUZjdNNnp4NWYwMWw0Y1lTVFZjZDhjOXlSd1JKQkRQaDRl?=
 =?utf-8?B?MFpXWGJRWUYxbjRlU2RJeDk2eG9SQWJkZ25hTDFheUwyRXhMbGRUQlFCaldB?=
 =?utf-8?B?OExGL3NJd1g2emoyZlBENFJwUXl3b0MrRkdtSlMyWWRMMWZWY3hiRGtBMGl5?=
 =?utf-8?B?bmZOYWdvaWVVZDhTaGRVSFdCSHdxWFIyckdJVGpyeXVXZStuVVplTWdibjZK?=
 =?utf-8?B?OG1IYm05T21XeUVjN0ZQVjJ5eVY0Vmo3ejZvc1Fhd0MzQ0dSN1hZeDc4dS84?=
 =?utf-8?B?alVVeDM3WGVoZXYwamdOVlVWQUlNODRBQTd6VWNoM25kUEkyNThGMUtKR29w?=
 =?utf-8?B?ZGJseUpqcnRscDk2aTA1S3VBblhQQmFBS3F0VWkwQXZEMWtKZXRXY1pmOEtx?=
 =?utf-8?B?MS9mRGRzcUxBcUh0Qmp6TlVNV0NSMkZhUkNES0hjOHFYS0NrUnZSYlNBTlhi?=
 =?utf-8?B?Ri9xQ2h4amdtejRoOFpxbkJCbU5HMi9FZVkxdVpFaGZaTXF2NVNIOHdacE92?=
 =?utf-8?B?QlFjSGYxb3JISThEYWk2NTFHUVJaNDlpWHBvN2lqaFJ6Nk9GdzhLWExoQTNv?=
 =?utf-8?B?YnJRb1dFa2tlQTUrdUJRMEpFT0c4QWVYaTFvTENLVitqVXNmcG5KMDlJWEJB?=
 =?utf-8?B?RmphaGdnZ3FMdjZ0YzRhRFdLK1owTzBwVnpyTHI4MTlXbCt1eHZkYUgzNnlo?=
 =?utf-8?B?a2pwYVVQUmRpa0RXdE9tWDgwTnZMSVY0amJFMGU2Rloxd2xrbGN2L09jTXdO?=
 =?utf-8?B?M25xb2ZtNy8vc0R1S0llSjhDZ3A0RFdFWGU3Y2t5cUd2a3hhZks1Nk9hS29k?=
 =?utf-8?B?ejBBcnR5dUw3Q0JLSEFLTWZjTlBHcVBsb3lNQWRzcGZWanBVOFhFckVndERO?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca529437-7c94-4de7-6fb5-08da54f8063b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 09:09:06.1245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsHlx25bGx41C4AxIPtnrjThZDsjyIjp3kgoeCqIpQwZB+UrHl/3tX3l5o1az4Xa5cQUI99vDkEFloGSs5u+hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5934

Take the opportunity to convert the variable to read-only after init.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/char/Kconfig  | 10 ++++++++++
 xen/drivers/char/serial.c |  3 ++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index e5f7b1d8eb..a349d55f18 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -74,3 +74,13 @@ config HAS_EHCI
 	help
 	  This selects the USB based EHCI debug port to be used as a UART. If
 	  you have an x86 based system with USB, say Y.
+
+config SERIAL_TX_BUFSIZE
+	int "Size of the transmit serial buffer"
+	default 16384
+	help
+	  Controls the default size of the transmit buffer (in bytes) used by
+	  the serial driver.  Note the value provided will be rounder up to
+	  PAGE_SIZE.
+
+	  Default value is 16384 (16KB).
diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index 5ecba0af33..8d375a41e3 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -16,7 +16,8 @@
 /* Never drop characters, even if the async transmit buffer fills. */
 /* #define SERIAL_NEVER_DROP_CHARS 1 */
 
-unsigned int __read_mostly serial_txbufsz = 16384;
+unsigned int __ro_after_init serial_txbufsz = ROUNDUP(CONFIG_SERIAL_TX_BUFSIZE,
+                                                      PAGE_SIZE);
 size_param("serial_tx_buffer", serial_txbufsz);
 
 #define mask_serial_rxbuf_idx(_i) ((_i)&(serial_rxbufsz-1))
-- 
2.36.1


