Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E1144E618
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 13:07:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225187.388890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlVLI-0004RO-Ao; Fri, 12 Nov 2021 12:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225187.388890; Fri, 12 Nov 2021 12:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlVLI-0004Oe-7g; Fri, 12 Nov 2021 12:07:40 +0000
Received: by outflank-mailman (input) for mailman id 225187;
 Fri, 12 Nov 2021 12:07:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlVLG-0004OY-GI
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 12:07:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20242f86-43b1-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 13:07:37 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-xUAiIvqiMLmp02gbZipLsQ-1; Fri, 12 Nov 2021 13:07:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5470.eurprd04.prod.outlook.com (2603:10a6:803:d6::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 12:07:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 12:07:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0053.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.16 via Frontend Transport; Fri, 12 Nov 2021 12:07:34 +0000
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
X-Inumbo-ID: 20242f86-43b1-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636718856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NrgMWxmHbg2r5iYGgbBuNgdU1Cg2JT2699IMoQ+Sqvo=;
	b=IVEtxb4YSG3k3z+MBhEgLz8kB7n3/eBzQO61wx9Dplcj2uJ7G1FF6a4Zpy2p8LDr7LJzRE
	dJXddtWwC37dDE96EdU2cTSWPX2pNaZnXFfwzYdTK03kz64G++cdiv9AK/yxr8EdUcSREO
	U5b+HHsTjts9fBBDqoOEviHaeTPiTH4=
X-MC-Unique: xUAiIvqiMLmp02gbZipLsQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeJKP9gdqUYbmMCxSLSPJxec1XQRz3AxiM3r9eG8Zx8YFuselYKoqZ6aqwGfwOiUGVXH9CJ3lbWByfYUZvgkvZMjkL1lkoe+3IW2jv7KLukVZCehLXgO4LmV1wo1VBt6YJRjd1xIEyvkGDGsDw3PDu+eZQGm3DO4GXs9/BZLz9g6MDVrDUF92ZHMjlditJa0S4intzUnLo+XJk8XVuYKAuqK4GBPIX96Mkkyk3eRK8mLOJXeRKn37OcoFCAAJE67tNL0kVQT1FOLKoPub/j8sfPQFgOa9M7pSA/TDsc7QEcYdgZGh90mYzVDvgvCaIqmUuXOwcNckn8Q4x3+RjrRIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhETlBSLyVyFNaIXyy2Nb08GiUL5eHqgjOwrWDhmVxw=;
 b=BVtdhX7bIcwvtR2Cl4Ua1VbFdBCcr11VbG60t6sY4cp73cFh7jzEN14vVZcke6DreWmDf3y6ZFoULIVuDkD+8DPKgzXx1G62ZUppJs77HCU8GRPvxfuiU+exkyYfl8+dwd1ZuL5xgQWt+4aHMJWuE5Lb1iPecpIHPp0KOYnJJJdjp/jC8s5AmOkZth3pvPz+rTHrF14WtHA1SgKV79g7KF15UfIrIrrU2O51LtS4WMFqmyQxBiMiCmJqahiLZ8IlSavlJPNNMJ+Cj75svFTKuOJniONkOPtvSVd8DTXoEFi55+iq7kziH+aVC2oqleybZrSm22dUkv0fF1Z4IHn+xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6c142f50-84f2-b499-d486-61690cdc2629@suse.com>
Date: Fri, 12 Nov 2021 13:07:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/6] VT-d: properly reserve DID 0 for caching mode IOMMUs
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <242bb589-92a8-6def-9dbc-651cda71188e@suse.com>
 <YY5OztQdQMXJSG+u@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YY5OztQdQMXJSG+u@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0053.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6904d44-bbce-4273-8ff7-08d9a5d50326
