Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D3969839C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 19:42:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496204.766822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSMiw-0002MT-UR; Wed, 15 Feb 2023 18:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496204.766822; Wed, 15 Feb 2023 18:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSMiw-0002Km-Rc; Wed, 15 Feb 2023 18:41:46 +0000
Received: by outflank-mailman (input) for mailman id 496204;
 Wed, 15 Feb 2023 18:41:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCKc=6L=citrix.com=prvs=4036dcf8d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSMiv-0002Kg-W5
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 18:41:46 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 634dd7cf-ad60-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 19:41:43 +0100 (CET)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Feb 2023 13:41:32 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5102.namprd03.prod.outlook.com (2603:10b6:208:1ae::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 18:41:30 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 18:41:30 +0000
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
X-Inumbo-ID: 634dd7cf-ad60-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676486503;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ol7eyFD/X4Fs+YOyqexcyQcOWhxJtNPY0mfFmbprnyI=;
  b=DWDZoTtsfLh7+BsR1+1YZuzJhhfRxR+x1zQDu6Yo9LXhnyUFC1LduSB+
   NRixyBUvJB2XK1Bes8QsOOWkJaAcvwT/t00idYC+ObNh12C7VULmu8I5F
   kJqQEbs/Q184iqtyehKK2dTfKHa/xdcsPvWu3VPM92c5Tz9Kc+bHl9DLo
   M=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 96577186
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:A3Nru6nDZRuSKNqsejSwFWPo5gyjJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeW26PPamOZTP8ctEjO4Wz9EkBsJODnIQwSlc6qno2EiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5QKGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aAiATMwaEGevP2Nh7amb7k3oJ17cfC+aevzulk4pd3YJdAPZMmbBo/suppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1Q3ieC2WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDSuDnqac63jV/wEQ4OSA7TV+EpcKYqUmnCpVQN
 FQF6gkx+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiQhSO/P24SN2BqWMMfZQ4M4t2mqodsiBvKF45nCPTs1oazHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxa8owFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:IzUTra3ZjOEutGF1712cBAqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.97,300,1669093200"; 
   d="scan'208";a="96577186"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUHRIqsUWaRrQQB7kn/VVrbFWxQS3X5Lh2eH2agAH+YlCMVCefNjwINNZM8HUIm+PQJnEo4YC6n0eKrYXr5cBQjY17talTULa0SRTebYTdJoqiqT+F9KpUDqhvc5fEDsQGfUQbS45HeWmNfg0NlqEX5FkkCdmrVZUswXSOgegb7aYWUvYcpP0PiB3heTtDdtauF6EOufRjq/06RwQF1zUC9zQEce4PKpKHL+vA3EbCgs0/V7+E3XEYWnhlWgutBIjXVjfjOMfEF4rDrsTYHmyVv9ZTvd6g5duGGypYjIrdYI8z9ET4sVDrhlQteR53GwA7lqKS8og4mK5RyT9Mx0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lykSCFFb1jWk2L6ZixKPdzXlFh/amYP04xaYscp0+T4=;
 b=oZ+50zMa45iA2PCMuS4O1B/8Bip4ya4m/6XiV2+lldW4guByj0xc8Qpwju4SmwXgSBAhaGYhTzsa2Ql0y3QH8nbu7RrjLeOKaMQdxEivxeTVhkK9tW1pj4NxzXjNeIPzjMjI2AaSZwnkBT7joUJIJbJBpWJUy4hl3jS0nfkbqX0B8svN4K59GoofyHRA/G5JlI34BIFGAb1AICKkRalpqiU0Xel2t4EJ/fmiixF9DPjawj0NQGJjmeiwETJvELdmW4c+UUOZXjP8acuQt1eePHSxIJlksgsAzqKWIDiScLUOrFkYMKkm5HE+U3AriHj7+POr81gtMDBXewMDQ07LNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lykSCFFb1jWk2L6ZixKPdzXlFh/amYP04xaYscp0+T4=;
 b=aFWW4G2RyRh9tOp663X+oZYDMJbhMjvqIsoSF89OqwmVI4G2cZkTbkox8AFCD3xpNlKpda6ytZnrRoLOmF+UBfSUnzbCzfl0Swyzln82uszEpSjAW+tUnL01JaXu9cWsbw0ssWNcfMTBMsKDGKyndza1eKgHD2LBrl9ibmsqSSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7c38a1dd-3ac7-f7f3-4a7e-a231f55e8f48@citrix.com>
Date: Wed, 15 Feb 2023 18:41:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PV: ignore PAE_MODE ELF note for 64-bit Dom0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <c5458448-10fe-9c04-f25e-b69704c5f3eb@suse.com>
In-Reply-To: <c5458448-10fe-9c04-f25e-b69704c5f3eb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0302.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5102:EE_
X-MS-Office365-Filtering-Correlation-Id: fdcd2c6f-bfbc-4d20-4ac9-08db0f84410a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sjwo072QLgrYEzzlluLxFMDDo4RjztclBecnKAA9hDFgFlP1nSToTEz4Y+Sj8MQJfaJmZUdvN7uW68bEheHeUZZtQv7ivmIKss6+eNS3yNFDSH/5lhKob/IqrDkBPQY3/Y2hWw8d1hustcFzE9eVnpa/n4AOqw+X2uizImwhGcKMibyjsxnW5VLYhb9Tex3DAFYD3UvcdIYQhVKIlY9FGxdYBBWEYD7GuVn2NNeL5cJDKu+4QNFfW7omMW40A7P6J/QLy596nsOJYOvQ4lMhJT23XIVku3p0yJrGY3epmiLWhUvTxU70feYEQoEiNnxkoJCu03jpueKM81CkGOM51ON4nQ3P6RxBB6n44A5GECUGHIKDSRtN+EIHfBxY/kEapcH7JrDFIGMPfzJiFkO+5/gJlSHVykqD5CTGHd8mYESWb4r+doxkQtPPFGzfyJnfOYaCSJaNzaaO2VTLOCzUY67lJIpbFYC2TScqQ1bcZo7dsi3o20J+vCmcmLliN7wZMOqlYTUWWvcDhDD9T6Liyr9TzejCG0i+C85enFcd5HNKPda5QrGMGK9mu57+K1g/6912sSV3PYkGMO4y1R3Ogl6fcmFQJbM7ehrnnOO9IflmQmmsTmokpo3pmcdUCNi2uxPy47Dk1qIQesovj5yMfG7aDephFRgvNA86Sct/XbQV5VHqd+srg8VkIvfCNXY3plwYmGbtvHEisCN8RBEvDco/YawNdiWtBgMnWDZVPa4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199018)(478600001)(6666004)(2906002)(107886003)(53546011)(6512007)(6506007)(26005)(186003)(31686004)(82960400001)(2616005)(38100700002)(6486002)(36756003)(31696002)(86362001)(316002)(8936002)(5660300002)(54906003)(110136005)(66476007)(83380400001)(66556008)(41300700001)(66946007)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elRHbnhJQVZkVks2eWllR0tOajV2UllnZHVHVHdTNzJIZXhaZGYvanRHQk0z?=
 =?utf-8?B?dFpNeTlwY25IS09mWGpHK09jWGVlYi8zTHhqamlLYjVDQ0dXallpSlVFUE04?=
 =?utf-8?B?MWZleFR5TkxxL3IyeWZZM0QzWUtjNm5Xbm1CdEZyYlRkTW9vSTZHUXVMWElN?=
 =?utf-8?B?dzYzMVJvSGdsUFZMcS9jM1o3ZGh5WXNWQWpJY1dscm50Vmx2djdZWUYyaXRw?=
 =?utf-8?B?cnhDSDRiNmNIeThMcm9kby9UQnFZcGM5UVJ1ZXphMDJtWUoySHZVVkxoMUUy?=
 =?utf-8?B?UThEZkhDekFVT2RSMlA5R2tDV2xzbDNSYVdsMUtZbTNieGVCK28rcDBZcXMv?=
 =?utf-8?B?OFFwRnMveG42SWxCajdMMDh1bWJNcnAvUWZJL09JZldueFVQaWpjWUZ1ZCtY?=
 =?utf-8?B?VENENUVQVTl3em10SENDNXdDemRCMHdDbkxvdG92WlBtUTNmNWRLeXdTQVZM?=
 =?utf-8?B?RCt5S0hOREVTMmtha2lweXcrdnBQV05uaDYyMUJRbVRNdisrN3d4N1FXbWdi?=
 =?utf-8?B?RTg3Z0hnK2w2bnRlakx3QnRrekIrTlo1RVRiUStUeXY3a0ZtMkxXeUNST1Qv?=
 =?utf-8?B?amJvNUtnVTN3bHRSbkNoc1l5RjBXQlphTHBveUVTUkJ1T1JKcTVUY25IU29N?=
 =?utf-8?B?Q1BCOHA4d1ZQRW5Bekh1QTVxcFZDOGdhZDZOTWUzbWF4bEY1bnZFRXA5aVdz?=
 =?utf-8?B?NkNDUVdUOFFMY09PVGN1RktpWklpYUdnNVUwc1lPM2JvVVBMR2lNdzY5ZXpx?=
 =?utf-8?B?bEc0M2hTWjcxcFV6WTRKZTVVNHk3UXdIRCtNcE1veVRnMzZ3QWU3MjlJdVA1?=
 =?utf-8?B?YzFvRkcwVThiczlnK1VyU2FnN3oyS1BpUVFlRE5vRy9FU0FHQkNxUzlnWDB5?=
 =?utf-8?B?Y2xnQWdFVUpDR1pESGxpZUhNS0ZNSmN2ckJGM1NEMFd0bGVKSk9rdEhwU1kx?=
 =?utf-8?B?N3V6anJrMXppdi9sQ0U1YTdnRlNuWVVOVVZhRmhTY1h1KzFsZitDR3FQZldr?=
 =?utf-8?B?OElJWVZ3NzNIMjJBMVBhWENRKzRSeHl6NkxTa0FjYVVmQkVpd082TkhLMGxX?=
 =?utf-8?B?QlpodkRuenhkUjQ3SFZrVE5sVFI5K05zVzBLRkNQdGdTSm9oM3pVaDMrVVpE?=
 =?utf-8?B?eHVMWURHZHRWM083aWlPbW83MnRXL0lhQ2xxZUwrQ0JNVFFPMlErNjduQ2VU?=
 =?utf-8?B?bHkvUThGRytUL0JlRFhCT2dEckY2RlJCbVkwNGJoWlFmeU1CQUNXOUE1Y2NI?=
 =?utf-8?B?WCtWdmFNaVdVa3VXeUJqeGh5SlVYQlRFOWlOVllCQkR0Nm1HZ3VMWEwwNkxl?=
 =?utf-8?B?bzI5Z1FvdHd2eURocmZuSCtkN2tzeHB3TTFSV2ZqR0Y4SHpNM2dobW10SXVz?=
 =?utf-8?B?ZlhIRXA1NUlJZmF0QjNNbElJNXZZcXphbS9YejNhUGVKNEhhMm91V3RTcWh3?=
 =?utf-8?B?RGMvdUhIT2hzZ01RdWc4S1Z4bWRHNHJvK3hoTGN4WGtjTFBoTExyV1ZQcWhw?=
 =?utf-8?B?YUEwZXZsS1VGSjROYVdzbTgya3lKaXdFYTZGYlJrbmo1UlJjNXNaU3NuaVo1?=
 =?utf-8?B?ZnNVc3hBOTJCb0pDMGZhR24wSWtHY002YW1wK2N5S1RDOG1kL3BGb2wrNTJN?=
 =?utf-8?B?aFFYalExTU9CbGUwdi9mcDhENDZNbU9NN1gwWTZGOHhTMkxLWm1rRHdxaWxr?=
 =?utf-8?B?MEVMb1h6bEZHNTh6OEFWQy9LcjdrOWpJUnZpMHJVd25NU0hzWUV1ZGp2YU1i?=
 =?utf-8?B?bG9nTWVnUHBlbm1haUt0Nk5PbS85UFp3eVRUQ3NBWGNYWkN6eDlhWnk3UWIy?=
 =?utf-8?B?eGJ0RW5GaXVTU3Ixa2VnOW8yd2dOWWlDN0Q0aTdkQlhpL3RBMnJibjliWEtO?=
 =?utf-8?B?cEthYVB0YVplNVl0ZzVmYmVVUE1MVG05TkpvVVZqRzUvYWFFWGtBMDFJR21y?=
 =?utf-8?B?VVM0WHRZelZaNmwxM3ZBN2c1NmIzeFJzNkh1R0JCd2lMWlJLOUI3VXJNUTA3?=
 =?utf-8?B?d1kwZjFjdW83cFVrTFg3WWNJUEI1QlZObTFUZU5vMjFySlJNQlFXODB0c3Ns?=
 =?utf-8?B?QjI1eURqRzZjZTZSNW9iQlRGTWphMDdibkJMNmJxMmhWV2RrSjFPeUhFcTh6?=
 =?utf-8?B?bDg3TFJrV1R0UkwrUHFUZlQyYVltaWxORG1wSE44M05SdllQa1B6R29UaVBJ?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V14UYorAi/OkFY6usS8DdH7nDlbTUvkEjb7X0zUAmtVNzDkSONyuupCHyfFWtwDAbzkFh3n4JZvYdh+aXIDWBqS9wHltSG73nuwGTX/YNfTebDhmnZcN+c367szMK59HzvU0yqlQZBMc06IYG9Nza5YaZvGFPzECmzyaV15wIQAdrtXEdZI9dehnoRj8J38WHU23MuVib9z4+gT5GNJzVqDbGXYg6NbDRHshUAjG0CU7zeF0R9xzdRHd3w69h1b2v/IgWm+248fzO3nSzz9OctZ6mmLY/OJmu52H2SlXdAnf2tkyHzN0jW4BkwaJgFfJ3kEcoqE+X0U/DgXC3QP1iH61M+O1vVOnD0bxkMJDgRiQvHj4B1uFpcOlHmjUVIIihNweq7f8VaiobcmRlfeW5uagxovmwFZ4MEo+eygPmZrIFrpTVsQcCT3NKih8PuIVeLne8cUWYQQK+84puVIXBnljNm+JAOK91uYsGM7iz/amEbCW6enraKoSk5vjVp2aazHsowtYKFUXxYj2oftst+taE6tdvQTm5TsOsyG1KfY6/mkgTp+CvEGAUanhRrTwlQH+Ftz8O+gcc3YBCpcofrCDypNnjZQ2YvVFox7I8FgXkaaecBAOl++dax06jUTz0h2hFXPqhMvSiaC3bALSIYc/j3lR77qpRGI3VAh3kKDrnWhC/NJNOFVpzpw1yKvTcvjCLnM3rIcYYhB0Z2gafXvstpdMhbAPp3+J1Im7mIbdP+lQokRbaZk36dSoNSx6ZMqjjRgsd58lZ46JxA67dTkA/VbMdhmmbZvZ9TYTi9PFDl1d18LTYQe/SFadE9E2
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdcd2c6f-bfbc-4d20-4ac9-08db0f84410a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 18:41:30.7318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrsQGBaKeEWo/ELT2BsN0UD+/QXCBvTfqHJ5DG6T60Hv09t7zI4touvJLPpxS7MN/lMHsCLpAxc1PoR2U9wIG7457KYcqRTpnV/TjGn1NkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5102

