Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F053ACE39
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 17:03:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144736.266360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luG1p-0002bp-5A; Fri, 18 Jun 2021 15:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144736.266360; Fri, 18 Jun 2021 15:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luG1p-0002a0-26; Fri, 18 Jun 2021 15:03:29 +0000
Received: by outflank-mailman (input) for mailman id 144736;
 Fri, 18 Jun 2021 15:03:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luG1o-0002Zu-88
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 15:03:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 976ad0c7-b0f1-48d9-bb1e-321d2a0c2703;
 Fri, 18 Jun 2021 15:03:27 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-_R-csKBsPyaZAbgF_S_9Bw-1; Fri, 18 Jun 2021 17:03:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 15:03:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 15:03:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P251CA0001.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Fri, 18 Jun 2021 15:03:21 +0000
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
X-Inumbo-ID: 976ad0c7-b0f1-48d9-bb1e-321d2a0c2703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624028606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WlrD8dNUb08dzEJ6lrqje5BHcZk1cIHtEk9GCYAygTE=;
	b=hPWEggYI5cUo7ySfhvOsxbqLHPxTzlJP95fKARF+ciBE/9WH7dO1lR7hWgio74dY6aNPnP
	rLwvmiaHJZ6RibO08RQb6eZ+Jnqt1HBstJ4MyWuFvPVAJglwLkoB3rYqFwTViHuVUHMyKG
	ohVvqUF1qoUk2siwLIt2hv66817IxfQ=
X-MC-Unique: _R-csKBsPyaZAbgF_S_9Bw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9mOQJUg3ocQM+sAjVKp/qegsHqeJN5qE1S2vwTc1xvUOkuO2BFub40z2/FIuGHnq/NtNkA9VUlIoDG3Dp3F+SVimTdDdrOikti0LirBqFCsuqAEcRF7TBAj8GojbEZDisHozgpaLPUDj//ziLk0xLck/z2oFpmQygeunltXi01fpXK5g9RynrMLmSpTem3HoLVAiFEnloNwmd+ru/sNRAsHQPrtIibGdcw7OlLlvlq3J0heDZIVJ0vttdwGJzhzhhD06TJMIgpBG3DalLcIY4vLdu6rUD+FsNoK0wshBQ2kND6aV+q38K95GVFCmfOlU8xHDMiCRkdAGdzV5cNmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7IOHcl77rAeJmr6WxTqcnqQq6MeFHQjnF0+tn/5Y2w=;
 b=EmStTkIWqP3bmowKFnDs5/M+7sufxl7VPtLM51mYOaWW0/xQhIAgwA0cxl8J/+53GiTUiFQsp3hTSVab1pFdCGnl2VWrFifqMlgL252ABNmYO6H6zPImj2/BycYF7CWaqXceZyfkUteHP51m/fzm6Xo1RGIO0Bg7EHh4m02sBB+Bsp4cZxlC9GbFJaWku0kopWjof0lh9Z77irTq9NwfKdLsPL3YqOK0jBx+zSPQ3uKTiWpw3PuLWKgP1U79qgU4Wz43Nfr3yUm9E43y3yUGp4LyS+PrGNBCVeWgwuvgYzM6hYU1uFloefYG3oLnP30OyYDSSl6yuJRADTrrMHj3QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/5] libxencall: introduce variant of xencall2() returning
 long
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
 <c7f93b66-bc4d-708a-6936-e0eac9e36cfa@suse.com>
 <0804f068-c016-0099-cebb-dbb8b7f1b794@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <82885eae-ea6f-e463-a966-78a0c753d93e@suse.com>
