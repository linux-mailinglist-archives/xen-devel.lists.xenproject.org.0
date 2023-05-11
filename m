Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CA66FF029
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 12:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533239.829725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px3uf-00018f-IL; Thu, 11 May 2023 10:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533239.829725; Thu, 11 May 2023 10:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px3uf-000164-EJ; Thu, 11 May 2023 10:52:45 +0000
Received: by outflank-mailman (input) for mailman id 533239;
 Thu, 11 May 2023 10:52:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px3ud-00015y-6l
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 10:52:43 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe12::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3f5e3d4-efe9-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 12:52:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8229.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 10:52:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 10:52:39 +0000
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
X-Inumbo-ID: f3f5e3d4-efe9-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGNjF7ujj5T87kLnbsdvZXVxan5AhlRJDxhJpZE97NBwwjJfFmuYPzDGd6L/dw2NxUK1we7R+QwfhineOWnE5tXVkm9ko24i1efq6DmXs62lXc1XHSgxEXPqW4Wr7gHbT2g/LbPMAsP5F65O6pLQOKBaTUgNAY0ivIzCvnwbgplyj4M1FNp5zp3knzfFRToBOwCCy4pqWgeKnOILjGsKpEHV8iE85kn3GSfg4HYjt418YIq9MOab9WczZ19XOvZNLleWrYSID/nZka0fFvE4H7nmIBD2NJomeLld8zCTx7hLDtupdH2caAtJye3CIvYWOexTkmyWU3fYnNzepvohjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6u/rsxx3sp3nxzMqliZNEaZmEduBvGJK2C3yCtugYg=;
 b=ZOx1BVBohtC4elwBf6j67ZAULv2WsM0XvzOM7Xu42Xt10dB7yK415yJnshRtEHYXOBZlekS9XqGHg7MCUah9bcIrW6rW4KiudpKOkTCfsNH6dCMH0ccPB5uXBmng+k+hl/ELqptKdTsVAKLQ+DEVoyl5Q9JEv9b+mstvT7aNstwI4e2AkmGElp9BvFO80zdENUSLbRpPM6cHMnilTdmqHWB+TEoYx2Os3pfdEovcyinq07bco1lIuW2b59H3SqlslHKGMZiumK2rKKuCHB5m3ftDzUoqWiho9w4meHL6cA6Eg8NATkA91clbBuKiZOCiIgDOMT4TP5MU5AEAL55wig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6u/rsxx3sp3nxzMqliZNEaZmEduBvGJK2C3yCtugYg=;
 b=V4XLtjsD/12dowB/HJ/9uvjpcg6DGCP+RIPrCKg8b31QRkSV4c3zMVf+Ks2SRfWquO5UTI5TNq7w5IrZ2hxfwmBlN1nIRqc1ww8keeY5aa6Q53oOYH8ID7Tc78pO+CgjWhaTelx0w3jpQTaSBxzGqLmwaN78fxFIV2GjkGBG60dg/0zd2qq2aRe77p8YbBvZ+GId7xhKYNsXDXhhwQE/klppAzSpmmsZmmQykVfcurCbIqrMi5xXCSPLFLYCUm4RjBs8FC4wuDiS9BmFqoUdg7+76I0LcebHGUhlc1cezlcMo7s4ZOK9V4K+Pk0WlNYSO/coauGnqsgixZXhvV3IfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4bc416aa-8ff7-f2d4-c452-7494f6d2473a@suse.com>
