Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7918F4D6429
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 15:56:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289109.490479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSggd-00075X-UP; Fri, 11 Mar 2022 14:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289109.490479; Fri, 11 Mar 2022 14:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSggd-00072U-Pu; Fri, 11 Mar 2022 14:56:11 +0000
Received: by outflank-mailman (input) for mailman id 289109;
 Fri, 11 Mar 2022 14:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSggc-00071s-F4
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 14:56:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eae14f7-a14b-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 15:56:02 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-YgYIV9R6Pe2qYMSx1kDlwA-1; Fri, 11 Mar 2022 15:56:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4126.eurprd04.prod.outlook.com (2603:10a6:803:47::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 14:55:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 14:55:59 +0000
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
X-Inumbo-ID: 5eae14f7-a14b-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647010562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ykyRe5f2Qq0vrqDC/csptHNV7cXQPzFWgenxhlPLXI0=;
	b=K0TWVUEKCbMV88+pLtL5AElmfeeizeyx30ToZP4i8uFz+RmrBS85440PjvEhcHWJQB9Q4N
	Oxu4ShVeKjK+JGxbrxb1Kf8diQ8PPevdqVL/BaJGILP/8puMgBzrbejY5AiHl/9n3mLa4a
	TBjZovFMtn59zj8Az06hMvpZX3IJ1gM=
X-MC-Unique: YgYIV9R6Pe2qYMSx1kDlwA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CB1Bci/tReIG3N1gOnxtvXQmLKqEKAVpriDOAzAF0IAquQpayAR9SI2SOPbApB/bVUbsVbR127bsTc5YW8MsvgciyrCC/1jJOc5BJQcFXUGhNhvVEPrtKnu/6Dj6uuQgW3QKy4IPDHhOP41J7ch0UsCc114HQCpve2OS6GvUGegFzWpYRF5duaH5uSIcR2xnYpS7PSH+OzGq99UFpTC8M6STcoYgKBwqmN3+6XwPHw/PGMjP5Vpzjn8bkQGQx1dz95V4h1HUd8GA6ohBP3VGCI9NhCqB0p+ixnNYPA8Kw9jRCuo+eTAAw3QwVQjmYw1S34Yb+dwa3ZYrG/g12Cb/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FM3xGw8zm03xEVgPT9CjAZ8cHLezv+jMMRWO3OocsiA=;
 b=H/mf3XVgLk5V2IK8xVWtE6l1szfxGM7mvL9rleR1jMZFMmKnNrPQC7F9KK0TmcnXrGWfv5M8ZI0h2cFxhaJ44AhfknEq4oFD8gDqAgF+Gs3Xn+p0K4Dd6gTCwWpnf01WsZfcIy7nDTJgHOxSJ7wRS5TCuXnH1eGCQTqIArsHebTkYwkebn5gGkOv8VBUwMb8++Ilca3M0k13CbkzeWNsHLwLBnw97lQCszsw7xMePQEHHuRxebwgtvhkA3F2B+b802A9rf8T9IJkZ1vNYdb6u60XEd53WPi0HstuVeKWZnmX1bcdJ1WHRR5S3WHlD7H44lLiTyoIkxS8I83R5QjgSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <517b0f83-ba5e-3aaf-9c06-9b7078b816ec@suse.com>
Date: Fri, 11 Mar 2022 15:55:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] x86: avoid SORT_BY_INIT_PRIORITY with old GNU ld
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <97bebbfa-b5e8-4c57-162f-2a052de92f02@suse.com>
 <Yitd9RNJf1vvOsf4@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yitd9RNJf1vvOsf4@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0502CA0042.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbbdf2a1-9a16-4d41-5d58-08da036f40fa
