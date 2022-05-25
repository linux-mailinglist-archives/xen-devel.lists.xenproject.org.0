Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21C95337FC
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 10:08:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336966.561420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntm4Q-00056h-EE; Wed, 25 May 2022 08:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336966.561420; Wed, 25 May 2022 08:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntm4Q-00053f-Ai; Wed, 25 May 2022 08:08:42 +0000
Received: by outflank-mailman (input) for mailman id 336966;
 Wed, 25 May 2022 08:08:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntm4O-00053Z-J7
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 08:08:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e23d22dd-dc01-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 10:08:39 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-lEM-exwRObW-1JXcvb0JmQ-1; Wed, 25 May 2022 10:08:34 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5095.eurprd04.prod.outlook.com (2603:10a6:20b:a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23; Wed, 25 May
 2022 08:08:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 08:08:33 +0000
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
X-Inumbo-ID: e23d22dd-dc01-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653466118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTa4xJIqbw+9NUeJ00BUAhQdmBU4jn5bKML4SzZSjPI=;
	b=NL1Phjg+me4nA27PX+21AfZxxnCXDiWs3qWdANzr3+B90Fos34myODu9KQm+H2FfYYvQps
	pHha9LobUYqMxjCRgUqwuxIhDooWP/VfhJmqCsbN39c1Es3XABn/0p7KmseJyFfXSYmuSX
	GqBWz78H2glG4snzNmcDcblj2htoqx0=
X-MC-Unique: lEM-exwRObW-1JXcvb0JmQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAI7zRfj+GBZ3JsW+Ns7LSzpMX/PrrLHA4AILad7z4cJ1q6DCGiBtZEotMUgGvNTzAWaBhZFpKzxpAFftywkDBNonyPcf7D61ubdZPhbcqLqSuAd70uJDN3VpVp4fxofOYjpHRt4FmLWruBt8W8iKV4sFv8gKgA6bQ79X6rY2DfRCPgvgaRcXLJuhE5tgkHT0d7ecP8Ho4boM/1/7ORxaaDdVw+dEyIgHrahW9gBlm8Up+parmOpyUEcmfe54U5kZ4NfI6VPnYnBf6IluWNw/SejAQa6d9sHrBoqw1EYLLHK7BOormn0VV97lTy1a9Y2YeK7kJb/JEuWmmQhxQj+1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTa4xJIqbw+9NUeJ00BUAhQdmBU4jn5bKML4SzZSjPI=;
 b=BrHPRQCT7bfHaxl81jX9EWXV9GSe0QX1PBnQrrf4yiQhReOC4Q7gFlP/Fm5+br0L+DOv+ha3prdhNh3z3HLYqIanE7SuHdtbZZPFJv4Ho7e/HZY9RnIQgLfoAUjYq/VkzNVESHKvVyDbABfFA7ceGvmi6zy8dcTSBBZAbKt+yHDxjxzNzN+BBJbgfrB+pES1MwbX5izHKt/mqjPhfJnmRsdRx6z0qcAdHyEVo+MJ4lHYD7WpjQBrwgeLOJrffNOSwUzLXry/BMsf7DtJh1ucp8ukNI9nwhAphkLsqd47ZOb5kry0jt05FD+h6z+SzC+FeOmnUJEVJD/+H2IPEyzFZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6604372a-67a1-6ad2-bbcf-d6b4337a4bf0@suse.com>
Date: Wed, 25 May 2022 10:08:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] docs/misra: add Rule 5.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 Bertrand.Marquis@arm.com, George.Dunlap@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-2-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220525003505.304617-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0038.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b96c073e-afdc-4b65-6327-08da3e25c2e8
X-MS-TrafficTypeDiagnostic: AM6PR04MB5095:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB50957CE16111BFEA1B7A99E9B3D69@AM6PR04MB5095.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3cXZgIs6GUihl1jzJRWsI0ApglEpNwXacQPoXHxYtyjZJcAu+O3c+3Baplcy9z/8fpUDwhPfeJIiS45qx3Gj+9sNK0/ZSj6FWcWiznNoh/Ew834E4Fhj/RznNTICtH7qPoNQ9l66MpxaWBswMN8rA6rJA2/ErW+xQ89KLF8Xh3rQeRUuAyILZOIdxBwyYByyuGRKC2hRpYcNGE2oSWeLHSluquk0IjYotdQuja/YJQPC+grqfUuO++1ecEgBNWU5n7WJ0Cb3vmj2N3m3TzehVf3vWxFbpHUofyqO5/sKZjwQxhvJ0pd/EtQPvwSO5QeXCUzxqQaEcE1V2QUPLUXCrvLiHtHitBce4lzVL7rRRLvHwGLP3VWbW8PkmbZuDvyJ30nB5bl2RVdYNJYDTGHVoVHipGdYxVDykSjjuNuv6JiKlSodiKX9DeGl0EZPTyuOe9MsSGe8oaT1xcZpFAeewY1e99aXWILrWvGUY4l7+O9ZWM3gM6p3wD3YmIv2zWZsh9Ne3CwuselDLmPlCeUCq1nJ+ne+VemT39l0Owf6d7fDKZmTnPVOfV/d5xyTbyXzoN8IINRU4GzqG8mGIQvCX8O279lLYLMPAvK+zjh3o0US+z8PaVyKp0dVtoeRweaap499uRr8IRS4daFICUFwJWg14EQ/4gptI8IGtv/vb6nlx/V8NIh09sMd018nD7xjJKBHA9WBGpOfiLTqHyBf+RVoX0uhRAFydPuHMfk2pDzbjT6O5CzDPUTsowl7lJma
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(86362001)(31696002)(4326008)(83380400001)(66476007)(66556008)(8676002)(186003)(8936002)(2906002)(38100700002)(6916009)(6506007)(5660300002)(508600001)(6486002)(316002)(6512007)(31686004)(26005)(36756003)(53546011)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0NYWnpKU1JvZWh6b0owNEZYWW9EWlJpNGNyRUZnb25LbGtjeEVaSEdyT0hv?=
 =?utf-8?B?SzhyK1VFQ0NoUXhNVk13akVOOVBybjFxMnpUK3dOTHJhQTFvZHdQM1RIQzZv?=
 =?utf-8?B?aHFNUXNzaUZWOGVoRUlXbExhYXFUZTY5WWxwT0EzZzJrUjhtTzZvYVFrU0dP?=
 =?utf-8?B?ZS9zZlpmL21iY0dTOEFCOFc3UkxVdEplUmQzL0xUWFdrWmdOdDRITDQrY1hL?=
 =?utf-8?B?QUwxQjFMSWZLRFprTXh6OW8wbDdDNSsvT25zbTZMWHFtVXIxSUo1Vk53cXkx?=
 =?utf-8?B?QzgxaFk0YXZERVRjc2V6RmlYTEx2VEV2VFlHTDVZNUhXSjVueVFmd2dXeXBu?=
 =?utf-8?B?dVJ2eFhLTVhWby8vc3FzTmVzdTZkL1Y0K2UvYU41WlJXNDltYVFGWFJidjJM?=
 =?utf-8?B?ZmtkaC9VaXVPK3pMVkV0NG9BY3R6Y0xvZGFQUjV1cVRZeFczUGRhZUhPUEYw?=
 =?utf-8?B?azh4SFF4bWxuWW1aZExYOUJKYmx4RWVhdC90ZGhYbm54ZzhwK3Vtek94bFJN?=
 =?utf-8?B?RmQ2SHhPV1NXYTZGT2lYTk1ralFXWnA4NU1IekYzMWg2M0srcktyZXVvczRs?=
 =?utf-8?B?Nk1PNlFUa1hRSEVyUzNFcUFEN0ZlZ2o4dWZLMDI2dGRBWjBsSzRwUXVpRzdi?=
 =?utf-8?B?dlBMMm5UWFlhdXBRV2F5enBJeXJua2RXS2pDTXcyS1lIdXFDbElGaXMvdm9N?=
 =?utf-8?B?bndGTnhNWnNZY3hrNzFQaUxqNDNmWko1c2d6cFdaRTVlWWIvaE5TQXoyZUd1?=
 =?utf-8?B?bjhwZnFKUUNGd3JwdlEzcGNYSkIwMGk5MHVjRUt5d3BuZVlNMzRFK3dZV1kz?=
 =?utf-8?B?a3BCK2lVcjJtMW1DbFIrbHdZYnUvVHlhNzZvaHFjZFo5NXplM0FqdHVOR2p4?=
 =?utf-8?B?YnhlZXdzellXV0NGM295eHVFSUdpd3NKRkExam5tdGsxbm9zQ2FZNFpvUkEy?=
 =?utf-8?B?bTdJR0tRZWZDY2pOMWxuZ2NZTkw1N1c2bDA4U3ZwSDFMbFN5TzBxMDBSUndY?=
 =?utf-8?B?SmEzSDFyTlRBTHo3NGxaWlk2S1huNkU1QUt4b0N2cWJBcXB5ck5OVWwvcHB3?=
 =?utf-8?B?UVdMRlVnOHVQK1hmRHhjeUJlZGJ1d2o0cHFvaWN3YW9MbWRJbms0SGhOdElR?=
 =?utf-8?B?enJmd2hVMnVtYXdpeGZHYW1sVi9tL0lWWEk3RDh3YWx5REdPU2JyWGhGN212?=
 =?utf-8?B?Rmc4RmtoR3dFM0E5TjZ0blBqc3I3dnM3YUNob3dBR1FERmIwVDhMQ2xJa01M?=
 =?utf-8?B?SnhpTWhKRWlRWXE2UjNDcjFMM05qeHZaa1dza3JjckhMblMzSVN4MlQxdEFs?=
 =?utf-8?B?cUljT2VmVFFzSmU2SSs0d0I5NlI0Q2ZSZ1o0UFZKbnhBbEhiNjFHV1g5eWll?=
 =?utf-8?B?aThLMUpLNlNNK1FPQVVrVUZ2R3JoK0dqUWRsZmRLLzFOUUNOMWJNSzRYRm9K?=
 =?utf-8?B?TmtnYVZEUUEwRU1VV05zcjJkRnIzR1FDejcwNnlqTVFpU3FQMjFaWUY0Y0dS?=
 =?utf-8?B?VnpWMEZXUVcyYmhmcElwK09BdDloSTA2OTBoeVBwWW5UUm1ySjNGWGEwZlpM?=
 =?utf-8?B?OEhhZ3E4RWJ6USt1RTFYc3R6bktuWkpkWWJSaU44R1c5RDRGejRnL2psNXlq?=
 =?utf-8?B?ZzQ5T0RYaGlaMnhONHpnYUM2clZ3clphc3lSdm00ZVdTSVFqdnZES3YzUXF6?=
 =?utf-8?B?WkJOaFRTMFB5QW9sVXZpZXJsNEN2SzBaRW5OUjh5OVdCVTAzU1NKK21GR1Mx?=
 =?utf-8?B?eGpZekRvZ0QzOFQ4K0ZKOW5ra0pQSDBqbjVvbHpqSFQwK3RWbEpKdmZqUVhn?=
 =?utf-8?B?bkFOdXN2Mk1OVXVTcVJYcEFQVlBrNEJQczduR1ZzaDgydzVCTUpiSm9TYTll?=
 =?utf-8?B?ODdLaGNrNHhWNS9INzJod01rWDg1RUE4ZDZCVWxOQytsY1gzNjVEb0l3OXhl?=
 =?utf-8?B?ZVdVSVFrRnA4QjNBYnVoczA4QXI2TEgxelZ5Mjk0ckV5dDlHZkZ5cG4rYXBx?=
 =?utf-8?B?MlRNWmc0K2xnd2w0ZDQvdTR3MGNKdVF2dVMyNHhHOHRENThCQTJiS1Babith?=
 =?utf-8?B?M2MrMFlTUTB3ZnFIejI3YzgxejR4M1J3Mk1XdjZPNFp1YVlxYjdqbHd4Zjdh?=
 =?utf-8?B?dDM3Vldkdy9kQXlQTldPZTFaazNvN0ZSSlorS0trM1QxT09uYUN2ZWU2VGlP?=
 =?utf-8?B?TWtYT3hyL1J0TC9SdU40S09qdnBUbkNaTWRVMFp1MDBBMFpwQWVXUEEvZnEx?=
 =?utf-8?B?NEF4ajB1UHlYWjZGdmxRVHhKNWoxR3FFbGZXOXhUd2VlV0xTb0FnSGYzNTZS?=
 =?utf-8?B?bXZvRHdLU1BxdEpXeTVSbFo4YUtzR29UTWl2UGFXY040LzhHc2lEZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b96c073e-afdc-4b65-6327-08da3e25c2e8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 08:08:33.2161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXn0tNLyuhUeaFWsj/pbeCln8TV8hbmej+9qj1miL6ZpjgRj+AtZqPoeb/v6yUfQuvj7eQW1H6t9Zarsee881g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5095

On 25.05.2022 02:35, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Add Rule 5.1, with the additional note that the character limit for Xen
> is 63 characters.
> 
> The max length identifiers found by ECLAIR are:
> 
> __mitigate_spectre_bhb_clear_insn_start
> domain_pause_by_systemcontroller_nosync
> 
> Both of them are 40 characters long. A limit of 63 characters work for
> the existing code.

I have to admit that it hasn't become clear to me why we want to
permit (if not to say encourage) the use of such long identifiers.
If 40 is the longest we've got, why not limit it to 40 for now
with a goal of further reducing? A 40-char symbol plus some
indentation will already pose problems with 80-char line length.

Otoh, as said on the call, I think the public headers want
mentioning explicitly here in some way. Part of them (most or all
of what's under io/) aren't used when building Xen, so won't be
seen by Eclair (aiui). Yet they are a formal part of the code
base, and e.g. ring.h has some pretty long names (albeit still
below 40 chars as it looks). So once we're able to go down to e.g.
32 for the bulk of the code base, public headers should imo still
be explicitly allowed to use longer identifiers.

Jan


