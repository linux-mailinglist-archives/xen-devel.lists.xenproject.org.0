Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFA6533B6D
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 13:14:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337153.561685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntoyE-0001NR-Nh; Wed, 25 May 2022 11:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337153.561685; Wed, 25 May 2022 11:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntoyE-0001KW-Jy; Wed, 25 May 2022 11:14:30 +0000
Received: by outflank-mailman (input) for mailman id 337153;
 Wed, 25 May 2022 11:14:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntoyD-00014b-34
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 11:14:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d732e111-dc1b-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 13:14:27 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-aGUgnSNAPNyKduO_T0bkNg-1; Wed, 25 May 2022 13:14:23 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB3089.eurprd04.prod.outlook.com (2603:10a6:206:b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 11:14:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 11:14:22 +0000
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
X-Inumbo-ID: d732e111-dc1b-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653477267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n6DK+tzO8rP86G/geBqHgX9OpuwxJNAe5Nnc00egIcA=;
	b=UN1m+knTOlR+e2x/2+fB9hIilqdTLljHAWfVpLNnL0wCv/542pou3+r+NKJM90q6BUJYJ9
	2BLpNTXllVLtg2snbJJ1utbM1FSUsyrIm3ZBA1/udtduX82AYjFUPGAxZhwYpSGIz4tVIn
	heeZZFXjiDStszcQ3LDt3ifzfbIm0/w=
X-MC-Unique: aGUgnSNAPNyKduO_T0bkNg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYlD14nYrGP7zYs8h+RtNgTtR4BoBOLwxt6L65eAFAshXwVkM/CnFq/CQjMUByoZcmT6mSBmZpwT/7rsULlQAPYnyfLScwHCJeUTY2u7jJOC2Ew3X0iahcjIQ5k/c+YymiFIXPjT9Fvwmx3KNHwqJ4+WLHo5nGy9imfni8GS/4aBAT8OdzCLQjxoGYLwJQEHFVEcE5Q84k0kzwszslePJ4qHeF9AFGGWfXjThvDURog3OKg3wCfPA40MTt/+v1X8i9WElsujQqJD+7sElsXHWaNEfnleWfxqKw4zzFLdEiSzRXC0aPKtc4aFd5D/QxT3/Y54Ohimt3vRi6/WFzw8Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ynjWuKvzvrgYqBsbeVJslEQHd2T5p+jjmq3xYWfbf0=;
 b=mTTiPHKnAa9BRDBbqrGTn/pn13kadYmhXx13p3t2FUkkTJWh/xb0H1Xwx+J56QhyPnP7AqUv9a8ylm4QU7nJrYDDHBymQSFfkEKRCGh1c1IzHUbfYKDtCCpwienSywrtVBsgtQLKUilxWNLDUYaQ+3QLaE+mmZ8hfWMQ1cEWPXT4+RoLdXF0xmxYnOXwao3HWh3rtpS9oFndqTxxyzi9DF8JMaeGfSr8bdOSmRYYLPnLZkFoB2zNlAAKk3+HQQdluouGBQjgFE6HQB8AxH3FlfYgLpjV+yxR/WCxQOY00MfHz+IytOEpMYWUs/QmLeXGniAYht5YBCYzLpEiM5OLwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fceb1ddc-0236-69ac-7d36-766668a22599@suse.com>
Date: Wed, 25 May 2022 13:14:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/2] x86/mm: rename FLUSH_FORCE_IPI to FLUSH_NO_ASSIST
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20220525081311.13416-1-roger.pau@citrix.com>
 <20220525081311.13416-2-roger.pau@citrix.com>
 <58aa1cc1-3a67-60d4-6f8e-6c5746b05614@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <58aa1cc1-3a67-60d4-6f8e-6c5746b05614@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR02CA0013.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0962ce5a-f6fa-4765-65a9-08da3e3fb85b