X-MS-TrafficTypeDiagnostic: VI1PR04MB4126:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4126655F6F3B7AAAB6222E22B30C9@VI1PR04MB4126.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DTNEZxPcPJVVQc5xE/Spz+weyC++8d2bgaL6f71vtwDQ1/ietKU4tJgx7ujJ2HFqt7QTe4JWZPhknUo/2FVF9bEPZDSPej7yOkIBPSXjpT/x3TEYYPNPH8iafnM7jlK12it48YiFZI391JLS8UAan1XLOwckkHwMK4v/FBJPeWhrb6H/aCHbahcav/m1sOGpsrygdYraarCJHBLHz1Fg4gIKyjHOFRtxWwNk6yFxW1aU+ReHPJ21jCft842VYmicOLqRleeZjTx72f5N7xzjFhTH8qV7QajMyGYFyqzDKlHgaOHUYDP7SYqe3/jeKuxWF/ACrLhD4b7oWLLKso+DjR3uwPUKbDnPFocUaTSbBnkXNx+7QcYDO2OFTLp+fpBAiTBgaESTED/KlXJgGFriplYcIkg4aJIAFFBLIuTvuOQF7XqJsVzAbfE39+LpUZ9tu83mSV9QdVxLvdNaMQiDb20gIS1nLbFetESkvvTyhI4JgQ9ABRQjJ1kR1p+LbCSfdSdNH4ErTSUUTCGMdOMCeSnxxyIPzaWAKDUI+elCAbgDz0oVp+K3jnhFbHxI8e17YGTShXwYAqsS5wtb/lxHvyXfA8R3GiXGgM6NqIjRO9v3BWp+ujhMMzCeHg6t8xG1x4ON5zNo4pq03njFnpd6DGLlfJmjebmRxo/LDjzW2fBdbSWRo0WPJh3mk4hk872iOwYnuZrX4Ikl47Mt1YqsyjXn2KRL6MpAhKHZenCP3WM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(66946007)(6486002)(66556008)(66476007)(86362001)(4326008)(8676002)(54906003)(6916009)(316002)(31696002)(26005)(186003)(6512007)(6506007)(38100700002)(53546011)(2616005)(31686004)(2906002)(36756003)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9VVLwbo1+89QcYgSdtUrviop2XljPi9fcr3uFoYBEv7Cot8aQesGPexE3kn3?=
 =?us-ascii?Q?HT8Yzf66gnsukErU7ko4UHwdRolW2RKJ1DmOHToDVExQOfu0DgLybQpvorhP?=
 =?us-ascii?Q?jleNQRWWdR/iTzVTeYEmSxkyOmwHvoD6C/UYQgWp+RVt6dYjlFF36vRikjXu?=
 =?us-ascii?Q?rsPhUos26eR3bFzPTTY19xZRixzUv5DtQU6aFe512D8jw9HOPgn26LBpaOut?=
 =?us-ascii?Q?hHQdG3lKCVpKmvckdSxXXfF+oj6QlmqtIxM1SuJfgj2bq9KqgtuEZ2Ywz5JQ?=
 =?us-ascii?Q?AjXIjTwznLEfvcsTnepQ/r7ow8FOiYa6jWvxwyUjJaNr27YFAIe6M5+PJFjf?=
 =?us-ascii?Q?Qp5FbmcLeMYp2hrrAq9JyW7vGkgAoNW2cndfDNegq+O3Laro34cKL/WL7wwQ?=
 =?us-ascii?Q?D2tkgbktMB7BLidqxKkKQkrHX9EBsafRFv17qx/WYRlqzqNzJB5i2eIHiTit?=
 =?us-ascii?Q?3XcGm6RrlHAEOedqJq0iF8iedz3OzhaxJ1oakx7FzDCMiifQDbx20L6wT6DH?=
 =?us-ascii?Q?mE5HdbvAeqbWtAckzH1Jipfg8/9owqdRkD4bof49sVGZpmJcNkg4iJfglX9Z?=
 =?us-ascii?Q?1DwzVt8+fZ4OwNPLoVtIzu8WHSEBXxlccbsNnOg+hQWhBqpM5DUZjEZlEhko?=
 =?us-ascii?Q?4ReTII/Q+0K8MLYI3FBIio3FXVRivko55lal2TmfPWHlDEXHKem/dtajgNnn?=
 =?us-ascii?Q?WWMxYt05XHzaZibmnEc5B+f4c5ci+sLE0gPCktwstLq23Gv1q6FYy9ATnE9k?=
 =?us-ascii?Q?h/lL+7qT55aYeSvUbAXgAxKLEc5tAH+PttQvwe/wE3PP0t4iUJ0X0cyo4LQT?=
 =?us-ascii?Q?hMn+jw1JbuM8TKVMo4dXNVsibqqqWTxLqChmIzayAYkkTMIag4R0kCZ/hX5v?=
 =?us-ascii?Q?11sLZsn7Zn1IycqZZZkYG5qdF4xQ334iSks4xQp6x4RoavI6KTzeWIYN9v4j?=
 =?us-ascii?Q?a8VX8IhU5kGRqwOCkxx5g/bAiTf4uq9nXg8j22xfFFBQbc6BLuHEUhnHUukD?=
 =?us-ascii?Q?DpO2Dnh2CuNjMWK2HJyRcF92RGe6vNqj3GmC8eunQwvwgRM2/FXkBFjwwrc3?=
 =?us-ascii?Q?iL8QbJ3zx3vkqmQELaRDqU3Efyqqrxk7mkJAK/MEPjPXczL9se0LWPeOM9U8?=
 =?us-ascii?Q?rIoiNd2bsl4eS8hwrWS1zlPY8oUcc1tlq8UXSqXUVvQU6+ATOe0REhVZRQXk?=
 =?us-ascii?Q?Ll6w/l+vTw/3+o/gdICQbE0FoGPR51/xM2wFZRoYrDNuPWR1qQ4EkbvdMreW?=
 =?us-ascii?Q?kF50kKfFU4ediTfalveMCayqQPKbGAHlb2Z5rwkkNYxX8i0QW1zWGxqlQzKZ?=
 =?us-ascii?Q?OwLcSbRQUTk6Z/dkfgwIulsvyIz53byJrOGzDxpAGqDwnEGVvaQlwMVY/gFJ?=
 =?us-ascii?Q?vWFWwoT5l1LGkKtS5BOAUAUGtkuVa8oUC7iH71PzDruAZGlj92dA1+6vAewF?=
 =?us-ascii?Q?y2Bo1WyKRrC1AXFReJYM7F4axrb4g95A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbdf2a1-9a16-4d41-5d58-08da036f40fa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 14:55:59.6655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xpE6gQ/SwrUzAF92mXyAwBRTdXHdPh+6fQY3e0npttX/c/e1KVyQ6qzWmBF3MVavoUx7dgbebemFtZVOmpypg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4126