Date: Thu, 11 May 2023 12:52:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] domctl: bump interface version
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce9d5aa-486f-4db0-0252-08db520dd6ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	boE6xavNhRVC+MtK1l/QKmHfVv4VySe7hQozrxRj6ikxo1G83uFwFVXvvBnpkhldUaulgZPcL/BIMBwjDn8D80J7R8vP6r6LSCviSJeWhQwCFFBBVwdfbIEaeEOVXFz4IORJUZQr9wLD6vOO8I+ZSP/Nj0U5/AOsdQMKP2gtNLSQS/w4mYlJE2j3pp/8c5QU1t+XwbYGXKadHS5tIQkBJa8hyvbNY1ax1TSP5SoeYF7m9WWg6mOhmbjsEn3/QyFS0SpxHRISnJnCVX4MMcdn5VdwxO4KzY9Me6Q0+NB4xyRE6bc2Oxkf80Ho+xsX/ilZlvGNpYxzJP4/1ouajKLAMJiZFFwm9/bkZvcXr19JkSq0fA7ESfIyrPWbfhWyQN1qOwpr3v23BMZgIAWkrQTSef7gt9GQmoTM+JI7EDANohnmaW3YVubrN6ugfiSdXUi/Nh0CE+oWmaok8DfQNWwcfYZEgG+vJrcfMRxh7K7at2R5fVp9/at6Ca+/+DokqxbRbr52DdXO18RsOSDQFxPQr8SHnMMSljDOW4GNptXdZQXoeWPEpHK5C2WOFiT9EMwyw2wDHgTJomSbXoHizCDfSiBFB6uEzDHw6AQZGO1NT+/7MF/ALG1v3UY2I2E5qidQumEa1ikkVbLrtr63LAk0aA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199021)(4744005)(316002)(6666004)(2906002)(2616005)(66946007)(4326008)(6512007)(66556008)(66476007)(54906003)(41300700001)(6916009)(6486002)(6506007)(5660300002)(26005)(8936002)(478600001)(8676002)(186003)(38100700002)(86362001)(36756003)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmRnd2huRmprYkR2dnNxbWNXVUpQRnN6VERpSkh2cy8vc2JTMEFKUXZIM01x?=
 =?utf-8?B?dlQ4NVQvZFJhcjVWQ05YcFVhT2p1YzJpQWozRG9iZFZ0TlVCb3Naa0FmRDc3?=
 =?utf-8?B?NXZuUlYzd1ZBY05ya2pXdlQwM3VKZFlkM1hUSFZ5SEtHTWhOZnlIdFdzMm1j?=
 =?utf-8?B?V2pxRG0rNG02SHJzbWdzaUxEbVdhTW4yYzZDWGpVeWM3N2lMNjFwYTFOaFNW?=
 =?utf-8?B?TnpMMC9MMlhkbms2dkpKVE0wL2pJUThQUHcxK1hxa3BYWmEwOGRjdnliUmF1?=
 =?utf-8?B?NFUwYkcxTkgyTzZRU05RK1ZMVFJjZnhER3NPdnBaRStnaDUzS2JLVkpzNFM4?=
 =?utf-8?B?S0R5RWF6VUZKbm9kSkhCRGtHTTVKejR1L2FhYTNkc2RDOGRaZmVNYTRNcnFz?=
 =?utf-8?B?MFZ1NUxPU1lraXo1K2RtRHlCZ2p3OEN4RUZjSHo1ZEo3dndwbUlRWEg5aUdU?=
 =?utf-8?B?QkMvL2hSbmJlSmtyUk5nSE0ycnh6U3plR1pRRUhHTEIzL1BTU2diUGdMZGJ5?=
 =?utf-8?B?MWIzVHBGMFpJUWowMTNjZE9XaWVpcHF6bEkyYnRHNW9rY0J3bFRQUy9RWHNq?=
 =?utf-8?B?L3RTWnNibFh0WFpSWFRML20rNExhRkFzS21tM3M1THdUaEM5VE16UkRMSDRZ?=
 =?utf-8?B?UGNpWnRXQUU4NEVUWXovMFo0QlkyVUhMdW42TG5HVVpSN1QvbTdLZE9vNjNy?=
 =?utf-8?B?Yk9WWVpwQjJZY3lrRnllM1QvWWw1WjVmN0xRNjc4dHR3c092RUZPeHZGYWtS?=
 =?utf-8?B?dEN0NGw2ckZrUnhwbWx3cE45WFdCRUxGQnc3MzlMQnRlTTB2eTEzMlhZMnVw?=
 =?utf-8?B?cERFaHZveHdONE9xbWxPQlZ3Wk5ucmh6RmFPb3VYUVZQR1hYU3FDQU52dDAz?=
 =?utf-8?B?N0FrczBHV2JDSTJucG92aVRjWXVYYU5yVktBK2QwWU9YMVhOYmZUMGwva2d0?=
 =?utf-8?B?VlFsMG1zVWc5VWQ3Qkw1eWplQ3NpeGJXb245dm1uVGV6b0hyOVRYZ3BXZHV3?=
 =?utf-8?B?NTNiVkdJcVI1RWIzZEovMzhYekQ2RERRQitJZmFRMlhSdGdPM1Z4d21RdlJ1?=
 =?utf-8?B?Yk40SlhwWGhrU21ydFJUUFhKWEd3bDVIS05Wc2VlTlh6bHR2SkZSTXdHb0xR?=
 =?utf-8?B?ODFIanJCZGQ2U2pCZGVFMDRacGU4RXF6T0dUWFQ5dnY5VjFOQ0F5dXdicGta?=
 =?utf-8?B?WE5lZnBnVW9aT2VPTDQvcHh5YWpvMVFNRkl2SkdOL1VXeTdqdEN1cXhwT3Fa?=
 =?utf-8?B?TWxIVVE5N2l4YVEwc21SbURlRURpMUEydnlWblMvYjI4WFRGalAzOHFUdVJX?=
 =?utf-8?B?QkZXZ1E5MG5jNDlNY1pIbHVubXc4WThQTGNNVzkwRFBzRjFUOXJRR2o1d0dL?=
 =?utf-8?B?SGFkSVQ1NVMvdEVUeVBWTERXbHZiejNpbzVSZDRuM1gvS3hMbFVzVU5tNGYz?=
 =?utf-8?B?cWtPOUlrb3BITTZtZTBnN0pQeGx2QStPWHZBYlgvQmh2Tk1Jckgwb2ZYOHE5?=
 =?utf-8?B?V3YzbHIzNEFSdi9xcUNjRXQvSG16c1BHRkN0eFA4L2tZSWpuTzNqRUp1VDM1?=
 =?utf-8?B?U2F3SGpyT3NGNDRIQ3crZTVLVmRTVTdRRm5zVlZwaVVuUmdMSEIrbURYOXZW?=
 =?utf-8?B?K0ROMnRIRktkS3dOQ0I1K2R4Q0U5RWxRK2RzK1dMNVpvODNqN1k2S3NOdERp?=
 =?utf-8?B?OFc4eVFFNmh3SERmbWxXQzdWUHFqeHlmMlNOSWRGbjdyOGhuQ0l3SmhvUXMw?=
 =?utf-8?B?TXlRSXBPa253NlQySDRYVlRHMld3YlZDV2pZZ2dObXhldy95RnpkRENOeVBU?=
 =?utf-8?B?K0ZTQ1hkSnB0cnBvZUgxR0FLLzZqZmZqTDhUMk5DZGE3TXd5YUg4aW1yQmMv?=
 =?utf-8?B?V2dqNUV0TEx5ZjRjcThPTnQ1eCtyM0t6dEpiOTUrOGNkUkNrdVBaeVRxT2E2?=
 =?utf-8?B?bWlzTy80VG5WMGlJakNuY1pwR3FKSTc1WjFZZFR6cll6dWE1MTFKcWZkV0Rt?=
 =?utf-8?B?M2ZsVFdTaXZoRW44Uk1uTWd5MzYvbkdxLzh3VzJVL2g4L3hFRVFNK0NuVDFL?=
 =?utf-8?B?NTZGTTBQYUY2WTdqbTJzVXpTeUs0bCtFYkVUcUdnam53THUvZVl1VnUwbWR2?=
 =?utf-8?Q?4AmviPBwV7JphfDhJtzL9OWkm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce9d5aa-486f-4db0-0252-08db520dd6ba
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 10:52:39.5289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4v/Lgh2Hf2COgdxBFOv77AkwV0FQmvL98Pmw7mBiBn+I7mOdymHdc0q67lnIw7IRnhzMXZhE4G8NzEMxHMtqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8229

The change to XEN_DOMCTL_getdomaininfo was a binary incompatible one,
and the interface version wasn't bumped yet during the 4.18 release
cycle.

Fixes: 31c655497461 ("domctl: Modify XEN_DOMCTL_getdomaininfo to fail if domid is not found")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -21,7 +21,7 @@
 #include "hvm/save.h"
 #include "memory.h"
 
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
 
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.

