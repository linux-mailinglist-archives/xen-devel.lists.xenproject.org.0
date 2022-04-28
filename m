Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E54DD512D7D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 09:55:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316103.534865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njz02-0006iC-3z; Thu, 28 Apr 2022 07:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316103.534865; Thu, 28 Apr 2022 07:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njz02-0006fu-0c; Thu, 28 Apr 2022 07:55:42 +0000
Received: by outflank-mailman (input) for mailman id 316103;
 Thu, 28 Apr 2022 07:55:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njz00-0006fg-NG
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 07:55:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9885504a-c6c8-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 09:55:39 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-ULQB8c2APby272BHF4BDWw-1; Thu, 28 Apr 2022 09:55:37 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB4592.eurprd04.prod.outlook.com (2603:10a6:803:75::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 07:55:35 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 07:55:34 +0000
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
X-Inumbo-ID: 9885504a-c6c8-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651132539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UH3WRMXNzMgz6xBZXjnATnCw0a/JPuWXgxwv0LToAC0=;
	b=WR+SCO8SSOBLXMbUhHBOcsiisqCeYUA0jMm4s2hM6frwNwJSfeoLbxtv9vT7v9OQ2WfAnd
	a5S2l8x4C0YqRZnGMPnFP1JzNTcB928jipzKWPzBsTmAtdx/IKA9698R/aqeFDsGKuRyB3
	viyhrQv8Vx3V5R2go+pOcM2INZdukaQ=
X-MC-Unique: ULQB8c2APby272BHF4BDWw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdGsRI4Dds1FoCQ7Y66yQ+U0jNjMFRn9hFOLHjLTAWia2vxQWKQevSvzrWoEJKKoZuVPMfhWZuYj2Ak0ghYZcBAsCnRRPI0Pzb5rdbtR6n0cLzgBr4f5wIufH65vH7NNOSQhFP/PrBA/35jL3tL09AwZ/xQRga2Fo3dnTmq1Zcu0pjSLc5OHbZ99WC973vYeatI1VujvO7ShxjoNN8JtgizpsMRc+5MmZVWIH4TvkajmY+lbkOv6ZeuYob9e3eHPlCriykhz1y9vFY+XSXxi76VFlgJXvlat60eLeegoVSsM6CeZk/kr9v6fH5WFepfRi3V4IOlU1oZv5LF4i5bfbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UH3WRMXNzMgz6xBZXjnATnCw0a/JPuWXgxwv0LToAC0=;
 b=iJ3EFg1zQaIrfsX0L6GsXL/44KZCRaIXpZcIMDBkOXvgXXAW741nEEhgKOdSz8NuPMQ80k3sEzpLe6mC0MCxEjDoN6Y/qZjHeJgE9KR8KyhNB9QFTpIKBbjlt/QyTX0kkVKe1XSCjhwqWk0yoGC+zwGveehNFUBdbAVG2TYPKiL8m7s7pZBsp/buNQCjnZB09t4dct/DU059nRZJrTAneX+bnxCLMLtyUyZv8wU3h4l5TbKwZsjHNDIr2TScHq/lWi94MqhvSo6SojjMkaOlPLAoobX5JR+IqMI4ZB60gcDlG/dJH00mK30fOBnrwzppxMkB/fYJtBSwPTfhwX9lVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d0347cdf-046e-594c-80df-03b23d381d8e@suse.com>
Date: Thu, 28 Apr 2022 09:55:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] x86/msr: handle reads to MSR_P5_MC_ADDR
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Steffen Einsle <einsle@phptrix.de>, xen-devel@lists.xenproject.org
References: <20220427154701.84315-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220427154701.84315-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0062.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::39) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28a994bd-d6a6-4026-bbc7-08da28ec79bb
X-MS-TrafficTypeDiagnostic: VI1PR04MB4592:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4592A4E8047B323F0E80175BB3FD9@VI1PR04MB4592.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mhz3r71iovSAA1CjnrCQeXpabkjpz4pZuVMZD9UOCl+PrrVtiO17GVmWb/GQ+L/TEB8kYDhG+kvV0sFIRdET7bL4YVIR/aoO6sFcTjjfX1znBdwxdW07VPkQAZzi0kFvFya/NVLMMzeCs2tCs57FksH5NBux7YLi2hF+2YUSqknYEtydvX2i/hobBeZ+1dE/7xom9wxo+Z5XHs3uvrwskBz4FmEMO6RnhHWwPYA36sT1Sgpav0QtYQYy9bwHct/KJxML/dSi3NBSeNlHWUtHx239o0D1KusgOtEvOUlbFCbm6xdYRrRrZYKxT8NuuixZIyhQkyWJDPonSHyqaxTx5a0T88Xs8GCO8YNCxPMxMsBiuGA9eDYTk3WjIgn2uBqQ8DwJquWZ7OrIc8gkONBWnkKDrBxC5A4gldiFdzekhSEYZNbjYgmHh5gtizTFAI6RmgfOejA+B8Njnsmg+JguC6BQKsadkomdnjxBNjicp+EAxgbJJ1VQHSIqQbmpQVyRZMhP/w7lXCZc3BimD0UV37eeYk/W7//BGDeJfje186C4zxYmVy6UsCuNN1Wqg9gFkgFHXOZQJDiDeuqa7q8Yhkkxe5EksLwas2ox02vFuMfZwt9RK/U2bOCsoVeDqg0vFrzy6lwOImwXVq/GJgthU0rE7BQ9KBV70X1Mm+153fq5A3RN6f8bqs7rSm+sMQ2tzBT592h6meFOZK+kSFWJsXviVlvR9XDRphAk/fRo4mE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4744005)(8936002)(8676002)(5660300002)(316002)(6916009)(54906003)(36756003)(6486002)(26005)(6512007)(53546011)(6506007)(508600001)(31686004)(2906002)(66946007)(66556008)(66476007)(186003)(2616005)(86362001)(38100700002)(31696002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmMxNDhtNFBXOGUrcFdXL3FlRGprcDFTMFZ0b2ErcE5zaE5OZ1I5UUtsdDEr?=
 =?utf-8?B?bVp4RnpkTHFYbHAydUFOQmpuNjhIN2xjUHBjRzZJZUMra3ZITDVnUXAwYmtP?=
 =?utf-8?B?ZHJCaUxmL2JxbHFlU0RWbk1hU1NnQmZkUzVvRHVFelEvYk1wQTZmSHZMZzBX?=
 =?utf-8?B?OUtZN2R0TEk2cWhlVzFRNXpUMzY3d0k4NmFOM1BhR083Mk9wZ1NuOUZqaGZT?=
 =?utf-8?B?QmE0bkt5V1JNdXV2cWxCVVIrRWI1eHpvT080K2QyaU5GRXBQOFNqclVhNWJx?=
 =?utf-8?B?VVJ5ZVd1MTEzQ0dsUmg5UFBqazZEaU5BZ1ZZUnlwTlhhV0cwejBqR1FjaDFS?=
 =?utf-8?B?dzhFaVF4ZXV1cWphci82T21kRVFZbG5uQWVYZUdqMzl5SG83QjJUSWgwWUJ1?=
 =?utf-8?B?d1M1NXlmZXc2WTNvVkNHMGJwNjRYVitKZy9JaUgyMWVHb0xxTW9GdnlmdmpJ?=
 =?utf-8?B?eUhXS2ZGdHZSR3dIbXAzM3pwZEs0TnEwVGhnOE9tRFVteUFtQ2pmOTB1S2Qy?=
 =?utf-8?B?Z3VrTnF2MU10UjV0ZFJvNHdWejVnU2U5elduNlBnUjIvK3RuWGxKZ2FTb1hV?=
 =?utf-8?B?elZnU2NCRXM5M2pEOWFxVmkxem5qV0QwRHhRdjhwT1RWck0rQWY3V0hIdDFa?=
 =?utf-8?B?Smk1RXF6QmM1M1FXQzJSZlR5K0EwR3F6dGVaMnZMcWtmSjhPTE5VZm1WOUI4?=
 =?utf-8?B?aXcwL254MHlHdWFVMW41TXREeUx2RzRNZUc3WmF6eldvY2xrZ2NaRENBemVT?=
 =?utf-8?B?dm9ta3VhWjcrWVloWXJJeTBlNzkyYzFxYXBWVHY5MWQrV29QK3ZkeUNLMlh4?=
 =?utf-8?B?alJwRllLcSs5VGw4VXQ0MGlWa2NJb1J2N3F3KzJnS0U4YTVxNzVQbFY1aWNC?=
 =?utf-8?B?UEZlL05FUVBqQ2w4cFE3RmZKL3BEYXYrUEMyUzhsZWZsNmMraDRzODJ6WWZw?=
 =?utf-8?B?SnlyQTNuazNBZ2JqakhuNDVaMm9GQ1JZeXhwd1JoTHJkN29RdXRsV3hkQ0xa?=
 =?utf-8?B?blBBS2hNbFlncXlSZ3RrdlZySm1Lckx6alF3MFFuR0grUnhvT0luVWRnK2Zy?=
 =?utf-8?B?TWlKRXhhUmE0UmI2OUVVYlpnUlViMytLNXBGdy80c253SzFmK3hVbFdGcUJJ?=
 =?utf-8?B?MCtrL0F0cHRaNU5jVGN3cy9RemUrZ1VmRUFhU0d1enNsa1R4OHRoNkl3T3pt?=
 =?utf-8?B?c3cvVC84bkEzSWZneHNQdXZCbVRPNXBjTWFZR2lYTDdPSnZVb3UzUkpWN1M5?=
 =?utf-8?B?QldYQXpOMitQUERQTmNNQ1Q2SVBGaFR4eGlxRElUNzhsWXZXVG1VMHBpUUJJ?=
 =?utf-8?B?US9abEhZZEk4cHhRZEVTaDRobnRVR2VydGM2M2ljYmwxVmhSNHZnaS8vOE5j?=
 =?utf-8?B?bldPaG5uSktjQnhQMTlhNkFrMHhCR29XVTgvUDI5WW5RR0FlN2FML3pKbHMr?=
 =?utf-8?B?dEdQMjArZklBd0RLazZpTm5ORWQ0Y0twL3kxcmpsc1RtcDBweXE3ZVkybll6?=
 =?utf-8?B?cFk2WEhVSDJROEw4ek4vVTd4UVhON3BOdVVZbysyaWIwOGNMRWt6SnF5Q1ls?=
 =?utf-8?B?YkpveUQvZEpVV1hZdENMSGtaRUZjenVCaXNzd2U5UWtCbW9nUC9jTzUzRS9o?=
 =?utf-8?B?Q2l1TkxmKzhaem9nM0lpMUxCemRHdC8wb1hTbEZnWHl5ckpteXMvUFhET3ZG?=
 =?utf-8?B?UGEyckRqck1UQ2NudGliY3EzMTBrZERiY0lHZDNpUjlxaWhrMkR1dmJmRG9I?=
 =?utf-8?B?V0dPUFlHYXZhREZNYW9LWDdKOHpmZ0pza2J5cUtqUDhmdW9GNWFaQzhDSi8y?=
 =?utf-8?B?RE1UZytrWktkeXI2N0NSNC90cDZKWG5wMGxaVzZwdWZSV3h3Rzk4QmpENGc2?=
 =?utf-8?B?NklMd2lmRWh3ZDFqWkRKZ0xUcGZqcUp0aEFSakZjUG01cEY5ZVlJV0ZsMXNB?=
 =?utf-8?B?aFpUL3p4dUd6NXpzQy9XNWZOWXJWT0YvaWd4V2VOMnhpSXhaRnpqaWpkazda?=
 =?utf-8?B?SXIvK1p0dkl5Q1UrTDJDVzNzN1pSUlFDaXM5ZDVHelV0SzRVZGR2dVVFa2dX?=
 =?utf-8?B?Vm1QSjNYZmhXUEJGeUtBSGpiUkkzVUhTME54WlY2blF0NkZnUWxEWUFYUUJ1?=
 =?utf-8?B?N3BsK042WDdvaytQQWVnUThuT2pqSGZMaktaenpSQkY4ZTlzQ1d6dHZjUjJV?=
 =?utf-8?B?YjhnV2RxbXZEc3VFSERUMi9nZ25TRE1xNFZZeTNCODZHUzBYS3hCY3lEaHM0?=
 =?utf-8?B?RnFZQnNmMEpNKzFYUFd1V2lURGxxQjlzSmNScXdPNmhmQUZLbGxQT2RpYXAy?=
 =?utf-8?B?QzJnc3NVSEJZZHJwR1B3YjVXdEFVTEpYcHdoWlB0MkdjMDQvS2RiQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a994bd-d6a6-4026-bbc7-08da28ec79bb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 07:55:34.8598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w514Blx3Z+8zmfaEW9jx5fgH1fH52fJauy/dOPR7OlcpkrH0FCknQ6OJzqq4xEx7CT83P8ksqsuhS0thEyLkkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4592

On 27.04.2022 17:47, Roger Pau Monne wrote:
> I've added it for CENTAUR and SHANGHAI because the MSR is there since
> Pentium, so likely to be implemented by those vendors also, but have
> no way to check.

I think that's fine.

> I wonder how long it will take for Windows to also start poking at
> MSR_IA32_MC0_ADDR or other MCE related registers.  For now this seems
> to be enough.

Those are handled by vmce_{rd,wr}msr(), aren't they? As a result I
wonder whether the MSR in question as well as its companion
P5_MC_TYPE wouldn't better also be handled (faked) there. (Even if
not, I don't think we should handle ADDR by not TYPE.)

Jan


