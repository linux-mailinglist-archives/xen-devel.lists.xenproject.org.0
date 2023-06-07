Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2341E725B9B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 12:29:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544688.850639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qOo-0006Cq-6Y; Wed, 07 Jun 2023 10:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544688.850639; Wed, 07 Jun 2023 10:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qOo-0006Ay-3M; Wed, 07 Jun 2023 10:28:18 +0000
Received: by outflank-mailman (input) for mailman id 544688;
 Wed, 07 Jun 2023 10:28:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E03=B3=citrix.com=prvs=515218b52=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6qOm-0006As-Im
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 10:28:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 005658bb-051e-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 12:28:12 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2023 06:28:06 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW5PR03MB6905.namprd03.prod.outlook.com (2603:10b6:303:1aa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 10:28:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 10:28:04 +0000
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
X-Inumbo-ID: 005658bb-051e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686133691;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mGcXTwtFwH6ir4Rg+tTeHYeMBq4O3wqYS4yOihdIj6A=;
  b=AcZ4rDh3NlKPONWu0C8fWBhFRVslavX0Wcq07At/GJUKcZ/FS1RzBx48
   XvDolwp9c4Oq4SP02oz2GQJ1B9+7V9Ik33Lq/+hJl4/+VOd4VviyPNJlj
   +KOuDo/U8aLIXEjY7tlwmdKhF3xhalhhz2SWKexAwx9uLtKEVQ6XMX9tG
   4=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 114400577
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4p/qqqgSD5/l2HyFgDI9iodSX161/BEKZh0ujC45NGQN5FlHY01je
 htvXTiFPayNZ2CkeownbYmyph8H7MfVmtRqHVNp+XowRnkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4geBzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQdFzIoMUqiqd7t57+dW7crr5V6DfPSadZ3VnFIlVk1DN4AaLWaGuDhwoYd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluGybrI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTkqqYy3QLMroAVIDkpC3Xjrev+tnSnB4tOC
 XEouS4HqKdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHmL+ITXOQ8J+EoDX0PjIaRUcIaDUYVwID75/mqZsqkxPUZt95Fei+ididMQ/3x
 zeGvS0vnYI5hMQA17i41V3fijfqrZ/MJiYq4i3HU2Tj6Rl2DKanaJah7Vzz5PNJPoGfCFKGu
 RAsi8WYqewDE5yJvCiMW/kWWqGk4e6fNz/RikIpGIMunwlB4FamdIFUpTp5fUFgN59dfSezO
 RCN/wRM+JVUIX2mK7dtZJ68ANgryq6mEsn5UvfTbZxFZZ0ZmBK7wRyCrHW4hwjF+HXAW4lmU
 XtHWa5A1UonNJk=
IronPort-HdrOrdr: A9a23:lehyJKlUiwu4u5LbBt3+I1MjyB/pDfLc3DAbv31ZSRFFG/Fw9/
 rCoB17726StN91YhsdcL+7V5VoLUmzyXcx2/hzAV7AZniDhILLFuFfBOLZqlWNJ8S9zJ8+6U
 4JScND4bbLfD1HZKjBgTVRE7wbsaW6GKLDv5ag85+6JzsaFZ2J7G1Ce3em+lUdfnghOXKgfq
 DsnPauoVCbCA0qR/X+PFYpdc7ZqebGkZr3CCR2eiLOuGG1/EuVAKeRKWni4isj
X-Talos-CUID: 9a23:rO20AmD4DrzG4Zj6EyxY9mtLQOELTib6wVHBfQiRWD9IcoTAHA==
X-Talos-MUID: 9a23:XYWpbQW+t3Ofwf3q/BvT2h86ONUv3563VBkcs6g6+M2tMCMlbg==
X-IronPort-AV: E=Sophos;i="6.00,223,1681185600"; 
   d="scan'208";a="114400577"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGtRE38DiK3FhWlwAN00kNZyXePem5i/OevOWk67de1f6HubN1wf3oHMpbNIa/L5/+I3L6uGbw8KCFVTBZtARB4Tg14wbavNdA8N6LqcYsVDeouRNbO/AKyg3Oj0jOXJemr+r7QyuokTUzeVZdc22XkQrAQ1dz0tS7MicqGO0d4Sk2F9V9OZvrDinLsYj9k/pya0/FAj0Yt2+B4cu6516YhloO+9++Sm3gqCkBoSmWRzqJnCnbAUQNXf6cA6tvm2gDVvskDBNN8uovHJXk45O/5gP3fpTDg8PgTdSuT6LGBh/vPvf4leh8EzaqKh7+E/9buP4q4itGPu+GSydwcdqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zf6HOy8l9I2/Q878vB2/jqKosS5kysyoc1OjHEG+dOA=;
 b=gqIG+kofKvINr3l9OeXlcunDLPWfygFPyiRKI4M0mIrtUd8DW6Wl/GShaRm9XMFw3jc02b8UroWqXFQ34HsraUrJvprLjgFW3BWauKlFxe8p39DX8B5jnH9czVzvUtp5p0dyzvX/HDofFDE06RcxTEMqWJjdXYbji48auckPAcCYSBt3+Bw7YolXmzRKBux/uty/60gA3U+3zbvjpNlcGIJ/oqXCdbhbqGfDBnrLpn5ZqSjgPxSC2Bv7omISgPW3ROpoIGmTJoqrhDjbDUwZ8eGnRwmRUY7qGalXaXh7nNRdX2g9iUyFS0BeoRdwZxZFJp3vAV+avMwc+yom/Kml5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf6HOy8l9I2/Q878vB2/jqKosS5kysyoc1OjHEG+dOA=;
 b=Msy4l3Z13DaUN03yrbEF1pXtLoflaMwnzvF6o1B5yNpq+jNzmIpmo6EQsF+g4UNujymKpTO07k2AnsovRC5nbOth8e6m7lQHh9HpZoGyg2rEScDCOyhS9DWCTbVWlQNFYwrieWkonqmFvswtVmNaa+BA5FcN+7MKY5h65/+1oaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3857ae6a-0c3d-7d19-7706-db3dc4a08a3f@citrix.com>
Date: Wed, 7 Jun 2023 11:27:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] livepatch: apply_alternatives() is only used for
 livepatch
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20230607090120.49597-1-roger.pau@citrix.com>
 <d8048c61-4b81-0527-444e-fdf6f38ccb3b@suse.com>
 <ZIBLOYiAFE8gqUY0@Air-de-Roger>
 <d6bc24eb-8418-fefd-b247-5d945ea0e396@suse.com>
