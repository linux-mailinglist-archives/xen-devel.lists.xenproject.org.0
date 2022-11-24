Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C80D63753B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 10:35:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447905.704529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy8cf-000414-Kq; Thu, 24 Nov 2022 09:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447905.704529; Thu, 24 Nov 2022 09:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy8cf-0003zC-HV; Thu, 24 Nov 2022 09:34:21 +0000
Received: by outflank-mailman (input) for mailman id 447905;
 Thu, 24 Nov 2022 09:34:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GTCw=3Y=citrix.com=prvs=3201a854c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oy8cd-0003z6-Px
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 09:34:20 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a01a68a-6bdb-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 10:34:18 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2022 04:34:06 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA2PR03MB5945.namprd03.prod.outlook.com (2603:10b6:806:11c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Thu, 24 Nov
 2022 09:34:04 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 09:34:04 +0000
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
X-Inumbo-ID: 2a01a68a-6bdb-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669282458;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=c4IbSwzwTl0OoLd2aUTQuPhgcrA3NFgPYZWM8pjfb9o=;
  b=hxV1I0HYovlRkYV6uOy0IbwJ1A8yWREHu9sD3ZEt2Cnzc4Ds4f179Qls
   3iTd1gt/2If1+FkfUXrzDtU9/jcDVvBAMpSVu/uUcUdC3dNlieZiHuOB4
   osGRG9TVeZtGySFl++HpeEAJyfAHmJ4Fqs0y7cLMOt7Z9BTjEsTrUl34O
   8=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 85057107
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DYYajaLSm1WI3ncTFE+R5JQlxSXFcZb7ZxGr2PjKsXjdYENShjZWz
 WBNWTyGO/uMNGKhKtB1aNi2oUJUv8fdyIMxHFRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wZiPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4oHDB+9
 e42AQkVYzbdlb6yzbSWYddF05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iLx3rKQxHukMG4UPK2EzPtvmAy9+mUSLCEuRWfrm/KotmfrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/I+wBGAzOzT+QnxLnANUzppeNEg8sgsSlQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJTbp+PHmqYA3yxjJHtBqFffsisWvQG+gh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7AJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:sI3iW6zcuYSpmmFr8plnKrPxTOgkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvXRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NToj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qn5yDQlBIVr1Pyw16RhnXu5eT/WTIBEsJEwaZUaAHQ5UYMtMx1lP
 sj5RPQi7NnSTf72Ajt7dnBUB9n0mKyvHoZiOYWy1hSS5EXZrN9pZEWuGlVDJADNiTn751PKp
 gmMOjsoNJtNX+KZXHQuWdihPSqQ3QIBx+DBnMPv8SEugIm6UxR/g89/ogyj30A/JUyR91v/O
 LfKJllk7lIU4s/cb99LP1pe7r4NkX9BTb3dE6CK1XuE68Kf1jXrYTs3bkz7Oa2PLQV0ZoJno
 jbWl8wjx98R6vXM7zP4HR3yGGPfI3kNg6diP22pqIJ9oEUfYCbcBFqEzsV4o6dS/Z2OLyoZx
 /8AuMTPxbZFxqfJW945XyBZ3BsEwhubCQ0gKdOZ7vcmLO9FqTa8srmTd30GJ3BVR4ZZ0KXOA
 pxYNG0HrQM0nyW
X-IronPort-AV: E=Sophos;i="5.96,190,1665460800"; 
   d="scan'208";a="85057107"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEHS/fVEsUekBGFOuLxckT5PenW4/8lUyuBuemZ6RaMVTyIeQNbNi+ymwm6Nof+WthJIbBbd+1fyEjtw7x8K3P7CSpk7ZN9sagb3dVdM9wR+BxR3CNDPUH86e06sg1mSYAO0zdxyPzihi4Z2Vfub0YQMyegQ1RJYZS8xLuIlZYKI8x/slnR7q6ZrTJex534TrrngCSJ0zbMVphTai9ykVqWf7xneILGKGe7gAgcnWZNj6cixPRYDUbb1c2iZcOgwmyOXEsc/VYLVmD0LKce3jtMHfMEMS1r3PX10kqAWkiPWRimY8Pax6jD+J3A1DEe1GTeTBasmyRbHRlwM25C61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbWtRUD6295XrWrZxbiIlgQl0Q7ZXI2GS91OHkIterU=;
 b=jyG2ev2HS/3tkrx5zrhmOrMNpgPN/2wy+P4Faxfn4G/IRCOpDzwhrkZNKF/sWSRqGLFloJjLFtiHmR1Q05/pbf0Oj6rpKiY8D+6Ar7BXeGn1HfyPdeApcBQYEihyd23Q87GQVXVgRP141sib6Qpd8f8X2K727bNi+3VdLrZEyHB1iv87gSaBbDXLHiUJvHOWzflCevQ6ZMShWjq2ihS+GfWpT3xGpIsfqtB9xz/nC8EQKGBRQNcsVpUINZ+NxxK9yDTpTwh2FIP4sy6BHIlIhUCrhI8uaVTSqGWigqI2FjgsSsnUXbl/oNNNkBof5EpRf1AxxlwlUFxYcj4HH57OrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbWtRUD6295XrWrZxbiIlgQl0Q7ZXI2GS91OHkIterU=;
 b=NfR2B9sXASJBMqnyCMjRMpqyoUHewZePnaSHpXwhP0lJs7YfQ0xgSKWTqDb1LZtp84TJixBBHxZI1pLSZ6XLSfA7DMY4XbePthMUqxusxoBC18ZHVXp1nRF/zmJxl6sxLvwMFft6uf/+gz6Un41oZ42NErBVOefVLCnVTi339eg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 24 Nov 2022 10:33:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Message-ID: <Y386hoiAovoACjEG@Air-de-Roger>
References: <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
 <5a2df843-1acd-ad78-baff-e47befd0703c@citrix.com>
 <878e635f-b116-3580-945f-f8acb711a5bc@suse.com>
 <69507b8d-1f31-39fb-7469-e240fbfdde44@citrix.com>
 <33a005bf-0596-c624-0e70-077a450ac2ae@suse.com>
 <Y34L/MwSFGUsSe2I@Air-de-Roger>
 <351a6e54-8002-aef0-993a-c6b8bdcc1e8e@suse.com>
 <Y38ugExH9uGdw83a@Air-de-Roger>
 <Y38z/h4aEkzh5rCG@Air-de-Roger>
 <c928c198-2565-2105-2b6e-b07e96935080@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c928c198-2565-2105-2b6e-b07e96935080@suse.com>
X-ClientProxiedBy: LO4P123CA0191.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA2PR03MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ec549f-b626-4446-fe90-08dacdff0695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cqZ+9NDjwbUWx92y+UHnqhauE39+KEs6gFiFT48KAceGU1P0kRiyu9yswWD1+gcjcw/bHraWE6660J1B4PEbcqPAgoVX9ngTuE2Mie69k5TWCNlHduE/+J+DYaRDqXjl4yA5mx5IEXaHOeB9l/+EF3iNGsPwLu0pgTtkfmiriuFFogr4CT46NTQDaeS1KbRzuQdcRC2Cl1Pr11MOMmUpUvD5I4vV3yyy5BUHVv4SNougNkRl0oXczORPIQghjNXGHs7Cy/nofdR4M0Qw4kAH/2SLRkc+6VLoALNne5U09HP4uUi1NZcMdjrUI2AyBhAxzFmUrwU9ormatAusKBVtDBTugFtprj2vJQLTuEKmrVP4VvCm/DvaZpshzU5pnoI0XH4om78w79vnx2pFlP6gjJjT0cb4256xyvjDEz4BU/CktyBB9+I5kp3MbunrkBKXNZ3s1QS5ZRx8FmP0aPKzH7H8KxImmGxQPesJI5+FcI5qGI0a5CqLSn1VIf7fdOoCanm71jaLeTLe9G/bwf7vAEKm2toTjOF9Nl3pXk68vO3GcBVHk2OJU8hfTcrMwSlorLPNc2Q2/gRIVN2+Wi9Cc3wi5utozCz78mfAMptkW+gFJg8ZiScjp1oWb9LcQwfT/R3XwaiNhb2H9g16vVQKf7r/cCyhOjzt5yg341cuE4I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199015)(85182001)(38100700002)(41300700001)(2906002)(82960400001)(86362001)(6916009)(966005)(83380400001)(66476007)(66556008)(6512007)(186003)(9686003)(66946007)(66899015)(316002)(8676002)(5660300002)(4326008)(54906003)(26005)(6506007)(6666004)(6486002)(8936002)(33716001)(478600001)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFgwZUs5eTc0RTBlbzJtSHB5UjdNdlNuMzc4dEJpekpYbVdBcXhzbkgyckFm?=
 =?utf-8?B?MXBCcTJuOTZ3R3dHTFNQZk9EcDFJeFBtMDNQVUFFTWdsclF5S01rdVBQRjNV?=
 =?utf-8?B?cDlWTlFBdXZ6ZWJpcjNsYnNiMERyNnREK1NQbkdwQnRuTEExS2Nwa1pDN0JM?=
 =?utf-8?B?MGRoS1d5ZHhiQUZlK2xQeFRqd1lQSFpUUXcrS1Y3YkNuVkJlZmNoQU9vSzdz?=
 =?utf-8?B?U0ltZ0dCb1QycGFiU29ZM3RpZHVJL0xiTDdCaFNrODluMElXNlVtSnE1N2s0?=
 =?utf-8?B?OVEzT01PdWVWeXN0aFQzZnNHNWFxL0pKVEtmTXBidUFicGdxeTRvL05kM0pJ?=
 =?utf-8?B?SjdmL0l1UXNGRUFWYkQwZWpDV0pUOWhiNWYyVzVzKysvZ3RQZlUyZFhVd1U5?=
 =?utf-8?B?SkFGVHJEbEtZS2R1MC9mYkprQTJreXRjbVFXRUxJbVZmbjRtT2NZS0kzb3Nl?=
 =?utf-8?B?RHhQcUo2T2I1aldPeHo1OFlEbmhSTkVZM2NGeE1xY09rT1RJaDFiSnhNWUR4?=
 =?utf-8?B?UVdBUk9XL3ZBYm9zZHkxQTM5SCs0Ylh1RU8zMk5DVXFaZ3Q4ZzlielJLUWl5?=
 =?utf-8?B?ZXZXNHZmME5pbXZqMnNPZ1R5dWk3QmdpWmtzbUoyb3ZXeVBzOGtkMVpCWTNJ?=
 =?utf-8?B?RVpiTGNlUWlCY2dQVXk3NkVmUkt0clFxR1JnWFdWNWZRa1RtZklRbVpEbEZP?=
 =?utf-8?B?K3E2S1AxTDVlcU0yZFk3bU1WWVByYzVDMlFhWHY4VmxJUWljaWpsSDF3aEsy?=
 =?utf-8?B?NUd3UEhJaWFuQ2phTnhxaTFDMWtBTFhRcEhsdmJSY3FlYUVIbFZNL1RGa245?=
 =?utf-8?B?T3ZtckM5bXZWdnBnRm90VnBDV2NsdXY0bllXVGdOWWUzZno2dHl2d3pkTFVl?=
 =?utf-8?B?cEZMM2hsc0ZkYWFiVlZPQnRPVmI3MThSczR5aW92UWhNcEhzcksrZXE0cVQy?=
 =?utf-8?B?dEY3R2svaFFvT2FCcjdFYzF4RmlId2RidUJOazR2YmtqUktldFlXa3dhT3VX?=
 =?utf-8?B?bllxWmYyc0VQUzRWNUM3aHgrUHNXaFlrTS9EcHZHaGtnR3ZBOStieTVBVnZu?=
 =?utf-8?B?clpGQTE4aVpyM3l0OFR6Tmc2S2lONm5sd09YMmtiRElQRkZYQm9TZy9jeFVZ?=
 =?utf-8?B?RHF5K3Y5SlVxTTZNanM3RlZ3cVNKNnBKWWFzNjBOcjhQY0U3N0Q5S2Rja1Bj?=
 =?utf-8?B?TWZzZDF6RUU1d1BIRDRSTk9QckV1ZW5vQjBPVlBLY1l6N0dyVGlIeUZaN1VQ?=
 =?utf-8?B?eHlKUm9OaHhtd29OOVhyZW02ZWIvdzNZUDN3bG9hTXNYY1ZhNDREdU4xWFhq?=
 =?utf-8?B?aC9YZ3dBTWZMbXBleTJ1c2xFaEdKRHpBYzRyVjJsQzAzS056UUllMnFYYUdj?=
 =?utf-8?B?ZFJZcDNLcW1pODRuT1AzYXV1NStjamhsU0kzai9SN2xrMm1qUTVVWDh1bXR4?=
 =?utf-8?B?eTcxUDJsdmQ3bHJCQk5mSjdOTW1HSEN3NHNQR1RCc3E3Z1Zrc1M4dVhGdWQ2?=
 =?utf-8?B?eGJMaE1pUTlJVlpVS1dLZkNIcmRwZlJmNzdtWTZYK0ZoUjRYUDVtb1N6dlJY?=
 =?utf-8?B?ZHp0MGMwby8rcmgyakdGTUllMWtEanN2eS9zZytHNERGa2dGS0NPUElFMXQ2?=
 =?utf-8?B?UVJBU3JXckJ3bXFvT0Q3ZFpnODkwcURJdkFMR3o3T0ZaVS91ZVJFbW9HMW5U?=
 =?utf-8?B?QXY0N3lBZnZyYWV6N0pRZkxHUU1wZ3gvcy8xbVp3UkJTUENYdHl5bCtzQytK?=
 =?utf-8?B?UXJrZEFaVklyMUlqNlFiNlVTbFk5N3VmZWdYSDkwQm50QlN1M09CU3VHcklJ?=
 =?utf-8?B?SHhIZ29rS2V2T1dNSUFGNWhwZUMvQ1V4T05vLy9BVFpSZ0hGSmVhSktjZFB6?=
 =?utf-8?B?MGRLRExqenJKNGw0QXppQ1VWanpnNHJuOFp6Tm9CVGVmVUZTRU9BOWRnQkpQ?=
 =?utf-8?B?b2ZsM0FhTHlRRGltMUk5U1VpZzluOVN3MzF6SkdBSGxweUx1NHFiVE4xR2Vu?=
 =?utf-8?B?V0psaDVTNUNHQ1VNcitGcFhtYnlVTGZmS0lDY2FTL3Z1elFDNUc3WHh1UXA2?=
 =?utf-8?B?ekp4ZHlsOGZPY0ZISldUYkxZN0JEK0dqV2hFNUhjbWRkbmJFSEZPM2N0aTNy?=
 =?utf-8?Q?Yey5fa7Vl/jE4ds53WPNdoq9o?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nT1nCoobnpUzcZkbyUgoLRqd3rVxrExNrzmcxnhV7ivSNyxVrPNlYZZWcX2WAP6DE/bIvi4QEdcw5av3NSOQrQ4EFbibkpolD2iLUAkdGxOMasYL0cqMsbgn5aTICsAt0IdfFxn0CnkaGNvodvA1FI8u1TycNL2dEMTY0QDP4xIO3U8OeXTXoyu5A3YhzOSqXc96b41Lckr6uUZTU4JCjL8m0l4NCyvaeUH297byMeA/YA7dEsd97cho4g89upSbPUS0em9E6OHTWh2P/kVR2GCeQ3RKPithylW5pRI4ZdDxE84C+BbO7o7z7FWyIIlbASmEXZt01DYjYoX6gH5RZLAApK8ZxPEXHHxXEtimW2WtANYmi5PV8V0NIrG3XkUbOWFRZx2gv16BDS/+6WaG2BMEWzzDTJKoYkqcsl0aplnhHQlwuURlCzd1DYU4Kz4QueTS0swz5lNFxQOJoHO8uw5+E1TULepV5pNJtv+suFuk9E+DB+jHd806Iq+Ssnqy+xNoOXOldfspJoiF1AW7JtPz38Ubwlq81iO76MYzpVblmORBfCjdDU95u4cE+IafDwU2zH+vvPF4CPlXfK6VQgkp5EOHLCp8mWZgQjcqhsT153kmolWxlGYC9smHB5h3ag2yWqcaFARMJpWp13sOpS2Y2EMlUmNY+z1XUVbc0gKuiV6d1KD6Ti5S+sxuXth5K92HNXUoW6ddzjnIMn6cq9XAkA0lGM/nyLflFHp27u9jQGqqWVlvS0xYBtFNrkPJZDdRYnCZLg2+Dl9lKIK7OiOr+agw5KC6emt4WjuZjxqG457he+f+7D3EmlVXlpaflhlrPUKJAzN6oFa5BFwOAKlxHqIZSW7dbHLcVlWPpZ0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ec549f-b626-4446-fe90-08dacdff0695
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 09:34:04.1724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8q9nXU7s/pieyIdwK0iezdJfiGxtesSQc9L6mnymfM35UqRSC0+3W4DEsQIDLcZalr3ayy0sDmxK3RfeJWpCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5945

