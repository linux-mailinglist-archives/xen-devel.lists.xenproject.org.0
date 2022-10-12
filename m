Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C84A5FC6B5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 15:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421185.666391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oic49-0008KF-2C; Wed, 12 Oct 2022 13:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421185.666391; Wed, 12 Oct 2022 13:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oic48-0008HJ-Un; Wed, 12 Oct 2022 13:46:32 +0000
Received: by outflank-mailman (input) for mailman id 421185;
 Wed, 12 Oct 2022 13:46:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oic47-0008HD-6s
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 13:46:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70074.outbound.protection.outlook.com [40.107.7.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46567ca5-4a34-11ed-8fd0-01056ac49cbb;
 Wed, 12 Oct 2022 15:46:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8581.eurprd04.prod.outlook.com (2603:10a6:10:2d8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Wed, 12 Oct
 2022 13:46:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Wed, 12 Oct 2022
 13:46:26 +0000
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
X-Inumbo-ID: 46567ca5-4a34-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lO7Cc5MWsbaEKan4P6F5d51QXMuj0DS9Psf95qeNzPG1uazTXtBmwqCnqyRxQgUzdFRaJR9HTpJVpUTbLEDj/I77j33k69p1DdWqXVc4+BpIj4Oc7GyVRRP5TsPUBF6XLhitpyGw3I4/sYz1KWjI2977yxCwL/isJdn5MzPcldcypQRO10O2b1zdiiJNvGCyDu50bgljOA5nAqp0YJFh9XHwoIocVXgA4VfiSgu07kVAmdblkogb4GCh0/EdsSyUKSt5qhAADnKNHiMUOOD7Hy2uRyofU6HXi8eTyIParhVyrBEskpD/yNiSPEQcTiO8vrlzgN8JgiXImnpOiu08zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QiShWwjdzjchzvdOjo90MiNbU72PRGGkQNLl+VmQa0=;
 b=QqtXRsoFkEeSAjWy5piIlgjS5qPfz7SeaKtplQzgRaC0srGl74dyeOafvXoR3SUugSHTBRd48JiGWVhMHXxOSsh1oGPgGe/ytpaTIgMssXe4p0PM+W6vmUDeDqxuWfbGCi/0dHP8jLq9cSE2aqw7ydjZuom+Lrgr0VhclqTdwrQz7pL3Z1s9rDPswI1FeNfQSU/uR0pJPGtoRM5U+4taNtVj60nqlXV0Cksd/PBEOkQRzvpDKdbiEbahNQy35CNQ4OaOYy/Nz2gOaZ4to02EtEu6DHJxq9SWgmNpmPPjdb2b08ZDp2Slmqg0ngrH0OeAHEcmqvjhlqmtVWH9EZk2TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QiShWwjdzjchzvdOjo90MiNbU72PRGGkQNLl+VmQa0=;
 b=R64yx17vxUplx4Sr4NpF5y39c3Nc6rtsWYW5DbpHedQfbukSfdYWRMGPiLJIj/abtkIOHthE9sx8ts62TPWNG7pRFd4rBIsLnbiSAibXcJJlksFtGW77kIxNlTI0s2tL3Synx1b6wE2v2mrtOonNSekLh+2/QZSgjJMpAX5ThJ0O9zLap/4KJImsdrFS68cjfSOxoiCfbkqRejgTqiGjyWRTka0Ye/KdxCkHlx2DbXudx32qpueBaTv8BqiPbGErfxBLUN50m9QbV0zl0QzzrjBAAYyrLROFs+me8oco5veiTLEydWM0op2PrEXWZjz0JZFuPd548dLmnjftfJOovA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a7eb93d7-1921-c847-1b76-a0b5454b8cef@suse.com>
Date: Wed, 12 Oct 2022 15:46:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 1/5] x86/mwait-idle: add 'preferred-cstates' command
 line option
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
 <0690742b-21c8-e5b6-e8ff-5d4709e0c3ee@suse.com>
 <Y0WYM/trMDVja61r@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y0WYM/trMDVja61r@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: b99d5c0f-0a6e-4cd2-ce9c-08daac5828b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S8TbnCDjP+afQ8ZkjccYwlsl9az+04GXR+XCC584wiakLhaZvc4IgoP0LI8BRBXhJin98lR3S36XEdqxp/TfxL14a2i3/uEqgEY0lCowWD3CmeMlodAki5uhwTXSgjLBHFw7SMb+86HzIY3J/cy7mLQs5UkKYEzrPsmWidvkiFyb6uRqSmSuO4Pe2rk7oUwZvy9v2bnLCPpMmepaLFtGEYW8TtH63a2ncPmzjyymdwjTWSVvU+MFgKNdowaKH7GbrUkTkpvKqdGVs7f15tJd9UNLrHDIgtr/oPdfEzWXiqHvWiUgaMutRUcj1lZKm4zSz/9iaZq6q2E/Qo0z7t+2UI3Q952ecBE8KXSyrRxzNxdCi8OfwMHCV+pse3p7KToNwwekhExL+VHQ0hXjyZjgamHzdvOyEvKPQZdtz5bJOZrjhBHxrJElw0QUQJmXLYgWXou34dGgcwQ4ZAXw8VWSl1m4HU8KUAASxO6DFXuYoYE5z5ql/VFv9NB31zst+393atsCkzQgNuNd0B6CdIX+Ws4DLm5rGAu1zxj81ZtJ7zaCanAxq/vCvLbtcPwArkKeGIa1N75B3gDx4Fa5WjUzXR4s6NehgctwQxUughN7uS+wx295B7U3Lb4qmdxp8BulUlWhYpxArS9+pnDIaixDNPKf9ManX5Qh04EKGvFtlohSKMa13F77U5wFiSuo5q0gXYy77ardXkeHF7yMfv9e46o86DYbeljBFx5ShAn02I/5WF2EWEkpa4yOjGSCsb/M2STZKDX1LIqDWKWrkuTR59QqE9+uJEqrlyLX1atW2TU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199015)(36756003)(31686004)(31696002)(86362001)(5660300002)(38100700002)(186003)(2616005)(2906002)(6506007)(478600001)(6512007)(66476007)(66946007)(8676002)(53546011)(6916009)(316002)(66556008)(8936002)(4326008)(6486002)(41300700001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZS9SZjNaNlFET0VmRGs3UGI4SDYxaWQ1K3NFSDN1MktXbW92L3NpdERWZkFt?=
 =?utf-8?B?bUZ0TnRaQTVBNXRrM3pyYUJvdDBqNTR3UkJaTitlY0lYTm91cGJmV3E4RUZ2?=
 =?utf-8?B?bm4wdnI0RWVQa3lRNktVczdia3ZaR1RWQmljZUU1YVZmZkxXTGRDZlI2YVJB?=
 =?utf-8?B?Rk10SURtVUxSTTF5T2VlTXF6VzhWVTVsRDFRZGlNcEVHQlBsM3dkaXVsNWQ3?=
 =?utf-8?B?N0pjV3dnMlBncnZRc2RYYW9nSWFQWWR1ZjZWLzZ5SXpKdmZXQm9yRk5UbUJ5?=
 =?utf-8?B?a0Q3TlNCMisxR1d4cWlVS2tzWDA4NHJmNTFrUDNmNExHc3RLSW5ZV1E4enVr?=
 =?utf-8?B?QXRieDc3VmVvTVN1RVBLR0Z4UTYyTXpkTndYUzltRUE1OXFtNVZhVitDa3Rr?=
 =?utf-8?B?c2xsaFowbUhOcE9tVFJhcGw2dFNGRElCNnVGZ0xFL1diOTIzQWZ0K04vQWVH?=
 =?utf-8?B?UGdjQ2o4YVpFbXZKRkNlSGlGOXEyME1tTVVPRmJ2N0dyRmY3Qi84dERYejUx?=
 =?utf-8?B?N0prZDdQdkJBSmI3aXY3OFIwNWQyQ21WdWp4T1loY1pwZjYrUTJFTkpPNldN?=
 =?utf-8?B?KzhmSXdOM2d0aS9NdHlvN3dXSFFBaXEwVjF3K0NIWjV2YmRCRXU5YzdUaVph?=
 =?utf-8?B?M1J4L2pqbE1YcFNaZXluVHlkRVVCRzJOQldNNnh5M2M0WEdQVDJLenIvSXdU?=
 =?utf-8?B?ZFdHc2tuYzJRdkhyZ3o3TEVjUTY2WngyVk1wWUtId2ZJcW5YbHJYUXpudzRl?=
 =?utf-8?B?MHg3ZTIrR0hWZ2lhWHFkV2lvZnZGSk9DN3hEZGkwU2kzaFRJV2YraytqV1pR?=
 =?utf-8?B?U25rTW43OWJHQm5hbUR2QkxDVnNDeWFOYnMxWWFoN1V4VS9Ob21tZVdndGg2?=
 =?utf-8?B?Z1NFTGRCclpTWm1GeGVhVkZIQU44eHIydWtJUzg5bmZFS3JvOVljS1MxV0dw?=
 =?utf-8?B?aGNqRWwvd25NNjZHMEpkRldGNVIvYzhicjhEcVVaVzRlL1lhOWU0ekdGakw4?=
 =?utf-8?B?ZnpKa1g2UmRnQkh1RUNLQW5Md1Q4ZTBqbkpkMU5uSDBSTXVrZFJjM2g5QjNK?=
 =?utf-8?B?aUVFR1MwYTljRjF0OW1ZbUJiN2I2MFNCRjQ4K3A4Q3RTT1ZCMVNvcGF0cGtX?=
 =?utf-8?B?dWJzcW82SXVpMGhkZTlxbkpqbDVYdDlBR0grVzZ4eDRTTVNFQmRROTFsUVFT?=
 =?utf-8?B?dFZNN000VFkrRDBUa0F5NHczR1NoNVpZaVpCZG9hSWRRTjNyT2FiQktBNXZS?=
 =?utf-8?B?Vm5VSExsUGNjVWFSV2I5T1VaQ2svV0lueHdYbTVhcjRHNmVlT2gzWTgrYncr?=
 =?utf-8?B?TjVjYmNBbGZvS1lQRmh4ZG4zMXoyckNlVHpvSE9zMndPMzMzdGhRZThmQ1B6?=
 =?utf-8?B?L0c4TnM1K3N5djV2dUNNMVRkK2RjUWZQMzRQMGRhTGREZ3RGQmxoeWVMMExU?=
 =?utf-8?B?b1RVdHRnZXE2RWsrYUJ3eThsdUJ5OXFIZFFzNmlWMGhCM29KT3lRRkY5MGdp?=
 =?utf-8?B?cjAwMHNCZ3FQRXNJNmRXTTBpK2RScGRTVC9vL1hEcVY1UTB6ekJnaTJSdTBM?=
 =?utf-8?B?VDB4T3Bac2RRTk02UHBBUlR3ZTB4Mm1SMGdTSzVSNWpZMWV3R2ZWeUk2YWFT?=
 =?utf-8?B?bm1zNE9jYXl1cktWRmVhaXdTaVBVWnQxRjQ5dXBXWHFzb1pDWDV1OWlCSnRS?=
 =?utf-8?B?SldSOHBsSU1HcWVHWFhUdmJjeDUwSVhKOHhnaWhmZWxwMVJ3M0VCTUZHTk13?=
 =?utf-8?B?YXJ4bXJXRzVkVjZkYndweWl0VFF2RzNwUkJvQlJ3S3ZlMVFrL3dwdjlWREpu?=
 =?utf-8?B?K3lNZE1SbTBySUFCVTBicDBWU1BhUk8wL3BrZ2FCUTgwdE40SnhGN0REUWt1?=
 =?utf-8?B?V1YwOXJsZHd0cEpjU2w4N044dDVCS2tGUGNsL1FxMFBnM0tvY1lWVWFZNndW?=
 =?utf-8?B?eVZ4UFJHQTgvSUFicWtRUjJmVkhzdldpa3FUeUtnOVA1SlRZMElxa0lUMG5T?=
 =?utf-8?B?aEIvZmJ1ekFvVlhHREE3RDM5Z1AvOSs3OWNIS2VyaTluUWZsSGRkTHVERllt?=
 =?utf-8?B?VlZnT3BScktvMkF3d0lqeU9qRnpUcjJYVi9JNUg0d0hsUlBlZUdEb1RQMzZm?=
 =?utf-8?B?aWpMREV3THBibWpuU1ltMWVQVW9RTUQxVEt2OUdYT1daV2RIbXhBK25hQnZZ?=
 =?utf-8?Q?28fxH9pHJRjvwTiHp91TCY6UJHQUBYgGpJvS2zhUtJ2z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b99d5c0f-0a6e-4cd2-ce9c-08daac5828b0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 13:46:26.7996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTwKTN2ORNKlhTt6sv2eQ93Cjtwgzy2HMagXVqNnTvrZgUY1T9megPliAEVUzx3XHjfTZNngpMnlYQ4uh2QayQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8581

On 11.10.2022 18:22, Roger Pau Monné wrote:
> On Thu, Aug 18, 2022 at 03:03:33PM +0200, Jan Beulich wrote:
>> @@ -1309,6 +1360,39 @@ static int __init mwait_idle_probe(void)
>>  	pr_debug(PREFIX "lapic_timer_reliable_states %#x\n",
>>  		 lapic_timer_reliable_states);
>>  
>> +	str = preferred_states;
>> +	if (isdigit(str[0]))
>> +		preferred_states_mask = simple_strtoul(str, &str, 0);
>> +	else if (str[0])
>> +	{
>> +		const char *ss;
>> +
>> +		do {
>> +			const struct cpuidle_state *state = icpu->state_table;
>> +			unsigned int bit = 1;
>> +
>> +			ss = strchr(str, ',');
>> +			if (!ss)
>> +				ss = strchr(str, '\0');
>> +
>> +			for (; state->name[0]; ++state) {
>> +				bit <<= 1;
>> +				if (!cmdline_strcmp(str, state->name)) {
>> +					preferred_states_mask |= bit;
>> +					break;
>> +				}
>> +			}
>> +			if (!state->name[0])
>> +				break;
>> +
>> +			str = ss + 1;
>> +	    } while (*ss);
>> +
>> +	    str -= str == ss + 1;
> 
> I would add parentheses to the sum for clarity.

If I was to add parentheses here, then like this:

    str -= (str == ss + 1);

Looks like I've screwed up with indentation here, though.

>> @@ -1400,8 +1484,18 @@ static int cf_check mwait_idle_cpu_init(
>>  	if (icpu->byt_auto_demotion_disable_flag)
>>  		on_selected_cpus(cpumask_of(cpu), byt_auto_demotion_disable, NULL, 1);
>>  
>> -	if (icpu->disable_promotion_to_c1e)
>> +	switch (icpu->c1e_promotion) {
>> +	case C1E_PROMOTION_DISABLE:
>>  		on_selected_cpus(cpumask_of(cpu), c1e_promotion_disable, NULL, 1);
>> +		break;
>> +
>> +	case C1E_PROMOTION_ENABLE:
>> +		on_selected_cpus(cpumask_of(cpu), c1e_promotion_enable, NULL, 1);
>> +		break;
>> +
>> +	case C1E_PROMOTION_PRESERVE:
>> +		break;
>> +	}
> 
> I find it kind of weird to user a notifier for this, won't it be
> easier to set the C1E promotion as part of the CPU bringup process?

A CPU notifier _is_ part of the CPU bringup process, isn't it? So it's
not clear to me what alternative you're thinking of.

> I see we also set other bits in the same way.

Well, yes - right here I only extend what we already have in place.
Re-working that in whichever way ought to be a separate topic imo, and
preferably not be part of a port of a commit coming from Linux.

Jan

