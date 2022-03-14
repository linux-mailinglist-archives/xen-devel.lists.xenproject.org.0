Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDE14D7C1D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 08:39:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290012.491846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTfIA-0006yN-V7; Mon, 14 Mar 2022 07:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290012.491846; Mon, 14 Mar 2022 07:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTfIA-0006wT-Rn; Mon, 14 Mar 2022 07:38:58 +0000
Received: by outflank-mailman (input) for mailman id 290012;
 Mon, 14 Mar 2022 07:38:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29fN=TZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nTfI8-0006wI-HA
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 07:38:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd599dac-a369-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 08:38:55 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-J9gMnWyhO3e8BQG_0tNmuw-1; Mon, 14 Mar 2022 08:38:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DU2PR04MB8584.eurprd04.prod.outlook.com (2603:10a6:10:2db::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Mon, 14 Mar
 2022 07:38:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 07:38:52 +0000
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
X-Inumbo-ID: cd599dac-a369-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647243535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fyARW3nTs4h55ajbPYaYn+ov08rkctESCSIL6uVmvI=;
	b=d4PmNDlh6XIDvtRjIoYUAEj2e8FZ7lrUFj7Gu/Mkk2AAUy7so+LBAjSom97N0SAqEG8TJ4
	WCRQ+RJGPLS/qDS687qEq3qQKyOCund05WwzuHjJ4gohPWGuGM34qxSPorFTu+k5YlZEO1
	3LuKAJJlvUIaBdZiUnMk4B9QbIMDkqw=
X-MC-Unique: J9gMnWyhO3e8BQG_0tNmuw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgWGGz4uAL6LhuUz1KXOGJeBwaK5xKcJIoTOe4BoVe2HSs/gWSoOzK4RSlJUAQaaiCxJ4u0o/Rlo2bqmiO5hebZaWS/37Vj4LkaR49JjL+nbVMzzGkeHs3tK9RX3vTHT05ce4JIzzQA3pRIzZrfcHfq1VKuBe4KDC8lojZRX1pukMIpHFhvJ16SdGz+Knq6zAAqMa7ao5cJWlytlRgwvHD3p4Q1pP3DKo15Tz0HSuYwmKdGI0xomFYMZcsIkDRZD7dTxlFSW31EqIiHmp1Bjl3nyD8iiIkecK6xMZ0/zwPeJ3xYUvFfRfgC2pw80dKcn0DWmipeVlATuwb2aN1681g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRRw4IP1eypNffha/k/89U6VzeJcJUQm5DJaJah8q6k=;
 b=NigqOF6f7LvGSs2BrTzaKfjEMmwDxwdS/bDzA9uUEDwbPRdQ5iqjoNvbDFXrxjq4YNaHf/fTJNJHKLOMjBPqXc4SmTP1PW6eBZBIKXq3hVtRsN73Nd5T8DIpMzgyoQiGMFLD2eMZlOOpIltYiVHPBskEcXDUV0aOJ21KPI+MysFlTbTV/UFPgSCLVSDfPXYnqzXvscuTv3PiyhnFvglMmaRDV/evZB3j+x6W1tFG6D3QnJIGYarLN4lOk6EIBM4Z806umqj3mXxHMjODmga35iKeQNpRjlPDpJ2WQLZHnrsTg9qmuQFasyTqgaU8Sfrt3R6kWRZAo/7m8gFolWwuxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bdd016c0-b02b-3128-7187-d781b6f88dea@suse.com>
Date: Mon, 14 Mar 2022 08:38:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] x86: avoid SORT_BY_INIT_PRIORITY with old GNU ld
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <97bebbfa-b5e8-4c57-162f-2a052de92f02@suse.com>
 <Yitd9RNJf1vvOsf4@Air-de-Roger>
 <517b0f83-ba5e-3aaf-9c06-9b7078b816ec@suse.com>
 <Yitlw1EN+egVJ4xD@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yitlw1EN+egVJ4xD@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0101CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a1d3eb1-0866-477b-4a16-08da058dafc0
