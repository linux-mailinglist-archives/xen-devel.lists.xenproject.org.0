Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50933C141C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 15:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153130.282905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Tuc-00069E-UF; Thu, 08 Jul 2021 13:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153130.282905; Thu, 08 Jul 2021 13:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Tuc-00066c-QA; Thu, 08 Jul 2021 13:17:54 +0000
Received: by outflank-mailman (input) for mailman id 153130;
 Thu, 08 Jul 2021 13:17:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XUKi=MA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m1Tub-00066S-8H
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 13:17:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7eefe9c-2b59-43cf-9226-1ca5919ac7ca;
 Thu, 08 Jul 2021 13:17:52 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-YgeoyRklMSO-Cn8P8Xy5ww-1; Thu, 08 Jul 2021 15:17:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 13:17:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 13:17:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0077.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22 via Frontend
 Transport; Thu, 8 Jul 2021 13:17:43 +0000
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
X-Inumbo-ID: a7eefe9c-2b59-43cf-9226-1ca5919ac7ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625750271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wyfmdxiIyabVcikSXehTwfXS7Hk9myvO060s8bSdjMg=;
	b=YX8Qq4I4MFXJSEQQya6iZZ29Y2RW4e3MbhVp+QRAzOo0Chgs+j09fzbrbKKnpOOEtQrc6D
	9abPH0zrHni7tUL/DTvhDGoORIL1nb3TdRP8sX0ajzTgkGZ7tPrdXUDL0H+dS2OHTPL22E
	g+nCKfx/mJSAjXUz57EIZr4NZq22BIo=
X-MC-Unique: YgeoyRklMSO-Cn8P8Xy5ww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpfwj2XHHV7hIFf0TVC+ZJM6vQAyL3H9vyhExdCoLJjFa1cj2fMnNn2iW0zl8QcqtrcHtwQNIUsDwSLVRDE2gZhU/PinuTtxWJqu62jiSHMD9DwJvQW2OFjqfw+LUMI63ePI4RXMe7X9hiIQvtX4iZXmdEWbwxfjpq4DVRW6WIlIJzlT1soHAmlxGzZFyd8MqygvH30DHfg+Y1F1xiB0E1xSe5IuB6L7AJSm3TjOiffbyC0hn2cPFXKryQr6EnZp4YE266F1cWC8tAb55OrTA/ACd5Wt23VCAo/0dNXY/sPZIAmo/PCtxwopuAV4+1t+jcmDP1KbWi2x6xSucLv/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyfmdxiIyabVcikSXehTwfXS7Hk9myvO060s8bSdjMg=;
 b=gdbb+RLhvQmj61UNkSCqSbuaxwuDgVShJIOlLfBe0OOJ+k6J84UTXybyP8BYSzNV/qvzeexTxflbEmsMnzNt7bzP9YLpJXRor0u+DKWHhjL6H6IBlFeXUEfUYU0tAWD1TSJpuqMrnc1229+KcYz2DQ6r2BgmZ++UiKIRvUM0MI4IG9ZlhCXYbj8NpuHNF7e8sj+OEIjl+Y6i5fJvFepRI+yvuKZG96UzCwaknIxo6qjfzP9QPQAxENucgn+xKGPt7DwMiuMYsJzV6XY4pdeeeT5bgqIToruyeeM8J+nacMkz4ieJNBREx9ljEnQvd8P84NIzCSne0Z7WCaITREo0hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [RFC PATCH 08/10] xsm-silo: convert silo over to domain roles
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: sstabellini@kernel.org, julien@xen.org, Volodymyr_Babchuk@epam.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 wl@xen.org, roger.pau@citrix.com, tamas@tklengyel.com, tim@xen.org,
 jgross@suse.com, aisaila@bitdefender.com, ppircalabu@bitdefender.com,
 dfaggioli@suse.com, paul@xen.org, kevin.tian@intel.com,
 dgdegra@tycho.nsa.gov, adam.schwalm@starlab.io, scott.davis@starlab.io,
 xen-devel@lists.xenproject.org
References: <20210514205437.13661-1-dpsmith@apertussolutions.com>
 <20210514205437.13661-9-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da689bf7-0e39-fdc6-c3f9-2ec1200f8f48@suse.com>