Date: Fri, 18 Jun 2021 17:03:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0804f068-c016-0099-cebb-dbb8b7f1b794@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P251CA0001.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e450a6a8-99bb-4e56-4ba9-08d9326a3708
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6864D8D6B56B8331EEE278A3B30D9@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h6bHXOy61w2TOkrrqEE/9rLM4KvuLLz82xlxDk1T5R8xORRgUZkIKrySQDA5V7kejAxDAGbcsyPROMuMcNmQK83TaNB3zbcRQp6kg4x9ZY3ZGxY1clBIbLB/ERvssYqiMjM/XS1IVjrnUelqz83rfYOwbsA/4fwtTU9P3oqvh1mLvEspMEL2wo+NeihnHFaqvc7iY1KFrkVArkKmamcWEAPvep1vwaFC/2iSzZABgUQGRhCckclaCXXGXhpc0ioJnKRh9hIoZnMWB7cPQWsmOgML5ndCqq97nM4I7GBT5dieSiTTnOHRWabVXXTOc+qc7OpglfBmtUiALP8G2VuN8nlC8r4u6fwdOkIQKI3KRHu4spMl+jBw5Aonbh2TIk9FE/F3PBt4MX6J7DyDnAzLix3zNkFtqhg62/ZlQeQvWWFvwaCJVp7uTpq7QULFfZdSw86y/xOKSuZ78QQWO6eRc29VA3x/578B1Bgu4LvAqxVyOtg1qJE3sTNgy9luFdyvuHiGgpmYaoERM3/H9SySGqIMsAxsLDwNIrk+Er0ak6e25HPONnNURDlK4gbe7VE18/+4xtdaXEVfqMw+qRwpG94UwYL79TOFWUkgegq40kIzHTF2qdB3K4hw/+zoxnODBU2mjd3I5Tb8L2cJH/VelOjiNj2JhmTq3WroMleLIKTS8U4vdcDsfsXI9w83+D6F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(376002)(39850400004)(396003)(136003)(2616005)(956004)(83380400001)(186003)(66946007)(66556008)(6486002)(66476007)(26005)(316002)(6916009)(478600001)(31686004)(16526019)(16576012)(54906003)(38100700002)(2906002)(8936002)(8676002)(4326008)(5660300002)(86362001)(31696002)(53546011)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CuaGgU804Rjfna0MVPMVEf50XEa8orJMd5MSatZJjJPWj4pxBtptNJ5kakcd?=
 =?us-ascii?Q?wTaaHqT0ylyCQsLdMjZTMomDQ509WKdTd1Eh9rT4Wb1CgcQnXBf4kGzJav3H?=
 =?us-ascii?Q?Q0yZ0EBKxwTkuNw32xlehwyQJy8oQJCBdi5BTDGBIUXmyG+/PJkoB4pMRC5n?=
 =?us-ascii?Q?GiLw6dmz79pu0A0EBLGAWHSwAk6pKvaVqCGRB4w1upgre3S1VDrjc8bMWlkZ?=
 =?us-ascii?Q?hcr+ow+uQR5P7aQCUQhrxhyUhE2/UJl4FhhFdEQPIOqHm5UXe1/8me6j7fE1?=
 =?us-ascii?Q?JQnrxCnU1gF4NTYTTDR2y5oQ8um9BHuaJny/2/aJTt01AS1hiIMGeM/wROMy?=
 =?us-ascii?Q?4ZEpfP/xMUJqTP5XlgoFpJVxvbOsVSmTziSzbf8CS9DL8m/5YeiKgq8Mrc18?=
 =?us-ascii?Q?AW51cZwhEWlqdnWSBjPPmGtxaDQzY0f8Lif40zBMRPNAc89wcBihYWw27laa?=
 =?us-ascii?Q?sNKnCJAbS7015sok8zbahjvHnJ95VxhvvnMdunzdpbXmEQFGOU8rexNyF3oN?=
 =?us-ascii?Q?SywNlD2XRHeK6y4K9yDITAREi3ky2m2BxzZLSC63GV9WWmRflfxNxYXhE242?=
 =?us-ascii?Q?tH8NYxY0zgrcYIu38Gkk5u71DsOclmZwXOR8cjWjRUhIjGsrssUJdr+ZYrJx?=
 =?us-ascii?Q?A36IlRquQuBlr1acdYFTEbtDjkQ/WodYgl178MmvQPSiDLhrJhOoMlHaZGIi?=
 =?us-ascii?Q?AIZrdzdclyvN9mITD4HCLYe89C4aaFFc6iGPx27ALb3cpH8g4jx3TKUvs3Ii?=
 =?us-ascii?Q?DJoK1X70u4FjtTorHw++XZkBeXtFzDrsPwGh//yepw+Ys0fqPjHVUJrUU4CN?=
 =?us-ascii?Q?fo/0UXYFUeKs230sUCYQ/dtLiDFp2RMtsorLxA52SwjIqhLeoOC0U20h13O0?=
 =?us-ascii?Q?53UENfxDfg0iJbS3cTnyOKhWK4M99sXwuPW1fc80RJyYpeIm7iDkyZDDa5lM?=
 =?us-ascii?Q?yUW/jIJkAKwXl/VWPCqk3XT0nhbW6qnCvgKhUvGCbJXi4iSvaZfcJ4WvxsaP?=
 =?us-ascii?Q?yKqnuAuMlNNsZj1dJAb2d9tl6naJFTmyi83N1aLYrALCg66DsuAN3hX18pjp?=
 =?us-ascii?Q?6cpojQ538RUsNP9x7OvZbi8/Mc+0Y0Q5P27APnjPhdUqRXQWMvTXd8Mp3e7X?=
 =?us-ascii?Q?wvfmVI76YlQqQnnZb9vEB0BOoOPRk+GDeIK/6MtcIpskAAyPuuQCfh4eZevF?=
 =?us-ascii?Q?xcdGp90X4iIPza5b9X2WLz6grPc7gUKK4g4d/+8c4W1p3JUHV2kO+dVMIbxD?=
 =?us-ascii?Q?9raCaNiHc/geCBToaA8ZVFot5Dp+x2HLwwwiz2sUgsm9U6bSWoEt+SrbmngL?=
 =?us-ascii?Q?mWG7CoHDRrMoTpTgMGPkqkpJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e450a6a8-99bb-4e56-4ba9-08d9326a3708
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 15:03:22.1598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9aiYPFxFsyWvUZTIOamKmBWv4O07FKqX1R1LqkPFHzOICVg5ySpAhzpK5MJzU1djLirlYurpKX3GajgELWXAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