X-MS-TrafficTypeDiagnostic: VI1PR04MB5470:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5470B62A09BF83271C59D1A3B3959@VI1PR04MB5470.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NGG2ncc/gKE/MPDfnSxHWe4JMbhjS/rtYTbqcabGhubs2yub2qyu3h6xdEhHS02fQ1TxtWX1Br3DkvSJ+6s+7INulT2QgcvNMaK3M4eRWva0MrQtCebMNqqyA1jazNSo0C3jgHmRgCBsA7TFtnLTIOiJGtteVVqc/iB2P15AOOIi14VTPj//vYt6JZY1B/3inCHXhX/1eHrQHLCMl9a52REfL5c0pH9OubvQ1mh6U8it7I4WDuKUw3S8jiJxq3ni02V8rhCM+YajIphV+iIKhJKLv44VqTEMP4HH1MdcHNS1XjGKpHKzdaUIsd2i++7ximYmpX0QBDuAoz9WBRMzHQ3WPrRNHDLRAlprnywXobIAx2l18WTtL04kDpwGvhuVuJ3001Cs8iVYmom6bd0vjuszBS0XULVFqyDXBh7diMHooHweTcu4ysVIYftYzGQMnuV7jgS9ifPSarIXXpBHNPwyR4PMFNTXSbm5j3HzWyYPekrwsEfGEQRReX5Wx8xx2xtf/stWx7HmRUBFZ9skTDFQNRtyj91hW7ulUHvFr1KQe331phmv58+0d1Vs1cZfauxKBFir8a7c0v8Rvd1SOMg1yM2gJ6Jv1+6LdBuJp6gyPk5OMUB5tUPQ+Y3/JujlFtls6rKwKlRznxtWQgLutmIbLTG9fGRevI6Lt4MlJAHbs9m99Kh7VgqcbpM1neY+A8qMZPtIRtibqDAJMtq04w/ki6vJcRb7YpX0Va5F5K8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(8936002)(956004)(31696002)(6916009)(86362001)(508600001)(2616005)(36756003)(66556008)(66476007)(66946007)(6486002)(31686004)(54906003)(316002)(26005)(186003)(4744005)(38100700002)(5660300002)(4326008)(53546011)(2906002)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7EdKYHxYcNXFHUDPSQuwnyFHTzMpXbK52fucAhxWh0I8k4KcAjgn7loNrEvz?=
 =?us-ascii?Q?ZMIEHPqFQJrB4/1HjAy1E2TGBS88msc6ZU4GzIZShFUWIpxYsjPahlm4lkbT?=
 =?us-ascii?Q?mpqAQIC5sIKlIBseDUx7Lvo+zGnghcYfq+vn2IPA76CRxj0WsOhdNAPSWp3r?=
 =?us-ascii?Q?HnewgmCXZpj4QXh75F+rTJ7WEnYnUgIY2A69wZEvrA508+YooUZI3GpRyg/e?=
 =?us-ascii?Q?Y9hWWpoFCf7Xvt2x0G3QebM9UkUBZ83qOv9HHYw9WbDcBCiTVmIxRyoNxoPT?=
 =?us-ascii?Q?POkwUg7Mt0nyrJhAz/HgiGk/0PZ2YacNnwcjJFm2sqTysassxJfsmLBtwsv3?=
 =?us-ascii?Q?IcWITSVcjHe9nGqXTjApdCu8cTJ+WrXt25X+V9rYpoLhCQpp8j8glErtKsEu?=
 =?us-ascii?Q?V1eiExxl+7liiJU8VOiZ5xFYpqSQzQ7J0xUqIG/0Jf/EyRMbeisE8wobDRvg?=
 =?us-ascii?Q?wc3PEdgWSzLw8rBGHmJvcKfREdTO+nuZ8EaDUQs53iFcep4rn8fxXkuFUPgd?=
 =?us-ascii?Q?Ggtibrj2qXBdZYV6C2QOfIS8C/tuP07tDBvCaQSCvHzEpJqzXGaFoGL5qQ4K?=
 =?us-ascii?Q?ftj63XRiIRAr3D9k9mIJS3N4e5ka1DCfGwSsx0cnygZc0mUBUu6GV6+mz7+2?=
 =?us-ascii?Q?DcbHJyuWMtfKeqfkRaQPzyYGVbhROsB7xeqb9hgckkx2ELz+wgPLDVeghYyL?=
 =?us-ascii?Q?yeZMMXWJcEjr6wsk88cpXeDmVCt/Mc6i2P9lA5o3uxb+7uUd7y9Y5D7saIlL?=
 =?us-ascii?Q?99kt1CoDmpwxaLJztSptLcmKxqkpi+97lXJ9IvQNg56ZMvH3ozgu+kEjToO+?=
 =?us-ascii?Q?friTlWtvMtKeER8BToT6EMdbBjqmLv0I4lxFSiHxCYom99ngbitLs77OH2r7?=
 =?us-ascii?Q?UuBtPWcfIPKIXtliK8h/k9613j3HGYBd+xi+D74W4dZl0aoS6MBHXnOzLYVt?=
 =?us-ascii?Q?hUzssZAY9WBoQdUSDqGn+f4k3Y0lPyYIOpoNCVecooonnuzHECtJyiEmTDW3?=
 =?us-ascii?Q?QfPPUm1u9KGyGwGsUx5O/RI9qpxBXHCsvki9x/0Owtel38noiruQx2cNhsy8?=
 =?us-ascii?Q?PpgvC/pL9lYz13HYlIoTRtii2rmP0VOsAWDgNREuJe1pYH23bjoYPX5lQbSi?=
 =?us-ascii?Q?Y0mfILBLhjub4HZbh5jP6inJgaRO9h7G2SXdFZcymW/4F88wj2aCPMbk5h0S?=
 =?us-ascii?Q?aSVSd57Hu94qcpc82Pykt56y8xEffwdbYzr48cPPyZ5fKjELdhzl6fQPyNjm?=
 =?us-ascii?Q?/nElz3iRicklZOLCJZIrP2H+O+f3gUmZjpkfaTHZrLq+irdlrtl4CJqiBuks?=
 =?us-ascii?Q?gg80PJadun3bDBB9snXLfKZ9PS15ORLqiTeJL0S5mOW3lOFzL6+D5lSyfXbM?=
 =?us-ascii?Q?KeRrXKvW6iRmnJuObfN3SMkyfhyL/pf8wTBDRh1KQVFDqHUU6JChP3FiWv8n?=
 =?us-ascii?Q?r8gK5HOa8coEm+9phvjFuA9KALN1KByMi6gAdqHuPITtzomuwbuK6gcUD8VV?=
 =?us-ascii?Q?GnbnbX8XAtOKc8v2Xqmyhlu80YqCVJZedJdYVqKCWJtsqPQUfOgsGSQL7VTc?=
 =?us-ascii?Q?krGmJ5ekw1IjqOvbLelBLqFMCrNMuJ9VVTgcVeKEw5498Q2nS1YjGQRZCjQH?=
 =?us-ascii?Q?vyGg2vwAOVQvXktAjAyhpv0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6904d44-bbce-4273-8ff7-08d9a5d50326
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 12:07:35.1450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNAHic2MCKMUB8Ctd3iruobJUEqD3FIcmKwaHMJgEyLwrFql+f+3XoCN+/M1BzBo54sOIIlVnSsCtMWm/cMDoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5470

On 12.11.2021 12:23, Roger Pau Monn=C3=A9 wrote:
> On Fri, Nov 12, 2021 at 10:47:59AM +0100, Jan Beulich wrote:
>> Merely setting bit 0 in the bitmap is insufficient, as then Dom0 will
>> still have DID 0 allocated to it, because of the zero-filling of
>> domid_map[]. Set slot 0 to DOMID_INVALID to keep DID 0 from getting
>> used.
>=20
> Shouldn't the whole domid_map be initialized to DOMID_INVALID to
> prevent dom0 matching against any unused slot?
>=20
> Similarly cleanup_domid_map should set the slot to DOMID_INVALID.

I don't think so, that's the purpose of setting the bit in domid_bitmap.
The problem really was only with setting a bit in that bitmap without
invalidating the corresponding slot.

This said, I can still see value in doing as you suggest, but as a
separate change with a different justification. In fact domid_bitmap is
kind of redundant now anyway; aiui it was the thing that existed first.
Then domid_map[] was simply added, rather than fully replacing the
original bitmap.

Jan