X-MS-TrafficTypeDiagnostic: DU2PR04MB8584:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB85844A4AE97D90A7B3194FBAB30F9@DU2PR04MB8584.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C3a2Wg9r94BOQlQ/WLcpTR9D252XnJc+ommrSKwX4nefpePjg4C+wzvWn12ory3J0F8MJyUD1kiLXE3b2fwOuSHZuoaxQwFrQYGzr2boTQ9ZPu9tKXBvNDQ5GtBYRtLfPdhwbm9NylU2laJdSH2/bPQncNUPQiZSGrWx53XQnL0fdZjMA5+BXfkDIkq9iapllX2UasijLOFsg7Cu9OwnRgw78GPwHywZv3cbI4QGgc55kgsS2VPqaH/ZhF+su+1ffX/aHaRqJCNtZwvljQRpDjA/CRKWTGrqCIuETOiBJEAFcbsMZphvWD4JT68yZwF9DjW4ZXKGxxChfsnjesNuDsA0mhLUit0NrIfjdCE8NQ+OeKIUIogox3hXezIqoaINhENJtcGCRSMHXpg55Hkiq/y2GtKoaE0PwXegMoevcEzUqNEQa7RAz5pWqH9o09TJOfbIEBHv+r58MMQ7DJwVga7QuaPBNWzhNv5rBAqzQe4PcGz3Mz/bboFN+Y0bTb/41Yku71fD+rfmiapwYQpPbIC/gUFmNOJQ+s8zXkaRRlWDJTW7YrseGK50SEpRW82hcYp0zsYsmEDxtu1ST7Lp3PL9WdxgqSjuu1bRI4G/4cplEDXTDReRiGpcbYdH0uk8vOHYUFIoNqQA1ZCcqeyiFG3bPw3Uetm6NmfEKwIhpR0gyetbaGK1j0v/uMH04KKAbwX8SGqTL1MH01u5k2oRaLubiKxSfS/PgHBZfO5oUxg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(54906003)(316002)(36756003)(66946007)(508600001)(8936002)(6486002)(66476007)(5660300002)(2906002)(38100700002)(8676002)(4326008)(66556008)(31696002)(86362001)(26005)(2616005)(6512007)(6506007)(31686004)(83380400001)(186003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NzxO1r3NsEyGSg0KlLlWVr+RiXBdCDEX8MA37U8MwAvsJuPMND1n/lfC+h9+?=
 =?us-ascii?Q?nwhVnsl6X9q+cgMJKxk74GibhRULqgyF4+3V47chifiOPTdoQYfPp6aiPsFG?=
 =?us-ascii?Q?IeeJ9qfpbRtI3Y6AIULbMMUAV60zVp6n02AJZHCNF3P4Af7cYl1ZwanIxTyd?=
 =?us-ascii?Q?azkYa5OX8rucXGYqyuWc5i3u39DtzDZu7+V5/3pJl9FwTo0LPrvUeezB7cLD?=
 =?us-ascii?Q?rAU+KGl/IBnR7zfkfKsA8ygU+O/l25weWRKG+iU459h0q8+F9mSAgfU89YtC?=
 =?us-ascii?Q?H+/JWk1l5+dL3v4G9UlL4y4az/Sf5mYp+Mi2h3YJSG6AA3S3VPBTfnAcgFiA?=
 =?us-ascii?Q?1L2YgdH3QxOd2D9OWYXKezyCFKTxcDdsyCaI+L7rJnSjILpJ4GK+qK875NKH?=
 =?us-ascii?Q?HGP/yRyHGfH7sk8St4UX9KK8lHzTn7rzVU/vWK9mMIvBTrnqZHSj3hnxNXry?=
 =?us-ascii?Q?S8WkzThP9XqYGPtXYOZmI/L8SQbiCdxJVD8eIUwqUfszC97B2naid7aEkug3?=
 =?us-ascii?Q?16kx2LCpOLUsk/Lf/XbkgWKVEgMS7/M4bnMkAIZZ093RHBTGnT1MmkFrDDhj?=
 =?us-ascii?Q?c+9jL2jDIfMvTsHpQsx1Ag2or0hgg2mrzp7JatgHvj1HQqxU1f9rlEBK2/sZ?=
 =?us-ascii?Q?tbbdeopGbTXQH9lnumtXOK0xf4s/R6L+JvBVBa6Ld1hxVzdtJAARb2zI57ms?=
 =?us-ascii?Q?RKY2lU83mPWihKRim7EDQz5fgvPqkTZhtyL+LQuHx8mvZhTrRuL0u44x+dia?=
 =?us-ascii?Q?cLZBVOJe2rdjTcgyF1RTwk8FZlohh1uOLUCASj4ac+88VM1zQA2vPm8MBnRg?=
 =?us-ascii?Q?+d+FtrOv308wmpjZYGrSRvmnIXv3pm2BF2VvH+k29cTz6rvuehGnGyE3lExu?=
 =?us-ascii?Q?yFBGgwLwPfYFaccH94Diwwnhx8Wpo0dwOYt+VKCBNo1kK7vYVXvPQaMUW/HG?=
 =?us-ascii?Q?4T/kcd/XzEgCN/Z2tkTmqXMcH8ea2he1LtT84AtMabXJzU6y0ndCmch0IK1y?=
 =?us-ascii?Q?IOUDVyIZ5v3KLDJdDyfVEN25SlkVQXSn80LrfShu1HKLV1s/Jj1iSety5Czl?=
 =?us-ascii?Q?6xhM5YPhJ3eESHckDcq78WMu+i9mj9DMBl+zhWvuyT61XrOSYYN3+W2YR/6W?=
 =?us-ascii?Q?K7zk3qZhm9kZIPnk5UqYSuAAIAHEDIjlQcPdWL/PiK6BYumUQctLa0TYz7lM?=
 =?us-ascii?Q?cm1dzGFngDX3/jPIQI/GyP+8LAVpRLRDN7JOfuX76zm5/NyCL5WywwF2XvJn?=
 =?us-ascii?Q?TaS9CHqL4TRY/w2UA1vNqt8m5sLFp/T0uETcbbMsPbtWmtWIUGtRNLpMAbpp?=
 =?us-ascii?Q?C1RtaBiZereKeg4mTx9jsm0EawsMZ6wMpGXODmRAfs3qwBDYHw1mbRWsp5vp?=
 =?us-ascii?Q?rjq8pJZfKRRigtmiASvPfTMeKJxRCmDPBc/aSX7+OjdxUH9SmtP2AsvyCnvJ?=
 =?us-ascii?Q?WXi4iXOi+T5te/xUwcy3G0/iHuMas3fz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1d3eb1-0866-477b-4a16-08da058dafc0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 07:38:52.4738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: boR31ZHNpSBfSruHeQXHJY/TZKNZzbCjHd7jPXg81+w/D/6JiNG/b/6kXx6wmKnj/JyC6JHyCkttcnitM0hRLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8584

On 11.03.2022 16:07, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 11, 2022 at 03:55:57PM +0100, Jan Beulich wrote:
>> On 11.03.2022 15:34, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Mar 11, 2022 at 02:28:40PM +0100, Jan Beulich wrote:
>>>> Support for this construct was added in 2.22 only. Avoid the need to
>>>> introduce logic to probe for linker script capabilities by (ab)using t=
he
>>>> probe for a command line option having appeared at about the same time=
.
>>>>
>>>> Fixes: 4b7fd8153ddf ("x86: fold sections in final binaries")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> v2: Always define HAVE_LD_SORT_BY_INIT_PRIORITY when using LLVM ld.
>>>>
>>>> --- a/xen/arch/x86/arch.mk
>>>> +++ b/xen/arch/x86/arch.mk
>>>> @@ -73,6 +73,16 @@ ifeq ($(CONFIG_UBSAN),y)
>>>>  $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=3Dalignment)
>>>>  endif
>>>> =20
>>>> +ifeq ($(call success,$(LD) --version | head -n 1 | grep -q "GNU ld"),=
y)
>>>
>>> You are not going to like this, but I think this should live in
>>> xen/Kconfig together with CC_IS_{GCC,CLANG}, ie: LD_IS_GNU or similar.
>>>
>>> It's possible we will need this in the future in other places, so
>>> having it in Kconfig makes sense.
>>
>> Despite me not liking this (until, as said elsewhere, we've properly
>> settled on either approach) I did actually consider doing like you
>> suggest. But: I would have to introduce there more than I need here,
>> just for consistency's sake, and I wouldn't have a way to test the
>> LLD part of it (I did check - none of the distros where I chose to
>> install Clang offer the linker). I realize I could ask you to help
>> with the testing, but then the first point would remain. I'd prefer
>> if for this simple build fix it was okay to go the old fashioned
>> route ...
>=20
> I would be fine with you just introducing LD_IS_GNU. That's all we
> need so far. We can introduce LD_IS_LLVM if/when required. I prefer
> that asymmetry rather than doing the detection here.

Yet I'm not happy to go this route. I'm only willing to do this
consistently, but that in turn not without us having formally sat down
and discussed the overall model to use. The only short term alternative
I see is to go back to SORT() unilaterally, hoping that for now
different priorities won't be encountered.

Jan