Date: Thu, 8 Jul 2021 15:17:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210514205437.13661-9-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0077.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dccb83ba-c2c2-48c4-af97-08d94212c652
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB73601A91BD8D07209AF8F8D7B3199@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VIaWkwlkkBxYTE99zrzXZEWrcSWGDZABSlXVWluLvSQhgogeNbnNStlqfiJH4U2S85CBj3YefTmTS6+xjGjTrF5VLSWT+bqASGxMbV/HQQEyToOVlINsTUQx+eUFTZx/nIJqcdpHnub8hsPUGE1N+jWHgqgMPKd+vi16POGcU46f1uH2OVjTTPPFFIb9uqeJn0zcR/Ray3vYxfCTmx7nzT3XTnRRzLrsgsATl4VmG93rV1wEhY6YXe9NzJ3fxqptQyf03XwnQ9OP+MDFx8ibOiPH50K/1edonmnNKOwZO/Hw5KwdcOB7pH7r0VYEj9emjiGSasLiQULBzUIpMvCyT/y2+9qpza1gNsktRX6+NejOXhWlcf9j3m5ybQFZapSAK+2Ls/OZQreKfXbOqUcR4kFUYI0a8iO/Z2i8Ox5nrJr8XZy55zv3ltu73Wq3L4YfT5z3wr/gm47a4J+I6JtYgdgz9dI4rT3lsCJhfN2SNvt49gb1eS0HI+mm96/HSWqxph9chgw3DCrxvsxftm6d2alCwhkVJjoMoQfhZUmP+Zmj44xt+xutoojynSKNAhRui0Pd2r0T80Iw0yQctgSz+Zkeijai3lo28+EO5wsA08kU180TrVx3NvY2WOQ4t3Bf+GckM7d1gOLzmtE6nbEkP984qirInogUPRnzzi8Ts3Wr9v0M0FJCKKMPPqHxYwfR4uGrIKTnleFw1RwouX7j/W+XHWVREzGNzRm6/M6eKxe0qDEIIv01DLrmVXTO1E/sCPM6dFsGYxQ2SMDbbx0xhrfAQU1C2T8+tibemKzLLbc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(396003)(346002)(366004)(136003)(66476007)(31686004)(66946007)(66556008)(478600001)(31696002)(86362001)(38100700002)(36756003)(8936002)(53546011)(956004)(2616005)(5660300002)(6486002)(26005)(6916009)(4326008)(7416002)(2906002)(186003)(8676002)(16576012)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVZzdGgxUXNTNzRwMlVEYXp0dnNXRkJTb0g4MDVNNTg1NHpqSFVQc25TajBz?=
 =?utf-8?B?SWNGbFBCNXAvencrUGRLUDJFNWErMVFLZFYvVmhiR1ZKcG5RS2JHR3dKc3dO?=
 =?utf-8?B?T0F0aWpIajlhTmNPKzRrSTNiQldBVG02cC9rNis3ZGRsRmlwcWh5elFDUC85?=
 =?utf-8?B?ZXVUdUlxVHhCSklPQjdzRUUwN2c2cUxVb21mNUZpS2EzTDNlSGIwMjk1Y2ZJ?=
 =?utf-8?B?RW1rOEw3SDhDd0NQTW9yMHAramtxMnBhVWw5TWZ5NEVmTGM2U1J3bUdOSDRw?=
 =?utf-8?B?b0RNdDlpNW54cHAvdEZyY29UZzRvTVNuNk92WW1JY2p3cUNydXBCN004MkZK?=
 =?utf-8?B?ajMyY0REbDc4czhwM3A0VDVPZW9ac2l5ZE9xN01rMkFHaHZOTHE1SlVySW5V?=
 =?utf-8?B?enV0WTY1NXlhTit3dlVoS093OUlaNlluZCtNUElPcXlWK2hsUzNiQTJYaVp1?=
 =?utf-8?B?TE5UeEc1MUh6eW5LS3B5WVJMcUluTkZYWUxUTGlhS0tQWU9kOHdWdmpiWVRZ?=
 =?utf-8?B?RUsrOTZ1cTZmREpqS2UxK3RzdkRYUDg3UGQzREVWWlE3cWM4c1NMcXdZL0cr?=
 =?utf-8?B?OVRZQUpwUHFMOTVONEdxek9PVlVUR0FOY0YydGViVVdDc3I3Uis0SVFsUzhr?=
 =?utf-8?B?UkJIMkZHQ3N3dHBXczFqSW0yUlBIQlFLV0lMZEVFV0NUK1NHRFphRHByNDVX?=
 =?utf-8?B?QkdnYXVxdHF6Tm5BWm9CdVlYVlVvWUhtT29tQ0poREo2YXRYVi95Y2IwQkt6?=
 =?utf-8?B?SWVpOWZ5RWJRQzd3NW50dzVPamxqa1c0YlJ4Y2tRUUNmM2lMcEh0YzdSWUk4?=
 =?utf-8?B?SFFJZlN1SngxbjBReUVuUEU3TlZsVUJqZVE4WWRKb0V5YlZzQmRMOGZRMzRs?=
 =?utf-8?B?U0FiOFhYTXBpT0NXWjRkaTZiUURDMnF4OUNxRFRlaE1DQVZROFl6TFJtZWRz?=
 =?utf-8?B?RWVSS0JDKzg5N05vV0F0OENDSWV0T0xYTFNCNXVpQVc0WGNGcGZSUTJoajN2?=
 =?utf-8?B?YmN3OFVVRkNnWWFCdVN2MkhLY09XMHUrUllrM2JtZHB2dnZNeTBoVjYxSXA1?=
 =?utf-8?B?aS9aSEQ1N0o4c1FZalBYei9RUXdBUVBjRUZvYTRidkIzcXdKaVhDMkJnOFZh?=
 =?utf-8?B?MHRxK1JNVHpSOTVQd3drb092NnN1L2NaN0Q2RDgyZGo5N3hpN01nMkFIV2Vs?=
 =?utf-8?B?RmN4SE54Z0g3OWtjSFArNDYyUmE2QklvaEcrWHFCN3JJNEZqb1lYR3JPb1Jr?=
 =?utf-8?B?dThWU005ZytZaGdiL1lvS3IrOEZ6NVFiaXBnODNOcnl5UVJ1TEhialVEb3lR?=
 =?utf-8?B?aGNZdndLMllEQXNjb3d1RWtQNWZIU01lQ0VwV0pwS2JaWGxRMXlKdVNoOWtk?=
 =?utf-8?B?M3hXTDdQUFdSeTZrZmpoRGZqTWprWGVTeXNGTnYwbmxjNW04L2FndkF5VUpp?=
 =?utf-8?B?SkJicmtTZnU5aFRhVEwvem1zK2pOcnlqNXhpdDRUazF5UXpuMnRvM2ZOMGJv?=
 =?utf-8?B?WU1rSVo5bEw1YWFaSFBmeVYzdmVxQW1sYmhZZmJvOXUzNDJHdnNoV1hwQS80?=
 =?utf-8?B?L1FnOG9jYlhyelE1V05VWGRLc3dUM2RQWlJYM2FDdHRHU3VzcUE3WWljNDFw?=
 =?utf-8?B?NXRWR3hmRzZtdkM3L0VuLzNkVkI1T0VGYnRvOG1BTGg2Z0poZ05EdVhWenlo?=
 =?utf-8?B?UThuVWczM2NIM25FTDBoZ2xqTXZrcHh1NTdmYWszVmZ6dU5NQ0ZCODhBaGF1?=
 =?utf-8?Q?NYPV1a2+Uc45k3TBa8NgQmnlnMNz/pzQsFEw+1G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dccb83ba-c2c2-48c4-af97-08d94212c652
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 13:17:45.6686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSEB5XaaEl6BRqten2LxTIyfYpdvYvSQC2Q7LYPWWYohUszU/Qk3pj2FDo/A3W+tSWm+NL+DvTWG6t+ub2Uu+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 14.05.2021 22:54, Daniel P. Smith wrote:
> --- a/xen/xsm/silo.c
> +++ b/xen/xsm/silo.c
> @@ -17,9 +17,11 @@
>   * You should have received a copy of the GNU General Public License along with
>   * this program; If not, see <http://www.gnu.org/licenses/>.
>   */
> -#define XSM_NO_WRAPPERS
> -#include <xsm/dummy.h>
>  
> +#include <xsm/xsm.h>
> +#include <xsm/roles.h>
> +
> +#define SILO_ALLOWED_ROLES ( XSM_DOM_SUPER | XSM_DEV_BACK )

Assuming XSM_DEV_BACK means (or at least may also mean) a backend outside
of Dom0 serving another domain's frontend, ...

> @@ -29,8 +31,10 @@ static bool silo_mode_dom_check(const struct domain *ldom,
>  {
>      const struct domain *currd = current->domain;
>  
> -    return (is_control_domain(currd) || is_control_domain(ldom) ||
> -            is_control_domain(rdom) || ldom == rdom);
> +    return ( currd->xsm_roles & SILO_ALLOWED_ROLES ||
> +            ldom->xsm_roles & SILO_ALLOWED_ROLES ||
> +            rdom->xsm_roles & SILO_ALLOWED_ROLES ||
> +            ldom == rdom );

... I don't think this is an appropriate conversion. Aiui a backend in
a driver domain is out of reach for a domain in SILO mode.

Jan