In-Reply-To: <d6bc24eb-8418-fefd-b247-5d945ea0e396@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW5PR03MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf06b88-fb53-4080-1f96-08db6741e0b7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zf9HAGrduvOq1RzSPWM5hcv9WHR8jImpneS3Pmc/Dv23BDqL2PElNop3+SL+FA6yVPxPEH0i40qI4mpCufIev8nxTGRSHsiu6ugKv3sS1ldIrUUoUIvbJ90siTAgw1ShbdhpB8OnvMRIc6yr2AtuHQYrnf2qRXRdznVBIf4csrs5xvFKbZZMYOuK+2Xs642nGwJh+RooKtSjK2+7/wTeCafoPtB6BXHDY18/i9gWWARraft1tN3BWqhutBSPeIRbglHF3WhhZONwug452Hwu0kO1ebbhE0qdQegyRUuTY+4pb/lKBAl7mxkHfm4Z9LtEkdk6Mc3bDEGRJ1Pam4G6WZ/5VgOLqwm8EbAxHCzNw12nZ1J3a4YZKJDKKbocyrRQ+joLJFFdjK02e6nTt0Nba5OgJWnQm8fcORgTH5herjguHjvket5j7592y52edFWTm5dLQCQo0jO5a7rORh3biKoc5akpey0inmt8amLh5SqV9R+quiwkb8q2uZvDOxLIZN4DHvDnAzm0wmBxaDy+TxagZeeTF0fahEUCh7iJ0ZPqxtVs6M5G9tt+2wzW0BZdpXfZwU9/4FRklSCVaV+WW885LuuS6HWJVQPkaDiaBWTAFcf/wflaBC68+poBlvw+AF7+bcZ0VyLrCj6TIx5dHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199021)(2906002)(31686004)(41300700001)(8936002)(8676002)(5660300002)(316002)(66476007)(66556008)(66946007)(6636002)(4326008)(110136005)(54906003)(478600001)(6666004)(36756003)(6486002)(186003)(53546011)(86362001)(31696002)(2616005)(83380400001)(82960400001)(6506007)(6512007)(26005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R01vT1MrOGplcEZsTGxtaHcvUTdQakp5dlcxcTB1NzZ0cFVmS0Q1cHlySmpQ?=
 =?utf-8?B?TGs3TEQ1RDJQYjNnRFd4UHhTNExocW5DbWhkWnc2OEZTTWp2L1hScklrd0xY?=
 =?utf-8?B?My9TRW1JOVcxbGJ4MjBXWjludUdDSGQzTzNwZGpkN2hDSklBR00wVkZNSU9a?=
 =?utf-8?B?YTIzekFQVGJZVUJDV2lUY1BzaURyUEttV1I2TUlPUnAzS3FJcFVWNmJiZkVY?=
 =?utf-8?B?Umg0Q2YrY2NWL3dxS1ZKYlpOZHB2QjVkSHRsV0RSb05oRk1Hc0I1ZjBVMGcv?=
 =?utf-8?B?T1N1MkJ6dWtWaUVacGR5bE1ENWF6WmlrVWNIWWY4YkRlUWZjK05aaE9pV0pO?=
 =?utf-8?B?RWduUEpYMDhzMUh5Snh2aFhBc2ptek92U2tuTTE3NlZXRmNRRm90c2djMjZO?=
 =?utf-8?B?Nk0ybnJCcFFFaGJrM1Zuc1J0WUh5RzBDMXR5UGVtTE9DVllvV29EOHhuZitt?=
 =?utf-8?B?Nk1VcitmRXJxN0ZZZThwcDJyWmxwVkRiM25wN0FJdFUwWnh3a0NaS3BnTmpL?=
 =?utf-8?B?WnlHcWo5ZHRmM1JhT3BmUUgvcExIRmFoWHRlaE5GZU4yRjVKUUpRWnI4YUpM?=
 =?utf-8?B?eTk4d0JsQ0NacEFYa3kvSWhrNkFUZTJJMmhEMFE2OTF3TWJMWDN1RUNPMGxj?=
 =?utf-8?B?NFlvSGlSY0V0RWhrS09ROHdCYmVlUzJKUEdpK1J3Z0pqa3UrdlZjQU5INENp?=
 =?utf-8?B?ZHUvTHdhekhYUkx2a016TFdzdVlwQzBZblU4VU1qSGxnUVF3cGMybUFuNXB4?=
 =?utf-8?B?NXB1RkI0a0lTOWJrcG8rRjdLUU5YYnRrZkhzeEZyMWNJYkVSRU1CM0l2N1pm?=
 =?utf-8?B?c1N3V05Wc1hvQUFvWkxaSm8rS0xCemd5SkRmc1JhdHA4Vi9MTDBUUWJpajNY?=
 =?utf-8?B?czF1TURQT1p2UEh4TzdGSnVvajYxQmxLNTZOb3Fpem0rNmdZVVpRVkN1Zjky?=
 =?utf-8?B?RG5JSTRXUmNLY3ZSRHNMallYZFYzakVyVEY4V3JXS1psaitGaUVCT1cyUkJv?=
 =?utf-8?B?NnRYaXF1QmlTYjNrUXFSb0g0QUZZSnBXR3pIVlg1RzJFdExPcDd6Q1loVkY3?=
 =?utf-8?B?bWVxaVFvVUMyS3Y2eWFjVWFSdDZkdndGb3h6d3d0Uk5jV00rK1NlbjZ1Z1FV?=
 =?utf-8?B?QVM0dmlmR0ZzSDB1NlphWnUwV1JMdGFETmpMcU1FSmVYVkV4Y1R4KzJCZHgz?=
 =?utf-8?B?VjZ5T1VabHkyVGFvaXpMVHV2QUpTV0lRRDN3Nnd2dkQ3MUM3K244UmFBd0RE?=
 =?utf-8?B?RjV2MkhyTDUxUUduM1M5VncrWDJHT3kvNlNHRTFVbGdwLytxY1Y0d3RYT1pY?=
 =?utf-8?B?WWFycnZsdDVIMkp1L3ltSG9ndkh3SHpzUHNmTHp1Qzl0N2pyWGdwOTh3Z1Jm?=
 =?utf-8?B?SFliRVlqRGdVMHNzK2k0Qkt6UmcwNnEydWFVbE8zbG44SVdqNVZoSmNKS1ZO?=
 =?utf-8?B?U2gwbzd0eWtHdWdPbml3VzB4RlBubVNoMXBqc2FVVjFsdHpyaUxyNjZPdEFO?=
 =?utf-8?B?SU5uZDJ4cU5WUjBhVk1ReDFwL0xtRVZtTkpaTGEyYi9WTnRhRXpJWThzRlRV?=
 =?utf-8?B?bDJNNFhpZCt3TklFc2k4M1JIVVBONWVIK2lYOEhRQ2dPRTIvMHhmRkQzZCtU?=
 =?utf-8?B?Vjk2bTFiZ1ExeWVITHRCVm94WDhOSzUzRHdVTnlCY3VKUkpaK1V0eERZbldG?=
 =?utf-8?B?cFhiOHBnSCtHdUlHS2kxa2ZvNlJyK0RPVHlMUzVIZ1pQVjhnNmxlcDltbWdD?=
 =?utf-8?B?OEw3aE5sTm1GaE5QOEZ0Sy9Jb0gxOElmckJBZ0VtQU1qbzEyR2orZFIyZmJH?=
 =?utf-8?B?Z096eHFkd1VQcjhxbVVuOVdscHBaM3MrMGxYVDZoRlZmZzJTK3dDdk9JcEUw?=
 =?utf-8?B?c0VZZmF6c1ovOHcwcU9IaTRMdm1yL21kUkNaTk5qR2xpeG56M0trVDNHR2hY?=
 =?utf-8?B?ZnVWYTRWNlB2LzdEaHVab241dHZsUExBbitadGhYdThKMjhkbmJQQ0pTMnpo?=
 =?utf-8?B?Z1N6aUxNak0yeGgwOSswTzVHMEk5Q09PSWQ1cW5laFh0RWY2VEwxTjBpNHFK?=
 =?utf-8?B?VjJxTlMvSERnZ1pjemNaYjh3OVA0U1UxZlE2VlZkMEhSWmc5NHRMSXZSbHlq?=
 =?utf-8?B?QzdrUEFXQkdPTnRGOTBDNko1a1ZhaVdLbTNZRnVuM1RKRVEvaHkzemZtR25F?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VaXqMIXsKqupcKIz/KARI3szLxYgCjEitr9jo1mJm4TKkmAiY194Amu+ajcdj2IG2PWQl0Hht8G/45YFIcXXJZIZU38zLtsq6eLtDdDNkzunmr68DtK9JUnFN/+un6CsVA/FSGtB9umNwwsG4qkMMr2DbP1f3D0FNE7tfl2zBABqp1Hh8CjTdvSuXTaP0aEs/23dZniAVaoE6W3Goj8lcqd5+QeXDhEOSzkQ+gp9UhvvDD0qH7CTEJk9yn8g6lyI/bBZ/gRZnbRUulNX0hInmoIylm8H61ZXmN1xpTs+nCtbaYjckAknB5Gligr7XdHXsI3Po/jJriUB/TFt65bh/+65DoPE9HrIW0yLRaKj5OqrFMF8Ju/C4NKkCdUjCIt5SW02LOenmFG/0ctzAh2GWwnCHcuqeuhLle5UNCmWCDKre1+/PC6UNWbWlNhDyYKT2KrGt4eWLOchFjgT1wEqnNBaddXkm6ezR7iIBW8VrLx3KKB2PWevFgJYvfoyLjjWyl7FtnKmwf9sRQ2+6MYfFeJihyI3nuhGm/DYL/amNw5R6BVhSaefkL1ibpXn5NNDcAENSdZkwJrt0eC+/bjhQTGYIxiljEUu2e1fXVJiL3+/vutH3Hs4rbsWxHmpT7BxJjjMY2d16oxU/6pYFVllteUyiehmqBFKPiF/08SRCCTvoveNunpjkoY2KzEdhnZVgY163gjEs18hkB10g2RQ+CuHwljnu55gpCSMwRr+Su+x/1+wTYYeEGAHmeHDQcBwB9f1cSLFTanmz1XiomODbnUGubrcqxa1Y6/NuGikHijet8DGsZYd/+czOJ65bM4SyaxPM29mxAZwY7OlrEXBrbP75GcwBNNvOxYKXYFdV7sJxWBxC2wSWa0N4rA5tZe7OiX2NWmdYomilca0JWZ02WDaMIct+FBPRJ1F7gzDlb8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf06b88-fb53-4080-1f96-08db6741e0b7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 10:28:04.6100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75rkFPbXq3vag6Tfa78M1Z+aUuvhgegRrfoTepMA9gl8Orx/BRIWd7YrUMJXhQRV1Y4uap+K2uerthDWM7LBnU1z3tfruBD99nhxi823P2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6905

On 07/06/2023 11:19 am, Jan Beulich wrote:
> On 07.06.2023 11:17, Roger Pau Monné wrote:
>> On Wed, Jun 07, 2023 at 11:10:27AM +0200, Jan Beulich wrote:
>>> On 07.06.2023 11:01, Roger Pau Monne wrote:
>>>> Guard it with CONFIG_LIVEPATCH.  Note alternatives are applied at boot
>>>> using _apply_alternatives().
>>>>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> albeit the implicit ack therein is only on the assumption that (apart
>>> from me) it is generally deemed better ...
>>>
>>>> --- a/xen/arch/x86/alternative.c
>>>> +++ b/xen/arch/x86/alternative.c
>>>> @@ -358,11 +358,12 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>>>>      }
>>>>  }
>>>>  
>>>> -void init_or_livepatch apply_alternatives(struct alt_instr *start,
>>>> -                                          struct alt_instr *end)
>>>> +#ifdef CONFIG_LIVEPATCH
>>> ... to have the #ifdef than the init_or_livepatch attribute.
>> But the init_or_livepatch attribute doesn't remove the function when
>> !CONFIG_LIVEPATCH,
> Yes up to here.
>
>> so it's not a replacement for the ifdef.
> That depends how you look at it. We don't meaningfully care about a
> few extra bytes in .init.text, I think. So it really is the Misra
> requirement of not having unreferenced symbols which makes the
> difference here.

A different option, which I've recommended before for other reasons, is
to build with function/data sections (already supported for livepatch),
and use --gc-sections at link time.

That would remove examples like this from the final binary, and there's
probably wiggle-room at the MISRA level to say "we comply with this
because the linker deletes it".

~Andrew