On 15/02/2023 3:10 pm, Jan Beulich wrote:
> Besides a printk() the main effect is slight corruption of the start
> info magic: While that's meant to be xen-3.0-x86_64, it wrongly ended
> up as xen-3.0-x86_64p.
>
> Fixes: 460060f83d41 ("libelf: use for x86 dom0 builder")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: While Linux works fine with the adjustment, I'm not entirely
>      certain of external tools (kexec?) having grown a dependency.

Again, I wonder why you think regular kexec has any anything to do with
this?

Are you mixing it up with (legacy) pvgrub which does end up doing a
kexec inside the context of a PV guest?  If so, it's MiniOS's support
you need to care about, and I cant see any logic that even inspects the
start_info->magic[] (either in MiniOS itself, or the pvgrub patches).

Like plenty of other fields in the undocumented PV ABI, it's not
interesting at all to software.  There's nothing I can see in it that
you don't know at compile time.

>  It
>      may be worth noting that XenoLinux and its forward ports never had
>      this ELF note in 64-bit kernels, so in principle it may be
>      reasonable to expect that no such dependency exists anywhere.

NetBSD sets PAE_MODE for 32bit and 64bit but, like everything else,
doesn't appear to inspect start_info->magic[].

xen-3.0-x86_64p is obviously bogus.  I find it far more likely that
noone has ever noticed this bug, than anyone gaining a dependency on it.

Insert usual rant about the PV ABI being entirely undocumented...

~Andrew

