Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 660B57D8372
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 15:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623813.972023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw0MC-0001TL-JC; Thu, 26 Oct 2023 13:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623813.972023; Thu, 26 Oct 2023 13:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw0MC-0001Qe-FL; Thu, 26 Oct 2023 13:25:04 +0000
Received: by outflank-mailman (input) for mailman id 623813;
 Thu, 26 Oct 2023 13:25:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iwvv=GI=citrix.com=prvs=656fec104=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qw0MA-0001PM-Lq
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 13:25:02 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f4f7692-7403-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 15:25:00 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2023 09:24:51 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5078.namprd03.prod.outlook.com (2603:10b6:a03:1e5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Thu, 26 Oct
 2023 13:24:49 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Thu, 26 Oct 2023
 13:24:49 +0000
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
X-Inumbo-ID: 0f4f7692-7403-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698326701;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Djp8hlenDBZASoQ3Z3ki/FMOMTKu+pNox9qJhFT5C2Y=;
  b=dz8UKB9vtUrTiFd42yttuj2YaXPuowtChU3rlzhjokdDx5l3YDsQ0G+0
   gKGHgtTchu2wg8K1siogtw0EkfXccnVlzu/AtIQ2gmbq8wUfx2MGP+/UO
   5fNQ5jZ2L9HRxqClnxTfYGk7lShcOXUapamzqs+DHHJDTSdhMDuJqBMSt
   w=;
X-CSE-ConnectionGUID: WwUeDMUkRny3uJ/N7J4YpA==
X-CSE-MsgGUID: v5CVYyHGR3eshHgPKdanWw==
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 125319086
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:C6/j76nCx5IYGD9aV0sOw1jo5gynJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcDDuAPveDZ2KgL4p0O9nlo05S78KAzd5lTwQ5+y81RSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkT5gGGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cMHFT0hSy2AveSnm6+ZDc8zpJgSNOC+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieC0WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHmmA9tDTO3mnhJsqEPO7VIiGT05bwC2uvmZhXadV9tZF
 FNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqYCYFSU4A/IPlqYRq1hbXFI87Seiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAszA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:IRo3qKlpoNhRN+RIkik8SYSxN7jpDfL23DAbv31ZSRFFG/Fw8P
 re+cjztCWE6gr5PUtLpTnuAtjifZqxz+8P3WAxB8bFYOCFghrTEGlihbGSuwEIcheWnoU86U
 4JSclD4bbLfD9HZKjBkW2F+hUbrOVvMprEuQ4T9RhQpHpRGthdBs5CZDqzFk1zSE1YCYEiFJ
 yaj/A32gadRQ==
X-Talos-CUID: 9a23:JVnVqWCbTxA5gKr6ExZ4yUM4P/0mSHvMl2ryZGnnKzpYUJTAHA==
X-Talos-MUID: 9a23:byBCogivcolIkVp6M7f+PcMpKppD3ZW/KG83ypgdu+mLDQ98MjGik2Hi
X-IronPort-AV: E=Sophos;i="6.03,253,1694750400"; 
   d="scan'208";a="125319086"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCx2TjLg91oRVgFDblwno5uvnhwgvYjLZv9kxCpqwh0VLCxeDt3glslhVAko9n40fRYKk2MFILPqAnfreymJR4RkjrDx3vMUruQGDx0wl7mw2TQyT4XFDPzqpBE9/GBF2x34T36JXWbKO12HTqwKE7RHGBkE9mpHDiMmc4ck9aPpQVdyWS4nVU2A3cXOV1Dr43W0mQ2ulxpYpt3xAOXyURI1w0Cd7U8I16u0CmGAC38jcIlijeyY0SVmKMSfvQQAQn03bqKqA9RPvCJk24f7gOzTSK6VCJIm3rLB3KdmnvG5sGu88Sz4ElJ5uD2xHj4a3PoB/iwPRK39N0Z6+P/mZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/mmP/GnLyA0cnqztq7H0FcYsONSfuIxFrqUb3Vb40c=;
 b=G4cJqXNqtX1CAuPGTRLC0stKbazw2RievXLloU+7dFxLqDBO+UCvzXTnFfftCZOFKt5pycU7sZLeJMsrJguDRp9/BvJLNZcSqIjQw86Fvj5flvThRj/ixcDyIkfYIIfrSlpTPxA3L8XNpJYTJmkc5N4Ol5JSqFed2W7pB3uE9IIF3vxm7AZa6toddCin+v8R0NQFgbL73rVZSUY3mlVbUGF+zTG+D+l1fDo6lpLABjsFsuJcFCvuHwRMRoCVT83j5xVb32B/N7F9SO4flT8SNxE1TZ0FBCxiqeXgUNXkox1/vGlfK4gQLT4Pvuls653cvxZVFWQYGljbSW9szHl8hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/mmP/GnLyA0cnqztq7H0FcYsONSfuIxFrqUb3Vb40c=;
 b=iQbBtG340gj2YLOyfyeClGDMlNU/F5S/peWOR8edPavtc111qczLna9gTrbgMoSR9SqG5EzLtkrXDMOem6H+FZInEUSF3v5LqZ9aZP7Uim/5GwlXL7jfzlA4wNB/bdPa4D2Gk9Eo36KsFtAvIsxJI38mkcFRHjHHPdSToWQKr4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Oct 2023 15:24:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 4/7] x86: detect PIC aliasing on ports other than
 0x[2A][01]