On 18.06.2021 15:46, Andrew Cooper wrote:
> On 18/06/2021 11:24, Jan Beulich wrote:
>> Some hypercalls, memory-op in particular, can return values requiring
>> more than 31 bits to represent. Hence the underlying layers need to make
>> sure they won't truncate such values.
>>
>> While adding the new function to the map file, I noticed the stray
>> xencall6 there. I'm taking the liberty to remove it at this occasion. If
>> such a function would ever appear, it shouldn't lane in version 1.0.
>=20
> s/lane/land/ ?

Yeah, spotted this already.

> I'm tempted to suggest spitting this out into a separate change anyway.=
=C2=A0
> I'm not sure of the implications on the ABI.

There are none, as a non-existing symbol can't possibly appear in a
DSO's symbol table. But well, yes, I can certainly make this a
separate change; it merely seemed excessive to me because of the
no-op effect the change has at this point in time.

> ABI-dumper appears not to have picked anything up, nor has readelf on
> the object itself, so we're probably ok ABI wise.
>=20
> That said, I would really have expected a compile/link error for a bad
> symbol in a map file.

So would I, but reality tells us otherwise.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I wasn't sure whether euqivalents for the other xencall<N>() should also
>> be introduced, and hence went for the minimal solution first. Otoh there
>> is also xencall0() which has no users ...
>>
>> --- a/tools/include/xencall.h
>> +++ b/tools/include/xencall.h
>> @@ -113,6 +113,10 @@ int xencall5(xencall_handle *xcall, unsi
>>               uint64_t arg1, uint64_t arg2, uint64_t arg3,
>>               uint64_t arg4, uint64_t arg5);
>> =20
>> +/* Variant(s) of the above, as needed, returning "long" instead of "int=
". */
>> +long xencall2L(xencall_handle *xcall, unsigned int op,
>=20
> If we're fixing ABIs, can we see about not truncate op on the way up?

You mean making it unsigned long, when I don't see us ever
gathering enough hypercalls. Even if it were flags to add in, they
would surely fit in the low 32 bits. I'm afraid there's too much
code out there assuming the hypercall numbers can be passed in the
low half of a 64-bit register.

But of course, if you insist ...

>> --- a/tools/libs/call/core.c
>> +++ b/tools/libs/call/core.c
>> @@ -127,6 +127,17 @@ int xencall2(xencall_handle *xcall, unsi
>>      return osdep_hypercall(xcall, &call);
>>  }
>> =20
>> +long xencall2L(xencall_handle *xcall, unsigned int op,
>> +               uint64_t arg1, uint64_t arg2)
>> +{
>> +    privcmd_hypercall_t call =3D {
>> +        .op =3D op,
>> +        .arg =3D { arg1, arg2 },
>> +    };
>> +
>> +    return osdep_hypercall(xcall, &call);
>=20
> (If we're not changing op), I take it there are no alias tricks we can
> play to reuse the same implementation?

Re-use would only be possible if we knew that all psABI-s match up
wrt the treatment of a "long" value becoming the return value of
a function returning "int". An ABI might require sign-extension to
register width (leaving aside yet more exotic options). Then, yes,
the "int" returning one(s) could become alias(es) of the "long"
returning ones.

Jan