On Thu, Nov 24, 2022 at 10:11:05AM +0100, Jan Beulich wrote:
> On 24.11.2022 10:06, Roger Pau Monné wrote:
> > On Thu, Nov 24, 2022 at 09:42:40AM +0100, Roger Pau Monné wrote:
> >> On Thu, Nov 24, 2022 at 08:59:00AM +0100, Jan Beulich wrote:
> >>> - problematic wrt evtchn_upcall_pending, once set, preventing event
> >>>   injection later on.
> >>> As you may have inferred already, I'm inclined to suggest to drop the
> >>> the is_vcpu_online() check from hvm_set_callback_via().
> >>>
> >>> One related question here is whether vlapic_do_init() shouldn't have
> >>> the non-architectural side effect of clearing evtchn_upcall_pending.
> >>> While this again violates the principle of the hypervisor only ever
> >>> setting that bit, it would deal with the risk of no further event
> >>> injection once the flag is set, considering that vlapic_do_init()
> >>> clears IRR (and ISR).
> >>
> >> That would seem sensible to me, and was kind of what I was suggesting
> >> in:
> >>
> >> https://lore.kernel.org/xen-devel/Y3eO0bMKRPYJc2yQ@Air-de-Roger/
> > 
> > Another option would be for vcpu_mark_events_pending() to
> > unconditionally call hvm_assert_evtchn_irq() regardless of the state
> > of evtchn_upcall_pending.
> 
> I think you said so before, and ...
> 
> >  This will create some spurious events.
> 
> ... I continue to be afraid of s/some/many/.

Not _that_ many I think, as we can only queue one pending interrupt in
IRR.

> This event delivery is meant
> to be kind of edge triggered, and I think it is a reasonable model to treat
> the flag going from 0 to 1 as the "edge".

Hm, it's a weird interrupt model I would say.  In some aspects it's
similar to level (as the line stays asserted until it's cleared), but
we don't get new interrupts injected into the APIC.

Maybe the right mode would be to treat evtchn_upcall_pending as a
level triggered line and keep injecting interrupts until the line is
deasserted (ie: evtchn_upcall_pending == 0)?

Sorry, I feel like I'm asking more questions that providing answers.

Roger.