Message-ID: <ZTponIYDYDWRZhzi@macbook>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <27dd8f40-1ea6-1e7e-49c2-31936a17e9d7@suse.com>
 <ZToksEP1Fg8MscdK@macbook>
 <86eb1c0d-ac95-247b-16c3-9c4871398082@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86eb1c0d-ac95-247b-16c3-9c4871398082@suse.com>
X-ClientProxiedBy: MRXP264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::23) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5078:EE_
X-MS-Office365-Filtering-Correlation-Id: af5a7446-d71d-4fd6-5609-08dbd626ede5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j8APmCc65NIeujdpNx4YhJ4L8m6BMyRgFAbH2Gh2T20mqaCAq+pWMd76D5Jjq9b70+1oyHFFPobbEn9w2pMgiSYR5Jd1wuwkJeQknqpMWue3rJCwbq8/cU7Pv8npZ3m1Bc5dhW+qM2ba5NbIkZ7G7DRJvK3dZxEyU7hxdOahIdlSAwyIquJzUeI4F5uBVH+AEZavw7rIzbbL1dR0i6BFSMTroKrQ+M8LQzxlf0B88r5vevcZtVq+MutVyptmG7L5jNamTT8/ucKAaUBMRVrPTb7IFvtWEL1c55pPMHmLJNcTOxBYKG0L+mEWyNZ2ZUMhxTxJ+HklKcfdwE7xK7tslF9so/U/St1QCydWUi0aHHOpYwjKt/+G2YnGYmK8eyudtbhcnGPXWYDpCeA5Lcz7gAVpJ4Ilu4rzC0o/oU2CJhbaw2HGhwe1HdeUyi9Vr7zt3i7wTpXsAx1KBN3CwGDx0F5ZZ7mH54b0jo38/1NJQwURO9Rbr2uGCL7PQxb3NqnJSmK3NAD6V+BY80rT//YW58mGS7NXqvFMnryuezbhSQdpdRP4RWGYKsMR6IsHbp9K
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(6512007)(33716001)(6916009)(66946007)(9686003)(316002)(83380400001)(6486002)(5660300002)(478600001)(26005)(2906002)(41300700001)(66476007)(4326008)(66556008)(8936002)(8676002)(54906003)(38100700002)(53546011)(85182001)(82960400001)(86362001)(6506007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFJWNVQ0QnI3VGx5NkcvcUZaTlJvL09zTnlneFVmeTlRbjJsdXRhWVA5RFlI?=
 =?utf-8?B?RWRGWE9YMW1YcW8rbnFrWnJSekx5czJST2FENDRXQW1kYklJMXdNOGZsVFJt?=
 =?utf-8?B?QndrOHowRjQvSnhGYms4dFRSMk9jbVdQeWhCT1NIbjRDR0tXbjlYdVFzaWtX?=
 =?utf-8?B?K2dSMCs1cGlxcUNqdEl2ekVXTHZoOTdnTGF6bGt4Y21qQ1VHZm1OM2RSb1JU?=
 =?utf-8?B?aExDbmFRVEdHWUR4Y2JWVVpvc3hhSFJ0dkMrY0pObHhQUFJ1dzFGVXYrMU5m?=
 =?utf-8?B?UklsRVVzTXFuRnFHbE5MZWY2MDNRT0xPYk53T2EvZWNmQmFvdlVXcXVtcStw?=
 =?utf-8?B?dlp1ZGdxcWI3dkZibEpTV1FPaEYyVXMybnZYSWxHV1VyZGg2UEtMYzZ1THlU?=
 =?utf-8?B?Wm9sTUp3Z0FlT25MRjQyTVM1cC90U1crL2VFYURVSXB0L1dBdTNtcFZwbkRH?=
 =?utf-8?B?RU1nVkFmOHpzS1ZEZ2t3Ylh5U01rOUZjY2FqWldtRTZhNnU1RG5jL2llSFlj?=
 =?utf-8?B?ajFsTU1sQ0pncWErUjJrUFNHMW5OU3owVUFqdDZzQVdHcjAyMGNsQk0xakQ4?=
 =?utf-8?B?T0ZnSENXMlJGMnlVM0M0SHFZUGx3ODhVVy9zVlpSQmlnaEpKZCs4VXJRMmNX?=
 =?utf-8?B?aGxSYmZEcHJ3dndUS08rclF5a1FlcXk4aC9McThGMlpPbWVLYXVCOTR6QlFV?=
 =?utf-8?B?dHFDd2NIOUx3ejhqYWRKVWs2Vm5xU2hLdWEvQ2l2bEdOMGlPZHMyL3dLeHFI?=
 =?utf-8?B?N1BJK01qMm9PcVZFZ1JucHBlSDNPYVFuVUZQS1A3VzJEWXJHVjBJRUtPVXox?=
 =?utf-8?B?YU9GbEFYZEZvMFE5ekhoSERKYVhXVyt6VW8zU2NrRThKOGcyUkM4K1pXc21Y?=
 =?utf-8?B?bmh4NHJuU3VhMUZxZ0xoZGdaTFFGbThLbktERzAyWlhNdTc3ZWdDVjNuL0JQ?=
 =?utf-8?B?MlYrQ0lGZ2F0OTJvTXBmcjFvWUc0UDNCTWtRTjVMSXlKNlRjbW00VmlPMWRr?=
 =?utf-8?B?NjJLL1pKblRodU50NkdmaDVVcnprMGU2SS82N1k4Q3l0UWpjeGh3NWYrRHRC?=
 =?utf-8?B?R3FjdERkVVhXQU9jNEd1dlpxZVdvRjJINUxEZVN2M3kwQ0RVL3k4dGdSdmhq?=
 =?utf-8?B?SC9PUG1sWDlVZjFXR1V3TVNvMzg0dTFIVVk4REdLRERiY2cyNm4vVFZNRTkv?=
 =?utf-8?B?UWVrRFEzR0Q5M0J2MWRSMHlEaGVDSHJOcGh4emFwVzR5SzI4cXFoTzYydmNS?=
 =?utf-8?B?d29aVFFwMnp4M3h2SW1EWEhmVmNmYngyZWZzTW9ramQxL1U2NE45Y1hmWmNB?=
 =?utf-8?B?Z2lDRWpoR3VsZlg3R291ZFFJblorSlp6NVQzMzB4N2tDNUFRYWV5MmdCTkpL?=
 =?utf-8?B?U1lSWjNNTzBaeFJNWGQrMElxOEZZK2FGbTMyWDkydkQyVWJkZzJOY2Jvdzls?=
 =?utf-8?B?ZUF5NDZ1UGlraSt1a3V3WlZiby82TWk1dmNQYWFqUHRRVllhZ3pOei9DL0VP?=
 =?utf-8?B?VHZoU3duMFVsOEg4SDRuT1RYaHN6RTlPNGpVeC80S3Yzd3FNYWFlVmF2VFhO?=
 =?utf-8?B?R1hoNXJiNGpIY2g4QW9pZ0lVUXFaQVk5NHlqNHhXR0pMVDZWMk5Tc09hTGp0?=
 =?utf-8?B?cFcvdzBEV3RBVXo5RGJLMncxS3IreTNXSkl4MzBlamNUc093TXNCNWNZcXdo?=
 =?utf-8?B?MjBoM0pwbHM4dUVEb2FjMXlaL3VFYlprakM3T3pyUGhXQk1TWXN3elh4ZzBp?=
 =?utf-8?B?VjI3NmJYUHRFZkQyTE00QXJtRGEvZ2NjMFg1K3dBeTFySSsyL1F4U0hmVXA0?=
 =?utf-8?B?UWdRSmJKb0hheFQ0VFZWUnh3NEZCT1Viem9OeWtwazBGQmRJSEtjZXJXTXI4?=
 =?utf-8?B?eFpwbnlOOGZ5bWdjaXdoODFRWWxIWVpCbndxL3MrbGpmdVBuNlB6RXlDeXR3?=
 =?utf-8?B?TWJRWFl5R3NpYkV2MFBTRjZFTkdjbExvUmFBamdQOUNiN0VoQ20zL1RNVGlS?=
 =?utf-8?B?cEQxT05lbHhjbmJJZFMrWUxSZjZSeGZINUM2WDZ6K3YvSk5pV2N0bmE5YWV0?=
 =?utf-8?B?MHBiSCtFQitCWmlnWi9wRDlXM1BrQ2Fna2RtNjRaRmJVb2UrZDU1bHNsd1RI?=
 =?utf-8?Q?O6lNwydnD9XlvvVHhijSj6Nua?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bgZefyQ4oyi3h6Tm/IqQ8bvn/wMoh7PmgNgD0jH/MYurKg+SKEz42e+X99pywlU9vuNGUXsgtF5EJ36R+7FndBujieSO9NOa+I2s4cTDEnDNOwqarQd58XGIKHe4KW6BPRrMtyN1nDDk/2dc6GDpCUUwD4jPaMl5BoJnWtW36uLvRblTXahduRU3ZihOvUKHQgq5F0atU7/6bfGgB1TDyiEo6/gnBFW/qz3jF+7N17QY9nzcv6gnDNvLiiS9JtJz9iaSX5pKkxqtD9/fXxomlA41FjUh+2J3KY/+wlqhONpYAWbAp07hwpcuZOvVoLVRYzmwjILeiOBJRinVpp+wKGAhwvqrDvIJyam2xE0mdYXREd9E+3lnkYxprA5g+7TDzF2HlnTSoWxvujrosOARp5jay2+zqmxHGGuv1Cf9Mu29TSKxndlMqmDxIQfqYfy2WSEFeGoIzYngG0DvxdB0dn8pPHzV0Pp2V/AKlhdCVaOpQNOp4qYb1XEBaJOR/ZNNu9oRVpcoaGSDXFwnNUHssbHxNk26jd9KA9Xyb9tcda4BaCVQCLoNQTzJvfo66ItHoYffg29WJJMWdYUhqfzyVWPhlVA/xhyWy/K3k9TQ0lIrCLRsxTn5kywjH6jCymYcSyxNjYgGFHgoZe214+mDVGRMRLqXhGQL0ZO+ljcjof//0Gr3bAeh91KSAteAVf+R+HG3yOMyTAoKf5/76tpTxQ+eOo8XfshE6NbdV2i7nn3aRWw2uNvtLK1bWEtUKoppglxieNOUwKKKYcCYOkxya0Ooe657HgOrtiUZBWOBbcs4ZIn35+Ia89W1XJBpbMYYBrC4OFSSU7qvgraFjQWO+w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5a7446-d71d-4fd6-5609-08dbd626ede5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 13:24:49.4816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+Wfg9xzccAA6gwlp7MHbO/aFO2rxghTLiuCJeUmasMe294JCxOb1qzSZXYrQA3A7n+lunGG7oSOhxDzapmJVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5078

On Thu, Oct 26, 2023 at 11:03:42AM +0200, Jan Beulich wrote:
> On 26.10.2023 10:34, Roger Pau Monné wrote:
> > On Thu, May 11, 2023 at 02:06:46PM +0200, Jan Beulich wrote:
> >> ... in order to also deny Dom0 access through the alias ports. Without
> >> this it is only giving the impression of denying access to both PICs.
> >> Unlike for CMOS/RTC, do detection very early, to avoid disturbing normal
> >> operation later on.
> >>
> >> Like for CMOS/RTC a fundamental assumption of the probing is that reads
> >> from the probed alias port won't have side effects in case it does not
> >> alias the respective PIC's one.
> > 
> > I'm slightly concerned about this probing.
> > 
> > Also I'm unsure we can fully isolate the hardware domain like this.
> > Preventing access to the non-aliased ports is IMO helpful for domains
> > to realize the PIT is not available, but in any case such accesses
> > shouldn't happen in the first place, as dom0 must be modified to run
> > in such mode.
> 
> That's true for PV Dom0, but not necessarily for PVH. Plus by denying
> access to the aliases we also guard against bugs in Dom0, if some
> component thinks there's something else at those ports (as they
> indeed were used for other purposes by various vendors).

