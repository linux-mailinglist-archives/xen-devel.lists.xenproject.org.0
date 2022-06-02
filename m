Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1519E53B673
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 11:59:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341016.566180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwhbW-0000lW-5t; Thu, 02 Jun 2022 09:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341016.566180; Thu, 02 Jun 2022 09:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwhbW-0000jO-3A; Thu, 02 Jun 2022 09:58:58 +0000
Received: by outflank-mailman (input) for mailman id 341016;
 Thu, 02 Jun 2022 09:58:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwhbU-0000jI-V5
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 09:58:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d58c1a1-e25a-11ec-837f-e5687231ffcc;
 Thu, 02 Jun 2022 11:58:55 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-1JbG6UkvMLiNqJE9MhjXOg-1; Thu, 02 Jun 2022 11:58:52 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2299.eurprd04.prod.outlook.com (2603:10a6:3:24::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 09:58:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 09:58:50 +0000
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
X-Inumbo-ID: 9d58c1a1-e25a-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654163935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NcMv9D5X8E0jFAIqXRfytNiygm3d2EUv5oRVxbQlCxE=;
	b=lKmP4foNQ9eKVTBq0l9PdIOqMEbtPnQylCyZBkzwIpiYgDH9r0UMqGctbiTFofdMoj8Sfa
	miOEXqbEd7WKk5+Toest8uq34wiXNwDH3IEAOi8+ubePN6/3d1OsWOO94AW1Vh9kNukiPN
	EqYjy/xgJoBOmGsRJE3wEeX6PvpE/9g=
X-MC-Unique: 1JbG6UkvMLiNqJE9MhjXOg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgB0OvlBwyQ+b+YviM6e1/AplbAoc42kcu0iT4tzrrO+rXymyc7L8Jp7XO/sy0NwPDOEjFJIcyEUQQfpQDZqcTgNG/0CI6MQDw4hWFlXmJtSD7Yf1RnGP/bJP9yuMhggIel8Lto7mR3I5E1HeseahARwLFVqvNGQMyek7C/Pk4fYOz7IDni79+kUF0ytX+/FAVmBAxEZKxon0zqdZKf8MgasBGu3PlPdKeEO5GOwh7H3siaYyutlIZBkmqXg0IHtYgJ4E0sYiairTctvxMBvSysxah9E0x46zMB6ou8BMn+QPSzEW6cIqEAtRzbyuhKe23GzWNn2qvK9PlVpjzBW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzbKjmGi1yxR+GbC/efFDx//kj10EeSkNuSqnIx3GWQ=;
 b=Il7t00scpAWDIAqzAr8M7a38Ob2PVxGDMAn34XUwg9XkzIylhz2VCEOKM3zvQKONLMXx49JTVfeESqOzcZ3HzR3D6uNM/3mQ2//AZKn1EYN/Fdo/B69k8u3lPh7G1cSVG4/fvV5c4jfMVKd6ciKH6R6yABzz0Lx/G+pnALkMOsgbblMwL4AhLYtwe/3ST/idbbTd7H3shSAn57UEX5MlZMX52YwIn6an2QfbAgy7LXloeVaoEh9YqVhH+No0WGDqcXL/S9Bi0phtcr2naHiCQ0fnNIWvAo98fIvgKJf1kDyx12w+XOC/+8Z0ZQUiBOfT8WxJNL5kU4bbJpjebONxEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <749f47ee-9258-c3a5-fab2-125c1bdda845@suse.com>
Date: Thu, 2 Jun 2022 11:58:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 12/15] VT-d: replace all-contiguous page tables by
 superpage mappings
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <b3126189-2fec-ec14-7129-7897cde980a8@suse.com>
 <YpiETolItQ7FvcsG@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YpiETolItQ7FvcsG@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3233de07-65c1-4183-ca10-08da447e7e18
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2299:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2299465C7948E9F73BB44DDEB3DE9@HE1PR0401MB2299.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JhE6fjPiBVd7HQY+c7jE1US/+jQtzZ8ioDyS5/yxCQD2T5yfRWfhHx9NuYGCETDtAjjiBFgXGwtIkgxotq+YyWxMWOprlytt+mK/k9bz3U5m3DtWOWmObtRWUFZTBuUZDThct3uYMOZPWG1AqQI5DWaeELaPUyigSDrqFejwusGDojyFQ282E7VCh1Ov8HZ1BawoN5u9yVhHG8a/DuHBvkgqedrOL8yphG6JWawCGvMF3tTEKqE8KRhN1K2Oq31797yIOFn2vVOgJRUin/PyuZyG5t+qVqPcT35LJYKcfJuXwV1Sgc66QRb9Yr+MyY6xJHfsN2EGmhpMfIJw67sMtPZJ2v6/OyvqUB4KmIp9oHCmXRCtyfTnt7bq1ie3FuUqHBlw/mk6l0N4zviViRX2j9IovwUoyX5bIcMLJsogS09ZhSRJEjLwF0Q2imDiFSZonfEAKdVe0jFSAtLpvX4QMN0yIxYTwasOffwtL+yI1FvHaPZinWdAyzXjcAknjG7UYDpOmtZWJsBWHiMZy3QZewv4L2ic++0vtvmOxe+YpKmtk7Ao8n8A/1iR7W52fX/G3ewj8nx0rUu6iG1oIQhtLmjEoJmaWrLjVwlloRdyRT/4eT8twoH2rIEBv8xT+Y/FnSC0y0Xj2tGM4JTIgxYjz7hT4x38lMv8nxKbUh0uj+/Soci+IGG9nPA08gZqx+5JGcUAt1HsgvdS8q/zMf90OmtqXGKUjs1IzgXCgFiIniYMyUC92uQyJvxc5Meq4RXg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(4326008)(66946007)(8676002)(66556008)(66476007)(2616005)(54906003)(8936002)(5660300002)(6512007)(6486002)(36756003)(508600001)(2906002)(53546011)(26005)(6506007)(6916009)(38100700002)(83380400001)(86362001)(31696002)(186003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VoRXEg8/a2xVvvMJaAfGdcO/dlHsnDAopFyOX+fuM692YdXd8fTTuLWHTK4l?=
 =?us-ascii?Q?2Ez1NLscsy6ugPmgsSyVvrp+Kp8vAn30daAyZERo6BQiVH5de/4Qd5/eXqIO?=
 =?us-ascii?Q?XnZIJsQVsECAI/S87uSJBf+n1czCZ3q/28sO1hPeSTpbDSxAAbJ6FO8slWKY?=
 =?us-ascii?Q?T6u9Qyghs+F8145m05SVmbZs+6sLhZDhNCWo5VUJQyJgP2Odbr1ph4ajRRUb?=
 =?us-ascii?Q?4WkDtQR1gh8cm5hO6/KAImdS0qI+b9A7leMMmaIkYrf+qSJd5Ybr457BClyl?=
 =?us-ascii?Q?lUoZkjTcxzWOyioNhqTX2UO+T9R/28bAboX8ktR/2InfU4T7Ng2i+8gO3yhp?=
 =?us-ascii?Q?SmSe2v+Ah2hgt6DMOIksfSH0LxXgnlnoTsVbQrRNqnhO4ZXYCb46bj2LjXex?=
 =?us-ascii?Q?OfUXwOqXXQ+zxVA98WsdYfC9PRBmKZW80LWpZ5tU+yYZIGMjSguFQUF4kDj7?=
 =?us-ascii?Q?/zHosGXhaPUsnf6RhJLJAos8dTjt013BK4xlbm31+fX6lOFouUU3NxiFgt26?=
 =?us-ascii?Q?XpMd35HUd9DUbgcKJYHpHuqReG4HlAtIvQRjCPx4+oQG28fTcf6zWv1qI+xA?=
 =?us-ascii?Q?DduyVVdCHDnty774vU56v2fv1GDbSPxx3TNukHeaFUTb6EsAPBW7oXvqD9HI?=
 =?us-ascii?Q?jrx+2IjSxX+edyNg4Gc37EzVRmgTsSBWMgZJKawRPgwOKT/kRr0rTsz9sS5N?=
 =?us-ascii?Q?WrFak/cuO5PTErPg9Y0Nqw0zLekruX+26ZoSHftL4jq5qntA/RksMYsZkzNt?=
 =?us-ascii?Q?oGkkM5auJfIspYpJd1af0RcF5PJN0iDFRdRXnUTxtU7K6SS3u0WwEm02lkKG?=
 =?us-ascii?Q?A5YiosaHod14VP/VyqzqFrqpEbDiyMCAHFOJ9w0Oc0e7bzSRbRjC4mJxbKqU?=
 =?us-ascii?Q?Mz1tP40xH4iT8zQmUXNgejika/5a49wF6xSxIV/Peu4h5/3xz/3oTYSJmaHV?=
 =?us-ascii?Q?UZV6OBSPC8IlrygXrGSrsugi4cA+um2IDbiMNgrmzDutrsrYe2829aDyAaAp?=
 =?us-ascii?Q?AMrAB5sZ9ueEqgbZBjUc9P7+NtEoGwh5LM3yO8N/+mI2TdfjB0eJkte6Rti9?=
 =?us-ascii?Q?/9DTfBkLhJFV3WM+HLEXVWVZVmdi7JdDYriUmfE5Ehu9/cgN0CqELOK+a4wq?=
 =?us-ascii?Q?8N8ZNjD1ZBIR8RNNxKKrUjmEHO58Ld3ZK1p8W5d7PYlcm94sIKdIomBjnmA4?=
 =?us-ascii?Q?czbTuGVyAT++0T4r1pY+slI6huMfWrIURp86mNKTv7T7Y88SSQSgChwAGrLY?=
 =?us-ascii?Q?MSTkMVKOqEqZcWHSuq8lAF1XcuUESKr5Ddn2evkMHJWa8mzYjZYJBbernY7u?=
 =?us-ascii?Q?TZ1RFp8Ly1ufIjqQZrXb+nlYhgWOHG5gDENEVO1TA81kKeTElH6KIUHX3um7?=
 =?us-ascii?Q?6KWMH08qHF3vf5gEZqpYoHi4ErQxhTV+YIbQHpF5f6uU3ddRRMed4fUbNYFe?=
 =?us-ascii?Q?8qrNQiXHbicIvCiKuG2MxwN/VaHoIV22iu2Tcn8Id9H80wpNyuBS0cBUoTrc?=
 =?us-ascii?Q?wWfZFHjqxb/0hdD7sySXl/Ic+a/StCls7bNIHNCt3p/1YThafCCVoyyCMJHH?=
 =?us-ascii?Q?nip5smQ16Tx4/MrnURJA0fwpqUZRbVbiMwXejCv9V2FFOIYA6lLM5a2CVY32?=
 =?us-ascii?Q?jX0dMxm0q7hytFqrNUCIVOoXwhB79LbRwghD4tKSlnXzsazW5ZBLhC6YD3ge?=
 =?us-ascii?Q?uu/YpuUIMf+SQMUTwobNXneeRq/RHBA7P51Wwr87OkiLD8Z8Idabt7BzXAlX?=
 =?us-ascii?Q?OzTl7zV71g=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3233de07-65c1-4183-ca10-08da447e7e18
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 09:58:49.9405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NO749DJkAtEgfpnz9J/uHCzKVCsVJH+87MeGNix71O+dLQ55nmLqohgy1L5Cpc0vyIf7l+cr0yzgBHWaGuA1jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2299

On 02.06.2022 11:35, Roger Pau Monn=C3=A9 wrote:
> On Fri, May 27, 2022 at 01:19:55PM +0200, Jan Beulich wrote:
>> When a page table ends up with all contiguous entries (including all
>> identical attributes), it can be replaced by a superpage entry at the
>> next higher level. The page table itself can then be scheduled for
>> freeing.
>>
>> The adjustment to LEVEL_MASK is merely to avoid leaving a latent trap
>> for whenever we (and obviously hardware) start supporting 512G mappings.
>>
>> Note that cache sync-ing is likely more strict than necessary. This is
>> both to be on the safe side as well as to maintain the pattern of all
>> updates of (potentially) live tables being accompanied by a flush (if so
>> needed).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> ---
>> Unlike the freeing of all-empty page tables, this causes quite a bit of
>> back and forth for PV domains, due to their mapping/unmapping of pages
>> when they get converted to/from being page tables. It may therefore be
>> worth considering to delay re-coalescing a little, to avoid doing so
>> when the superpage would otherwise get split again pretty soon. But I
>> think this would better be the subject of a separate change anyway.
>>
>> Of course this could also be helped by more "aware" kernel side
>> behavior: They could avoid immediately mapping freed page tables
>> writable again, in anticipation of re-using that same page for another
>> page table elsewhere.
>=20
> Could we provide an option to select whether to use super-pages for
> IOMMU, so that PV domains could keep the previous behavior?

Hmm, I did (a while ago) consider adding a command line option, largely
to have something in case of problems, but here you're asking about a
per-domain setting. Possible, sure, but I have to admit I'm always
somewhat hesitant when it comes to changes requiring to touch the tool
stack in non-trivial ways (required besides a separate Dom0 control).

It's also not clear what granularity we'd want to allow control at:
Just yes/no, or also an upper bound on the page sizes permitted, or
even a map of (dis)allowed page sizes?

Finally, what would the behavior be for HVM guests using shared page
tables? Should the IOMMU option there also suppress CPU-side large
pages? Or should the IOMMU option, when not fulfillable with shared
page tables, lead to use of separate page tables (and an error if
shared page tables were explicitly requested)?

Jan


