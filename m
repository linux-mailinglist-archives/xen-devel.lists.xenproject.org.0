Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8C43CB933
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 16:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157449.290234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4PFS-0000pZ-7l; Fri, 16 Jul 2021 14:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157449.290234; Fri, 16 Jul 2021 14:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4PFS-0000nb-3D; Fri, 16 Jul 2021 14:55:30 +0000
Received: by outflank-mailman (input) for mailman id 157449;
 Fri, 16 Jul 2021 14:55:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aN3H=MI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m4PFP-0000nV-Ur
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 14:55:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da6868e0-e645-11eb-898a-12813bfff9fa;
 Fri, 16 Jul 2021 14:55:26 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-ZuaV6h2hPHWVh7QVNXcVVQ-2; Fri, 16 Jul 2021 16:55:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2704.eurprd04.prod.outlook.com (2603:10a6:800:b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Fri, 16 Jul
 2021 14:55:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Fri, 16 Jul 2021
 14:55:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0701CA0061.eurprd07.prod.outlook.com (2603:10a6:203:2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.10 via Frontend
 Transport; Fri, 16 Jul 2021 14:55:18 +0000
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
X-Inumbo-ID: da6868e0-e645-11eb-898a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626447325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2uojqQarTUpRbJRlnbyxF9rZe/W+19PMnjTxP+/cSEc=;
	b=FDplaD6ms7CxFneITe4ABy/JDzguKU2P9nlR9HVL/ShVguTjBhcfJNNOmGQqo1LB/UHxom
	vNs+LzbGU3/JxQfvqt0WAZC8DdG+vp7/ID8pB7yh5iVokIex+bFROYcu0pd+e8kbsmLJC5
	PAXlR/w5rvmY2loROuNlqtruqwQKytc=
X-MC-Unique: ZuaV6h2hPHWVh7QVNXcVVQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8YQEyH1UrTykSq3FeTlvIvYzNvFevk/d+a5hGRrLyymo/lBiNkJbTtuVvQBpnHeFA+ClwwWMFCzYJu5rLyBzHJ3GjK3qvzjpu6U+suqa0ufv1IIZCnB+YOnYLy0SBO041jTUuWEucS+W/jouDblum6sPm9ZRAF3qA+9XZSVFFoDidxVaJTywuM5MY4DsF/jd3lzn3L9MKTfPrppKcQPFC4zy2G6zYrOwyf7TLBvgRxJ0vH5pZL/DItGg108m0Fq5rYrbT21Rj/hykX30qVE3yUfFm7zSz8PY7ho/2dXFWAyUp6xcAVW2J1OOJPmqTBAmOM8Ql21bKM3iqT6yZw5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uojqQarTUpRbJRlnbyxF9rZe/W+19PMnjTxP+/cSEc=;
 b=iidjROu/KeOVtUTlrLAwopPHYWOudUY5pNqkHTghFdicZ/jNOrophbMzdx91M8dbIDXCSFaVbte2zBu6vzgZR2259m//wAWpb/P1VZpugyjYjE3zlE7ms9r7uhFaDoV1/A4fC/l+Kt1gOWS68N4PiZYXPfbS9hDveS+nkXsTU0WJ558FYyreH7sX0byz06Xh4JCdHeXX+fHn6wpq9NcIR/PRoKA+dgFiInR8DKzQcbMkWJAEA0RoYs19hMdxe5gqIMbZ4IUos9wCJ2OwQPt1Dn+Yh7vUuhc1PL0+QAj+fXSuMLabibxdbcifoJxAxUst6X1W3GoJeijThLPKyI+AMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: apertussolutions.com; dkim=none (message not signed)
 header.d=none;apertussolutions.com; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 08/10] xsm: remove xsm_default_t from hook definitions
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Ian Jackson <iwj@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org,
 Tim Deegan <tim@xen.org>, Alexandru Isaila <aisaila@bitdefender.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-9-dpsmith@apertussolutions.com>
 <2f9d2f66-563d-4e7d-4886-e4fabffebc78@suse.com>
 <a03ae0eb-7ff9-99ac-2e94-d6af2100fada@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d646e627-6efe-7090-3961-48366392b24e@suse.com>
Date: Fri, 16 Jul 2021 16:55:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <a03ae0eb-7ff9-99ac-2e94-d6af2100fada@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0061.eurprd07.prod.outlook.com
 (2603:10a6:203:2::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43786506-e6be-4f48-f8a4-08d94869bb1a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2704:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB270439967DB0197EC0EFEB3CB3119@VI1PR0402MB2704.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B4uCb3M9jOydb0LH+cPttDkDRfHcl78C/fluZPoTT/738jDMj2GZKQCIypHiSSKd+SgoyfwV3sZU91y+A6PmwqOcuyTPV/12LqHZW6DJQLWVYXKRNvxC+yJU9lFCLKx7oR7nAW6MAgUycT9PH5FXFp0WERfCBaslOax3ofa81/heo7CkzujzJXH6ZfVFNyFivdYswG6ijlL5A2mNflTUODrdzMKxVm/ud9yTTiHs6WyNXLJmLPzylxpaF3xp8cXdKDuMiTUhIVAjYvrCL4zT0ai5x213RpllE6jZxd98H4PcDyesYCbBUSvEqjZ4GeNf542Btg+Zwu0bHiqpW3mQliJPv15YWIZSOWwgIcA0AAT3WnJj+2SDjRE36Tte0EqOImhEz0WCLLEt0QVgDHIYsJxHX6EFeNMK0WaFzdLgmlUvl+wFxtDhc11VGrnuy8eaKBTMCS/we7Ipa39qm6AUwhxOPH1uc0rak9X9wqZlRgYnAtQ66AC1/QBAXXmgYvWIwq/RMtUFhs35v3RdV66jdL4RkylyPKT2o2WMkSN977z11d8gA/nE0bQzBgmdscW8IajntRx9UPL2/ktoqOPWnrmjcmNgLKFFRFwh4oO+SMvpGxkltEZT3AmBMSFWFboz6MBAmlQacXqFGKkRrrKSQSzvLqeBmWIB9kaIDxixc1Xgi/8fD5QSuvntx55jH56cX8gJH6BJLB3g+lznW9XVJYlU5A4Pck42MgcivTiymAcWkTmCrKZ0OLB6Xiqa4vvj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(396003)(376002)(39860400002)(366004)(2616005)(186003)(31686004)(26005)(83380400001)(86362001)(316002)(7416002)(53546011)(54906003)(31696002)(16576012)(38100700002)(6486002)(4326008)(956004)(8676002)(6916009)(66946007)(5660300002)(66556008)(66476007)(2906002)(478600001)(36756003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEdVV3BybVlGSmx2NG1wYndSUEVCVFZkQ1BsTDZIaU9xb3Nxc2M2aTRWZGdM?=
 =?utf-8?B?WnduSWI5bTJzSzFWemZRV3pCdTlHeWRXb0N4djRwa0JFWlA2RVNudEZZQW9F?=
 =?utf-8?B?bUpxakRDemZDcHEzTnlIWGxFY3hNamlNeEU4cUJyRThWTDQ5aDdrbmpPam1w?=
 =?utf-8?B?S0NxYXh1eGZXdCt6TzN0N0xRbDJ5UEtZQVFBZHZKMHdHSStWdUFoODYrdEZx?=
 =?utf-8?B?ekc3S2hOdzNuWFNGeFovcmlLZWNuT3JRL1JXRkZGS0RJUTBOeGprMXA0c2NY?=
 =?utf-8?B?d01UZ1NPMXdDcFZGbHRaSno3b0xDdHJnU0Q3anhsWGNYbGNzUHY1SnduakVU?=
 =?utf-8?B?MHd0K2JiNUVyWFhsZjFRWk01V2xqbnJ2ZlZuOW96NFhpOEMzRWsvWVZDTFRP?=
 =?utf-8?B?OWlmSk9nbUlaeXd2eE1CQjg5OWdZd2kzclN0eEVZeXBRUG42amZvbSs3RUx5?=
 =?utf-8?B?UG9mTzdWU2lKaE4vMlRtVTV5ZllHNVdSN3lJWVFyQ3hnNGcyNndYMXRHc3Rn?=
 =?utf-8?B?SE1Od3hSU0lMeUxhWE4wNUNNUDdxRzM4anBzeXI0bzRHTVhMeFpwYVB5L0hl?=
 =?utf-8?B?ZXB4OXFORHVsekcyQkhoby8zL1dab2Z4Mktad0drVHlhSHNFbnJxbzRFSktD?=
 =?utf-8?B?dm5TbTg3elMvU2x6cEJCNDZVTHljWEpwZUg0eHA5SnJ4dVg2eDhMbDFCWDIz?=
 =?utf-8?B?b0MwKzJQVk9PenUvcHlOaktvTUdMTHZreC9IUnpHWXlZc0FLMjhHQzFJSmRF?=
 =?utf-8?B?TUhMR2lJa0JwcDA4aFV3N1B6L3o1eWFUeHI2N3R3bGR0UjJ0U2NSRGlzRGdN?=
 =?utf-8?B?eEFOdWlvVUg0TXV1N05VVWJXYlMyOUVzRFVNaklzYXVOZld4Ym9QWHQvcThR?=
 =?utf-8?B?OWRINkFQQXlBeXZIVm40LzEwcVRCYVJhdXU5QnFXRVNMcFptUmpWSWF3Y2di?=
 =?utf-8?B?KzVzV2pTM2EwWjZBVGdLU3lSZjVheEhpZFlUUXZNdkV4TzRpa21lTVlxTk1p?=
 =?utf-8?B?QWQwYnQ5SHo2QWxZcU9aYkRtOVZ4R1E1Y1JQSlpObnlNRXJtQlNQVmFmK0dn?=
 =?utf-8?B?NCtPZWIwNnh3dzVDZkVic0NsTXVycjZZR0ZFemVRM1k1MUVVT2ZZVFZrTFRK?=
 =?utf-8?B?SGdxeDhXTnlNYnZSaUJ3eXFPNGhjaGZhK29MK1NmSXQyM0V4NE10ZnYvNDZl?=
 =?utf-8?B?YTRaSXd3TjNndy9HMnZsNmJzWXkwY2UyM1g3M0puWHZ0cE83d0x0aFFndnZ4?=
 =?utf-8?B?RTZ0UW9MQlZsT09qTEgrTUZTMXRrYmtFRWlib0RnV1FlTExYRGkxVWRLWGJF?=
 =?utf-8?B?TW5VTXBIQ0c5OXExY0VFT0FvcVlzZ2hGdmpENWlLdCszWjYreFNMUWQ0ZnRP?=
 =?utf-8?B?K0x5YXJELyttczBYOWk3ektPc09vbTNyZHlXSFV2ME16dm8wb0h2eEpDZGVW?=
 =?utf-8?B?TVNidG1LTDlOa2ttdEh1cUMrM2F0YTZhRjJ4L2VwTFBwWVFEZllXTnNCZ0Vv?=
 =?utf-8?B?dmVyZzBlL0kvNVJHVlpwdWNvQUNEdFk3b0EvM0dPMDlZT0cwZTRXWEJ3dTRE?=
 =?utf-8?B?d3kwRGNEZWx4enJCbzBCYzFjUVF0ZHpHOTdUek9hVEo4VXVpaE53Wnc4NWRh?=
 =?utf-8?B?SVJVSktnckRsRDZZOWhtMHNlWkN6Vzg0TmtzVWxNT0pmR0RaM3U5VWh3MnZX?=
 =?utf-8?B?Q1ZzZnJWUzRQR0c3QkxJWFA4Z3V6eTVEdWcrTmtzMjhvQlFTWHBFamtsbFVV?=
 =?utf-8?Q?VZgjdV5lXDA8wiXwpyJ5yDikuJCdkI9mAf6OtJG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43786506-e6be-4f48-f8a4-08d94869bb1a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 14:55:19.8997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2xc5HQG2C2ykyiH3cVc6syxMrKDZt2yxZnEGF+kPpc7Y2YA+ehLuHwhMz0TP57++Fbw/RWtBukPsw8+k0sg1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2704

On 16.07.2021 16:15, Andrew Cooper wrote:
> On 16/07/2021 08:23, Jan Beulich wrote:
>> On 12.07.2021 22:32, Daniel P. Smith wrote:
>>> The passing of an xsm_default_t at each of the xsm hook call sites
>>> served different functions depending on whether XSM was enabled or not.
>>> When XSM was not enabled it attempted to function as a link-time check
>>> that declared default action at the call site matched the default
>>> declared action for that hook in the dummy policy. When XSM was enabled,
>>> it would just drop the  parameter.
>>>
>>> The removal of these values is two fold. They are a redundancy that
>>> provides little context, especially when the value is XSM_OTHER.
>> For XSM_OTHER I may agree, but in general I find the call-site uses
>> helpful to know at least the rough level of intended restriction.
>> E.g. ...
>>
>>> --- a/xen/arch/x86/cpu/mcheck/mce.c
>>> +++ b/xen/arch/x86/cpu/mcheck/mce.c
>>> @@ -1376,7 +1376,7 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
>>>      struct xen_mc_msrinject *mc_msrinject;
>>>      struct xen_mc_mceinject *mc_mceinject;
>>>  
>>> -    ret = xsm_do_mca(XSM_PRIV);
>>> +    ret = xsm_do_mca();
>> ... to now understand what this enforces (or not) I have to go to
>> the actual implementation, even if I only want to know the trivial
>> dummy incarnation of it. This effectively extends the "provides
>> little context" from XSM_OTHER to all hooks.
> 
> The old scheme was even worse because it was only a plausible
> approximation for the !XSM case while being actively wrong for SILO and
> FLASK.

"Actively wrong" is perhaps going a little far? I don't think SILO
relaxes things anywhere over the !XSM case, and I also wouldn't
expect a Flask policy to commonly relax things. Of course these
simplistic categories can't reflect the full possible range with
an actual policy, but seeing XSM_PRIV in a call used to be a fair
hint that subsequent code isn't expected to be reachable for
unprivileged entities. No such hints would exist anymore following
this change, and its description didn't sound to me like this
aspect was taken into consideration. Yet it is a difference to me
whether such removal of information (no matter how precise it is)
is deliberate or an unintended / unnoticed / unexpected side effect.

> Furthermore, someone reading the code could be forgiven for thinking
> that XSM_HOOK was something other than dead code.

I certainly agree with this part.

Jan