I think it would be safe to add a command line option to disable the
probing, as we would at least like to avoid it in pvshim mode.  Maybe
ut would be interesting to make it a Kconfig option so that exclusive
pvshim Kconfig can avoid all this?

Otherwise it will just make booting the pvshim slower.

> >> @@ -492,10 +492,17 @@ int __init dom0_setup_permissions(struct
> >>  
> >>      /* Modify I/O port access permissions. */
> >>  
> >> -    /* Master Interrupt Controller (PIC). */
> >> -    rc |= ioports_deny_access(d, 0x20, 0x21);
> >> -    /* Slave Interrupt Controller (PIC). */
> >> -    rc |= ioports_deny_access(d, 0xA0, 0xA1);
> >> +    for ( offs = 0, i = pic_alias_mask & -pic_alias_mask ?: 2;
> >> +          offs <= pic_alias_mask; offs += i )
> > 
> > I'm a bit lost with this, specifically:
> > 
> > i = pic_alias_mask & -pic_alias_mask ?: 2
> > 
> > Which is then used as the increment step in
> > 
> > offs += i
> > 
> > I could see the usage of pic_alias_mask & -pic_alias_mask in order to
> > find the first offset, but afterwards don't you need to increment at
> > single bit left shifts in order to test all possibly set bits in
> > pic_alias_mask?
> 
> No, the smallest sensible increment is the lowest bit set in
> pic_alias_mask. There's specifically no shifting involved here (just
> mentioning it because you use the word). E.g. if the aliasing was at
> bits 2 and 3 (pic_alias_mask=0x0c), we'd need to deny access to 20/21,
> 24/25, 28/29, and 2C/2D, i.e. at an increment of 4.

Right, it took me a bit to realize.

We assume that aliases are based on fused address pins, so for example
we don't explicitly test for an alias at port 0x34, but expect one if
there's an alias at port 0x30 and another one at port 0x24.

Thanks, Roger.