On 11.03.2022 15:34, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 11, 2022 at 02:28:40PM +0100, Jan Beulich wrote:
>> Support for this construct was added in 2.22 only. Avoid the need to
>> introduce logic to probe for linker script capabilities by (ab)using the
>> probe for a command line option having appeared at about the same time.
>>
>> Fixes: 4b7fd8153ddf ("x86: fold sections in final binaries")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Always define HAVE_LD_SORT_BY_INIT_PRIORITY when using LLVM ld.
>>
>> --- a/xen/arch/x86/arch.mk
>> +++ b/xen/arch/x86/arch.mk
>> @@ -73,6 +73,16 @@ ifeq ($(CONFIG_UBSAN),y)
>>  $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=3Dalignment)
>>  endif
>> =20
>> +ifeq ($(call success,$(LD) --version | head -n 1 | grep -q "GNU ld"),y)
>=20
> You are not going to like this, but I think this should live in
> xen/Kconfig together with CC_IS_{GCC,CLANG}, ie: LD_IS_GNU or similar.
>=20
> It's possible we will need this in the future in other places, so
> having it in Kconfig makes sense.

Despite me not liking this (until, as said elsewhere, we've properly
settled on either approach) I did actually consider doing like you
suggest. But: I would have to introduce there more than I need here,
just for consistency's sake, and I wouldn't have a way to test the
LLD part of it (I did check - none of the distros where I chose to
install Clang offer the linker). I realize I could ask you to help
with the testing, but then the first point would remain. I'd prefer
if for this simple build fix it was okay to go the old fashioned
route ...

Jan


