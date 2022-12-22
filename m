Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E686653CBB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 09:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468267.727322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8GVg-0003XP-7K; Thu, 22 Dec 2022 08:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468267.727322; Thu, 22 Dec 2022 08:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8GVg-0003VL-4E; Thu, 22 Dec 2022 08:01:00 +0000
Received: by outflank-mailman (input) for mailman id 468267;
 Thu, 22 Dec 2022 08:00:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8GVe-0003VF-Tl
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 08:00:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2082.outbound.protection.outlook.com [40.107.7.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c48a222c-81ce-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 09:00:58 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB8327.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 08:00:55 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 08:00:55 +0000
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
X-Inumbo-ID: c48a222c-81ce-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=im0bveffg29x4aaS/kPA8TVe+j4NcBH6wHVFZNbQT3D1EesPan0/Xs+hQPr9V3HM9yLpDgI1SA/klbwIW1BRRLhrGU2bbsHtrnIEJhL8JXrp8UVuhZn3OBJyirkOrp68Y31smoTzlQlBpPLpeg/25zPMWTA/ZyEbg3KTAUiiihrTXIJk5a/ljH6xAK4r2Fg0EIIwDDGEE2xE5BbYFpJMdbIRPhpszV+AfJ+3dz46gEv+uE+/SeZF/gszNC6jFS24yTgH++e5XVSC2rG/iEOov41763urlEHEvZj3XhaTp9K3eIr0coMdeogmQu28Tb8VxTYagPnSmDjY+nJgwjkzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1i7SGGYZ564QuV3+nObXpaN8KfW1hu3y+spkbArGEc=;
 b=LOK1ywUVuKoAxAu+hGXZAg+U+4m9x6xwYf1qaZQ+dUS0+WpywCM2cxyNUATjY1HqcDGsKf0Yoa2yzDSfh58vfdvQT2Fb1EBlvv/2gueLwKmMYstb2zFpJ0EVdi9SQEWej+T+cefTOJR+9O1t2A7jwPgafcyToKC9c1yHl4OATu+C0y8j2JJ4i2WZihAjWnmarE81Sx/ncHJpEXCqlEnFWzsWrYhW5A8druFqm01SOZZLHDgkdZm4lavEJ4+LaDOPeyxhLeiDi7yjOsKoDRil4m3vYIF6tjKRvcrli4GIWUrDDSybAVKot/OKMAN2/Zi3AoingOGlbtRRxUrpkwx1cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1i7SGGYZ564QuV3+nObXpaN8KfW1hu3y+spkbArGEc=;
 b=TGvkA5gj05ZmWV8cOHkkqGDQeB93wVvTQQtpc6Bdz5ygzBUH/vklXjqKOEoinT/rrnmBBYuwe22nLnkZRSggakjoASVz74s4w2z++sNmO2rOXYRUpma1KAbYs0jGffYAE39RByfAMjlsxy/15hc2y3HkSPF1ES2Of1m1VCpCeOz7RFDcLnglX6jNzrumR1ga9dDV7uHqPwdrtJkjDgr5YBdlTeCrdn3V8Y4Rvsc/pPT3EZcjOkvShvciIGSZ+HBgGy5lJxXchgcjrjuVUqwRQW5W0olvVoThewuULSFijRiayY2NORIpZuHTxY804HoXCCc/dYeZrNGjUZgoLJ1Ebw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <96b5613f-144d-29ea-9e17-515509c16300@suse.com>
Date: Thu, 22 Dec 2022 09:00:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/8] x86/paging: move update_paging_modes() hook
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
 <bee2d51f-534e-f6e2-6385-70f8597eac1e@suse.com>
 <de5343ab-9083-360f-3d7b-8bf84a70732d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <de5343ab-9083-360f-3d7b-8bf84a70732d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::16) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS8PR04MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: 031f24c2-22b3-46e2-5ba5-08dae3f2a76d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Cqjnmc7lD9Dw1e7QW/qk7BajfBZVEgXqWm20ErmBqA4gPVZ9aNuw4xIi/TcuqUa/AkaDNi4shHnXBKSy49MmYPtuZXXBNHlUDuytcQXJCl5qUQ6JCSnPNNjMt8JcNuLyFD0vjS/0WNG+TUC7IsKzgvgRAERTPwTml1FekBqdgS/0reHj+1bI+MnA/6L7VcNAPWR5PUeNED6399+eNQtZr9eMK8Ihns0ahtk9vUpwZGM7esA+8GS54GYwQIP4AtCl6SE9oCb7g4EK8frVmNZlv5fv3LDk5xSMnwJPOMw6ON1KFBodQrips32zrpmxR0wsCkzYHrZFcazWf/RfwO98Bo6ub8p3ACIs8PBQxdPbbG88nATaWB8QT/U17AOcReLVeV2btCmvdGAjA7/LpmD6xdsQKweowbGj8U9AD6gRnMQsn/SGj7Zf2hYAbbWJ4rhdfdYsFH02LEb2LBdpWCkAGl5BywYTrbp/K5QKpMewI0HqMo+Nfp40XPzP+RIvfid1jOk2bw3fVl1S2r3pQB9MyBm/qO62okwMnuOTggqeuA3Hppc8crlhYhy+/zuZrGirGEPeaUfPGCjzZXXV0H3r+yjyJfFhb85QhKxhvIwgIG5WWFreB+nGQuxxZgjoaA+xv/e4CwYvZeAdNGxE4N/DuW70S5oepvpvvcCxyY8z/Ie0jmWp90qvxW0w8DcBOO5IVne7fXJxv4OUKEo2zoV+S6xv12j7MhiNU7MI0W1aCE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199015)(36756003)(2906002)(38100700002)(5660300002)(41300700001)(8936002)(15650500001)(83380400001)(86362001)(31696002)(54906003)(66476007)(6916009)(316002)(31686004)(66556008)(8676002)(6506007)(4326008)(6486002)(186003)(6512007)(66946007)(26005)(2616005)(478600001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1R0eFI2TU14Y0RIU1ZuTmVad3pOdGVzaEVmM2RnTEdyRUZ5VVFCRDNDM1Fh?=
 =?utf-8?B?VUN5WGxaM0h1bFgrMmZHbjlkaTlQUk5xU1lEZ3Iyb2xDaVRuMnh3RFQ0WGVY?=
 =?utf-8?B?aWV6RHhSTk02ZlJwSWplb0c4eCt4RXd6ZlRScDZtYllVaVkyZEFLNGpHZTFG?=
 =?utf-8?B?SkZ5MFRJc1lrbjY0a2dFOHp5eEp5VVF1WXRmK0dwYmgyZGNDRE14NVh5RkpJ?=
 =?utf-8?B?TXFnZGpqM2dyV2RWaG1KQThvTUIxdUQvTzltUTNHdXhySTFsWk04aHBiRS8x?=
 =?utf-8?B?RmNwS0FvanNvTzA0RlM1L3VJNWk1RVJ1bWpMUituWWZoa2NTK1piTHVlblAy?=
 =?utf-8?B?a3pZUVg0YWFIZThSN2xXYXdIc29oQzN5RC9SbjllNTFVNXpOcmxKZW5WSlJ3?=
 =?utf-8?B?ZXRyRE8wQmtQOEFsbWdNWlFsVXE4QzNqMXZCV0hOalpzQWRsekpDeTZFY0ov?=
 =?utf-8?B?NTJ3WSswcS9pNDM0dS8xN3BKa0orZm4yK1ltcU5OV1FTKzJFcjRZaFVrWUJP?=
 =?utf-8?B?U29Cbm1jWHdYbEIwTFFKRFhCNWdwczZqcFAzTTJLc2VQWlg5UXh5bXBRajRh?=
 =?utf-8?B?ejVrOXhMekNEd3hLSXRBSjhlZUk1NFhVUDNUNXZOVWpaQ29yVGlaTVNmS3BR?=
 =?utf-8?B?TkN1dzN1dHNDbzBBa3A2TnVFWlJBMjRxL0lyVm5MaWFBVTlKejM1UUt4UWRj?=
 =?utf-8?B?Y1o0dVlsNU1lejVFUlhTR01MWGt5THlYWUVDYVZ5TW05ZXRhSEF4ZHBTRzRM?=
 =?utf-8?B?ckNRN2s3R1M3VnN2OWVWUjBETnIwdXI1T2ZYV1MyaS9xMlZxM1FhQ2FoQ2ZM?=
 =?utf-8?B?Q0lEVTI1dHhZY3J2eDBkOWhWdVhwZGdvL0FqLzEvWU1KSEdrNnhablZ5ZkZS?=
 =?utf-8?B?ZkpaeHFINmxaNm45QzYzcTB5R3BoNW1HV1p0cHQ1M2Q2UWpJZElJdUdOTDY2?=
 =?utf-8?B?Sm9WeXZPTzFTclNYcDFJNnFsbndiWTZKdE82YndNcDlmVCtoZzl6eHlVZGg3?=
 =?utf-8?B?Z2p6RzU5d3YwRGJpcVBDRi82bU9DS2RRRmdzQjM1OUNiVEsweHkvRm1VS1dW?=
 =?utf-8?B?WURmWHlpTHM1aDVHdXl5VngyY3V3aVJ5M1QyN3ZVaUVjOEd5YmxWNGM1dEcv?=
 =?utf-8?B?b3Ryclk5Y3ZZejBSSUNuclA4Yi9FUEMzaXA2Y2srcnRyeXBnRVAyZjVUYWkz?=
 =?utf-8?B?VDVuVXNlNUZPVUhvT0ZWYVBLLy9WMndia3hQZDVybExRRTY4QmxIdzJucXI2?=
 =?utf-8?B?enB2Sm14ZHNscHA3dmpLZ0VKM0pnVXdiYjRYZDlvSlVHQnFBdGxHc2RvdC9y?=
 =?utf-8?B?L0dDSVlSSjlhbHJ4VWd1djdTajlid1dtRWVFNVlLNDlHN2tlRmVnaDZlOENs?=
 =?utf-8?B?OEVFVkFwMzV1SmRkeTc2bHdibmtLbThONmgwZ2h2MTg4VjY5WDd1MDV3NzNQ?=
 =?utf-8?B?dWtTZmF1dEtWS0MrTjQ5ME9PRmYzdUFFdXNMTUp2WjNXbFVkcDRTblk5MUxp?=
 =?utf-8?B?NjVnZnYrTDYzamJibGhIaXJRNDQrWDF1ZW5HVTdVL1RZckF4Zy9yclIyczdw?=
 =?utf-8?B?ZWpiNHJEUWpIeTl6a1JUSDFKYU50NTRLd1ZxVm81c29Mei9tc0hoajNVeGxw?=
 =?utf-8?B?RVhTZzkrRjF3VWRMNjVINEkxSHQ3dmVuWmk4Zmo5bnRHU2ZYSmdyRnlCeG1z?=
 =?utf-8?B?RWF3NVZ3TVlTcmZzcE5aSjBPcm5WTjdtVkJEVnpZS245SU83WkhWOGpnMmt4?=
 =?utf-8?B?VFcwaVQxS0tuRWdTZW5EYnJ5VTdzZGRkY0lrUW8yb1VmNUZFV0hvSVlFTFMr?=
 =?utf-8?B?U0V2NlIrc2k3d2NXVHo1RGMvenFJMytSWFJyc3pId0FMSXpHb2cvd0ZrT1Q0?=
 =?utf-8?B?dXdBUmRRNlRjRS9ScWhxZzJRbmNMRHhaUmprSzVCeU1SblV5S05VNzZaQXdV?=
 =?utf-8?B?aWk1QUpEdmttWHFYL082c1dkb0QxaVJqUFZ6MmZ6MDhOeUpPeGo2M2k0d3I0?=
 =?utf-8?B?SmFQNzRTZGFjcEdqZmNOTFh4Rk53UGh5V2d6eEcvazJSa3hrNC9BYzhhcFd1?=
 =?utf-8?B?cS9VQ1QrVEovNGFMQzRwRHYyTlkyNlJJUzI4T2xNUVFQbUNlQXZpTEE3UFpT?=
 =?utf-8?Q?+IhFVcIzNYA6uveyYWdhk5lfv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031f24c2-22b3-46e2-5ba5-08dae3f2a76d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 08:00:55.8305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOuHPHVUIq8+8q6UVpJbrCbvr22gOelHz0UUO5BeBIwiOJpHMIbG2QwSBWvk3hltEVw+aVfh6aax3vxczQ7itQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8327

On 21.12.2022 18:43, Andrew Cooper wrote:
> On 21/12/2022 1:25 pm, Jan Beulich wrote:
>> The hook isn't mode dependent, hence it's misplaced in struct
>> paging_mode. (Or alternatively I see no reason why the alloc_page() and
>> free_page() hooks don't also live there.) Move it to struct
>> paging_domain.
>>
>> While there rename the hook and HAP's as well as shadow's hook functions
>> to use singular; I never understood why plural was used. (Renaming in
>> particular the wrapper would be touching quite a lot of other code.)
> 
> There are always two modes; Xen's, and the guest's.
> 
> This was probably more visible back in the 32-bit days, but remnants of
> it are still around with the fact that struct vcpu needs to be below the
> 4G boundary for the PDPTRs for when the guest isn't in Long Mode.
> 
> HAP also hides it fairly well given the uniformity of EPT/NPT (and
> always 4 levels in a 64-bit Xen), but I suspect it will become more
> visible again when we start supporting LA57.

So does this boil down to a request to undo the rename? Or undo it just
for shadow code (as the HAP function really does only one thing)? As to
LA57, I'm not convinced it'll become more visible again then, but of
course without actually doing that work it's all hand-waving anyway.

>> --- a/xen/arch/x86/mm/shadow/none.c
>> +++ b/xen/arch/x86/mm/shadow/none.c
>> @@ -27,6 +32,9 @@ int shadow_domain_init(struct domain *d)
>>      };
>>  
>>      paging_log_dirty_init(d, &sh_none_ops);
>> +
>> +    d->arch.paging.update_paging_mode = _update_paging_mode;
>> +
>>      return is_hvm_domain(d) ? -EOPNOTSUPP : 0;
> 
> I know you haven't changed the logic here, but this hook looks broken. 
> Why do we fail it right at the end for HVM domains?

It's been a long time, but I guess my thinking back then was that it's
better to put in place pointers which other code may rely on being non-
NULL.

Jan