X-MS-TrafficTypeDiagnostic: AM5PR04MB3089:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB30897CE85BCB5AA4081E69B0B3D69@AM5PR04MB3089.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/xKeqau5KvYMlha8MjQYecqtPjoqPOGaY8dcW+P7sKEUFu1JtIz8eKhQdoWqGAjWzmViJYIyq/335V7hjVpNHBiJJESclegHcJhdBVL1FNNlgtZB3bRyTvnQ8Znil+eLxi0LHNYzrX/N3hX5Zh91iq4NEWDkpm6MRWY29EgW5syhynlsTl6KHwgyV0oLDuAXxexQ7pCwUkLe05cp2Ejd0J8cLhRbv7P0SHkujZ+5PPIfPdj9tylMEp/2FK/RpI81SqaVkcDCMP/MKIlkXMR9UpQYSdhaJv0uvidV+gdltjOLm3TRp7isMMn7rfkh9ABdMdMwrhzhktRYmqwb6paoWvc8pkjBdp2odKQFFISVfNlujFvKUunUbHwlhH3Fyph7kFgNfYNtlnRNUffk73sBsf1LlRtexvrtRg+gWjAdMVUudYu3IrAUrqT276r35vRSmMZM7bEQTaUDhlu/s2NtwyqAwrZ5U6EP8ZdN25VCxAkfGcR/6ATYm3YzahSR2fdFQfAGRnnx9sShQmE0PvlGAHAF2O8lroIlAxyQPL5zkuVaQ8WHZwZVTSmvHs4tdhn8pp4JFLf3uV82TakC6a3W2k3ARaXladOONvpogTfccRTEochOkZJwOoOyKZfnloTxPVp11B58VrueG3t6rJ7qOcRZ3TcHyqcaxq5vnNfklszOyNgXKzNQPWGXFoXmrmmBSv7ofpoA6JUY1ruH/OjJ65Cey8Ir8vKqQoGbaWEfZik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(36756003)(6486002)(2906002)(6506007)(316002)(8936002)(31686004)(86362001)(4326008)(66556008)(53546011)(8676002)(66946007)(26005)(508600001)(6512007)(5660300002)(66476007)(54906003)(2616005)(6916009)(38100700002)(83380400001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q7BfXRuwVvBufZ0Ch5qmqDAHEJgDdEaZ7v1D6Lpl/gGYWVxxpmE4iLqL/aTr?=
 =?us-ascii?Q?BX0W18ebLtIMtWqS1cR2ETHWEY0VTeJdsf08G01+hWH6PDOhYKcFX7Eb/Dq+?=
 =?us-ascii?Q?jX0ELNyOOVgdj5cFr/ANvHETaFLxUyTKMrH/OgjBBrReO8BiP9b5Z1zfPC3U?=
 =?us-ascii?Q?UQkgg0UZ7pPt122S8XrOC/yc478rUlpp/a3ERHw+l74xcUP+1ioz4L+ZcvA/?=
 =?us-ascii?Q?tQZ8RiCcfpJlAOAyWf47ky/8lZYUcuvU3bXbned8RHgCW8dAeGjd0eISi7fh?=
 =?us-ascii?Q?CT+g2bc6w9F8Z8r/6pbpnoL73IelBbL4TvZI5zPeOW3dWjhlwJ7y+o63NAZk?=
 =?us-ascii?Q?pX0WB5sMwL92wQFE6DqHh9c/c79BgHB7KoMUcJuG2tppVuhTX7rz20Pa/wVh?=
 =?us-ascii?Q?Xf+bIjpiZcaInZeNJhx1ABwzZycgQo2HCaoO8YEAqvgpsg+Cjw3BSnvG8A6q?=
 =?us-ascii?Q?oKtSGI7cmM1A/urSHtpD4uPb/rIq+tE+5wdQq0dU5DjGUuHl44Ug+oXo/vlf?=
 =?us-ascii?Q?ZN3y/odLdT0d2d7iesEoaQdY4KhCvEg+IXm1WKeQdPsX4NrxLI58dIgaHjJJ?=
 =?us-ascii?Q?iFgDLQqBkWkD8SalVvrYa8vF0Rg5y8cH/uQk4xgjGDeRzLV02Ab5pMsNiByI?=
 =?us-ascii?Q?dpJAmBb/tkbiZClMffA17ZZMSw3Bl/WE2do/NO8hwx4mdSvmOF6nh1kJCHSn?=
 =?us-ascii?Q?AIyQ1UYfWLXbKRz2btqFOsUZOf9ImFq1NfapxfUGPguFfQ8U/SYwQ2L5IruV?=
 =?us-ascii?Q?Y71U8VkV2ypcGJG7m4Z/NfWCII8W2HX/qI5skzxDtHeVgCrq1XHqQ+rLUokd?=
 =?us-ascii?Q?q4c2Am9bBBLKYVlWRCc3osngPJfktCXgetOi8ckGy0F9APzbKdtIBlhMbsi6?=
 =?us-ascii?Q?DJ3IzOc9V8cdTVx0YYTeZA1c3luQ9ke5w1nSn1zytR/oIDMChrO61LxqkyA3?=
 =?us-ascii?Q?aEWt37w/znHvLGGlfWqCuaJ58DZKRyGXySnYIqd8thNkSGrAYE5kazBh8PhY?=
 =?us-ascii?Q?ShLIn1gAIyi1ZErHyLKHPf30+uwNgMeniIgcfw5p0FqUywLyO5jDkNUf1YlR?=
 =?us-ascii?Q?h/UkqNrrylyBUvdI4qLTmghit5ccbdLYpd0HV0NNpyJuPoTpNOJQ8kNUWVxJ?=
 =?us-ascii?Q?MffpeTQ99Zpj3heZqjlhb/1EFGq065VzvU2qJU4PQFBUOwzHwoRyOUncVYIL?=
 =?us-ascii?Q?YozoOFYXZ3FiScDKCQ+UOkDTv9vcLc5qLSTzR90gyQvCzHgS5BLvhG+VUh6V?=
 =?us-ascii?Q?Jgtri/F3qwKeIbbsOIbbjq7V6PW20qxJSlXHLZsVzO3b4VU6UuclVO0Uzoj5?=
 =?us-ascii?Q?GLUuIBMYrIkN68qLxBHRoYbvkn51X2KMyUyKP40N2iXzSasVwVYEgX0LoU+a?=
 =?us-ascii?Q?grgfusd28JXSirATWnhGWZGsxZevLB51gf7mTWpXdx7nqOA4A/PFBiW+l/rP?=
 =?us-ascii?Q?dJYFalL/ajSsyO4bjtt/CyQYtpAZoBXLw1IMlTR9OjsPUF0OZRuWuFctzRnU?=
 =?us-ascii?Q?tDwM709RzEuBOINbG04waxxO7q9zpIUnqtoxDVqJvZfh+PUfd4J9C7XUV1bZ?=
 =?us-ascii?Q?ucD6vqd8W8jwU0jw35Gx3q1cm36qSf7bHL3q/ALHjIlJNAyGTaSOSONZa46V?=
 =?us-ascii?Q?HG2v69sVoxSfw+BtKGdH6dXsZamF2lISOddoJ7EM6sLSCzwlOmO/I35AKBSq?=
 =?us-ascii?Q?9c8tTwohK1LYqVKdfY1Twm0W0pEPwaWoIDJD42PbLlA6RAxaBSu3uJ9IZGFs?=
 =?us-ascii?Q?8Hl5d4goPQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0962ce5a-f6fa-4765-65a9-08da3e3fb85b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 11:14:22.4768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MaQ3ljkEt4kPxTaWBg3VJUPINhlwpVAEzK3dr/58N0vnPW26yvPSuRx2XZk3/lYlu8H5L1q0Z0DFoa0xuNNBWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3089

On 25.05.2022 12:52, Andrew Cooper wrote:
> On 25/05/2022 09:13, Roger Pau Monne wrote:
>> Rename the flag to better note that it's not actually forcing any IPIs
>> to be issued if none is required, but merely avoiding the usage of TLB
>> flush assistance (which itself can avoid the sending of IPIs to remote
>> processors).
>>
>> No functional change expected.
>>
>> Requested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> ---
>> Changes since v2:
>>  - New in this version.
>=20
> :(=C2=A0 This needs reverting.
>=20
> It is specific to IPIs, because of our current choice of algorithm for
> freeing pagetables.
>=20
> "no assist" excludes ipi-helper hypercalls which invoke
> INVALIDATE_TLB_VECTOR.=C2=A0 Such hypercalls do exist and specifically wo=
uld
> be improvement that we ought to use.
>=20
> Furthermore, we do want to work around the limitation that created
> FLUSH_FORCE_IPI, because we absolutely do want to be able to use
> hypercalls/remote TLB flushing capabilities when available.
>=20
> I accept that FORCE_IPI perhaps isn't a perfect name, but it's a whole
> lot less bad than NO_ASSIST.

But FORCE_IPI has caused actual confusion while reviewing patch 2.
If NO_ASSIST doesn't suit you and FORCE_IPI is also wrong, can you
suggest a better name fitting both aspects?

Jan


