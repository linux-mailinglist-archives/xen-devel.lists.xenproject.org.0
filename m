Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CF069DE6B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 12:06:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498760.769661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQTR-00026w-V4; Tue, 21 Feb 2023 11:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498760.769661; Tue, 21 Feb 2023 11:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQTR-00024S-SH; Tue, 21 Feb 2023 11:06:17 +0000
Received: by outflank-mailman (input) for mailman id 498760;
 Tue, 21 Feb 2023 11:06:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUQTR-00024L-2G
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 11:06:17 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2053.outbound.protection.outlook.com [40.107.13.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be078bcc-b1d7-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 12:06:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9340.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Tue, 21 Feb
 2023 11:05:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 11:05:39 +0000
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
X-Inumbo-ID: be078bcc-b1d7-11ed-933d-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7TE+5Jy8SNY67yCQa85On4I4/XZxL08EJd4Do6XkM1UfuFttG9yr0iLEPwOEv3B8OPT1upwlm9JT5VBDbHnHzHVDo3cg+HJq4G42w61hs6d0ZVLgOjR7YnY7XP3aeaStDDSoPim8EYfegBBg0CziSJCwzCmkEFVezJ52zhaXMrCQpUBxHVT/s6WT1/platg/yoNro82JAdO6+kaoia7fmzb/bjie7UGVI97yN8XEPJJ1i6Ic5BFXjh6hKA0OmYchdY1a7qWEESVfpKks9PuY42OmawqrPq6XRcgUSjCRtLdDFknly66F2luLAPPIO2e6BR4sWXKaogRqJ9YwIzZ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7b2sPbg74o7vk11pYUg/xe/lpQ5BS3jZ0zJm4V/RDk=;
 b=NJKiwjpSkpGi+0Q/b+itapEuJNMJVuWVsDB/j6P2drK62PN+NryIjrEQhu52zau79fVg0uCV2xLmJWtxWZtyh2gY9KA9/+YNWyiuHD7I9Koe0+a+k7aR0vaSGsJ9TWW8Ufm9UPw4WdB+f5emTO44cu85/mZ8vnLDmkaCIGwtnMOjU8IJure+Y84ZJXkJZMTVbE2bNhC9j7MI9tw3wGCzu57Mc1o/LiM03DaTxbUW1i/VlYgUidq8/qZX8YbmVwNxNmTmjM85rmvd6CcFeaQER/c42iodu8A9SxSgnxwy+1R88Xsr7qR8bdCaJBtHO18WcbvslzBZRJAQOExJyVJM4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7b2sPbg74o7vk11pYUg/xe/lpQ5BS3jZ0zJm4V/RDk=;
 b=JWiq7zIntR1i4dPcJ0h+5mpw7rAIMwHYrnx6t8WzFUJwqJDxM8d4Klg1ALRp+BNFHN/7a7XHdF/ygaRcLZkcLLyuG8Q9dlq9BLd9ziGgspLGTzCY0u63VyKrUsd2/ytDzg0M707XhSVETeo2DS6pQJAs0zCWHo0RoBeJm6vvgFxpnMS691pwMD61ay5QtczNv9WsPw+/upBCMEyTROefraA05Q/LnRPoPNw32WKatxnbvEOAXDFSaTpk83QAuWKKhi/UPIY2rOlS9OTdmSiQoAlpNHoLz7Yk6ph9+rukqNx4FdqOpt4Lb57BfmX4sHx6z1uN0kW1wMA87aoY2EZrmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6e938b96-5f56-677a-b127-3f5aaf51f0ad@suse.com>
Date: Tue, 21 Feb 2023 12:05:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86/asm: ELF metadata for simple cases
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230220110439.1518972-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230220110439.1518972-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ecade4b-c7e9-4c05-b08b-08db13fb90bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mTEkTX0VHYsnHa93z0fKdH3nzEYGtekCQyUbO9qq9/KwiTO5Iw074QfuN8kd7N6OiJoF3nNvfoUrIxWi+YJXygCYO4v+DTpkD2K3z2aLcxFXtVjQAUFSWRCPLrZVjPsSmZu0Elgnah+ZneO8uV4aD/5o1vutyzhX3o5P8cffvGeh+fVbztMV02TercfLLLJjTVJMfxCW7y3QFm0Fn+gfY6/0jQUlaKwPLciuAcOe7/x45I27AQyrfAujoRqR7KrItyKewFfuze6EbnKIYamf4S6Epr6cKTSi9S/LamyOlIzzFa/MntpiUfTzgQxQkL5Cd816jnErZJ81f6KVCCJUL/AbZE1SThWbPcX9/gKLAHAzzaL6jDH4FBixew47ysZkYMIzfBpLu25YMrjWE/f5FTBTxX3p3VRkElTUbm2OSz+lJpx27Gs4R24wQj6Nmp6l7cZ4MN3YGh8QAfOboLcL664L/bIWtDTjIADq3Bi40Br1a88ku28OwKMMIqajpZqU05sYTDP4gQdyc+Lc4ji5AsigZ5304juKkaV2nGf33kzE3XsIsccb+BFYKWNQM1VHaSVDyN2BGBBiSCFRd3PujZG87JFPCy9vdGyGkS09LUtfzmFV2lXNA/jq/UX3DxN+5+Gvn+3022IpvbTtsQcYyM0LLpSAshGS08vXr5W3jGJ78WoSPqn4nRJQ+cdpgHIfSD4Ar9Okh/m10dXCA2BR6M9HMM/Y+ktHMBBtsPVRYAE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199018)(41300700001)(6486002)(66476007)(66556008)(83380400001)(5660300002)(8676002)(54906003)(4326008)(316002)(6666004)(6916009)(2616005)(8936002)(186003)(6506007)(6512007)(53546011)(478600001)(26005)(31696002)(66946007)(36756003)(2906002)(4744005)(38100700002)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0RBRmcxcnRyRUp6eCsxWjdVNkJ0Q0grK0pvVldMN0IvTDZpWGVYREFCSE84?=
 =?utf-8?B?OHVwQjJZck5qUG1scCtVZHl1cVJCYUVIR2h6TkIvRWtCRGw3ODIybjdEU2ta?=
 =?utf-8?B?RUlkbFRGanZEaGV5SzFXdU1Ed2RxNUhKSlBJd0l6SHZPMitZTVc5UE9Kcy9U?=
 =?utf-8?B?Q0JlNnpjVWhLRzRhOHNCTHUwNENFdUhYNmJJczc5VGVvR1U5bFo0bk5IWGVl?=
 =?utf-8?B?MDRNQ25BTlFtelF4K3FIZ2pHbVpiTXQ3ZnRHaDRTTEZmSTNONFVhN2svbGdt?=
 =?utf-8?B?bzkxNTJnMDllVStaMzVVYWJyaWFwc1U0RWpiaEhWUHczV2NiNWFaTDR4a3Ev?=
 =?utf-8?B?TWpiWVJGVHdOZ1Y1UlExVkpCbW1ZMy9UbmJOd0kwZTUvbnR2R09ucS9rU1J4?=
 =?utf-8?B?bnYvM2QrMVg5aGlIbXdTVlNYVktPSHEyMjVOK3FIK0FyUDdJZmxva0tJaklG?=
 =?utf-8?B?SEFJRlhPV3BwaEI0ZjRqOUZWZVNDa3NQRzBQaEVXM3dkVDB0anp4aTZTaXlS?=
 =?utf-8?B?aG5TaUhLdm5WSDl0NG00UkNJa3g5WFpwMHhzK1JRSXVQT0VWMXlZQ0dsRENU?=
 =?utf-8?B?OGhEUHcvUDRIVFRrcFZxT3hoTzJvOGZqMVpnWEgwL3Azd0hmanBuR3FHd2pM?=
 =?utf-8?B?U0x5cU9JdE0wdGlNN1E3dmo4azA0QitmWGFnMnRqSG5BdFVnbEJUVTM4M25K?=
 =?utf-8?B?QWFiSHIzdlF0eXVJZ1NDZXFiV1IvdlNid0lqUjc0cFlQOExndWVCMFNYU2Rn?=
 =?utf-8?B?ODZZakNGTXNzeU9Cb2VlUVFYM3UvL2tNQ3pwM3dhZGpiaWR5L0x5U1JCaExp?=
 =?utf-8?B?UTduT1YwSzdqUmRyM0RrWXB3T1FvWUVtTUFRVlpQK1hPYzJ4aDNqUHFDMDYw?=
 =?utf-8?B?ZVpZTkZkSjBpVU1NaGE1T3RTUGVwOGVTNGJpWUNTQWt1VGNVOERtL2ZCeXNh?=
 =?utf-8?B?NE9LYStOeWMySlhNS1N0TTVoU2llQ2NMVHNWUkp3UHIwcnpyNFdKTU5yaVVx?=
 =?utf-8?B?UXhuTjRURVY2cU5ZNXEvaHBXVEdqcTY5ejhxaWV6a3hrcEtPK2NWYkp5c2ds?=
 =?utf-8?B?REhDNTlrN09KY3J0ZGNHZHFPVTZNbWlwS1Vud2xpaGFxUGdJbEVrMGFock4z?=
 =?utf-8?B?cmJ2N2RLRjkzdzZNcVFJbEdyR3FCa043V0I5YTVnVGRFdytYT2NEMzZ0NXha?=
 =?utf-8?B?RWRBUFBOVXRoWmtieFdHVXFKQmlFQW1IYWxyV2dRTU9rUkVVcmY5OVorWFJG?=
 =?utf-8?B?T3hYeHpMTkxOWGdKNHJNeDlFYjZiY0NiY2o2Tyt2M2UvbFFGZXJyZlI4WWlK?=
 =?utf-8?B?eFVWUjVkVmFjSXV6bHVvbC9KWnlRMU9mbERyaHd6eXJCeURiamVYYzRBVFha?=
 =?utf-8?B?bldrT0VvT3VGbHdRSVBaZWE2cUp1dEoxOFZEazk3TUVMdGlocVo2NlVFQVRB?=
 =?utf-8?B?aXJOYzZuNXNDRk81MHhUamZ3UXFYdmhXQ1MveUpkcGlwK0lBbFkwQnJWWC85?=
 =?utf-8?B?QkhPVkpmQkFaZTl5cTgyU2hPeU92QThkdmxScjdjMmlSSk41TFRNTmpVVjJ6?=
 =?utf-8?B?U1BIOXF2Nk1pTEhLdWxKYmdyeENCQ24wREozL0U4R0grY29mTDRDSjFqNGp0?=
 =?utf-8?B?YTVYM0RWODRTcWpXMUtPRlRIWHFOQkxTMUZkWER5bEF0SXhST2Z4OTRHT1N4?=
 =?utf-8?B?MHEzYzZmblNuV3lQamxqVUZFN3V4a3EwaFVjMm1OdHhOSjlsRkFYZ0dNRk5l?=
 =?utf-8?B?cUtJeHBsbEl5dk42dVo3a3BFY2hOUEZNQVhlamNiZ25KVGUwNXByR1k2SnRX?=
 =?utf-8?B?ajFWbi80SFEwWk1VNXFKN1ZmVGRuRmxNVmd2MU5iaHF5RHJ1VUlUcWE0SnJE?=
 =?utf-8?B?a2xPYml2UUJwckRvVFZlY2NVcmlpR3RmSTlGT0Y0RGlpOVlkOHZPbHkwUndz?=
 =?utf-8?B?bU5PQ2o5S0dDWThVc3A4ZlNNTWlUM1RqNUdRdzZIM1RkMStnRGVVQjRjSXF1?=
 =?utf-8?B?WVhaRlRlM3pmUy92dnpUSk5QYlhjWVRkQ3pIaDliK3lWN2VMcVFkZTRGdmlM?=
 =?utf-8?B?OGkxYUVvb0RyZFQxRUgvUUVDdEZFUXlnSDBXeEpQU1ZvRm1mcDRvb3NNT2Zq?=
 =?utf-8?Q?r5SO+wjhgfqOhEZShggeaFvsB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecade4b-c7e9-4c05-b08b-08db13fb90bc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 11:05:39.7810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qC6ePB/ke0SllpjLL2Ku4Kt5WGmiQ4zmJybO9XrWxu4xKPLBb+IDKvjguLAASxeKOsksnK0q+u8lkhXhPmpIHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9340

On 20.02.2023 12:04, Andrew Cooper wrote:
> This is generally good practice, and necessary for livepatch binary diffing to
> work.
> 
> With this, livepatching of the SVM entry path works.  The only complication is
> with svm_stgi_label which is only used by oprofile to guestimate (not
> completely correctly) when an NMI hit guest context.
> 
> Livepatching of VMX is still an open question, because the logic doesn't form
> anything remotely resembling functions.  Both code fragments jump into each
> other so need to be updated in tandem.  Also, both code fragment entries need
> trampolines in the case that patching actually occurs.  For now, just treat it
> as a single function.

I agree.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



