Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4A642A123
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 11:32:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206985.362689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maE8y-0007tC-Do; Tue, 12 Oct 2021 09:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206985.362689; Tue, 12 Oct 2021 09:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maE8y-0007qR-Ar; Tue, 12 Oct 2021 09:32:20 +0000
Received: by outflank-mailman (input) for mailman id 206985;
 Tue, 12 Oct 2021 09:32:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maE8x-0007qL-6D
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 09:32:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a3f40d8-2b3f-11ec-811d-12813bfff9fa;
 Tue, 12 Oct 2021 09:32:17 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-B6IKL9ulMh-ep-neVQWUHg-1; Tue, 12 Oct 2021 11:32:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6174.eurprd04.prod.outlook.com (2603:10a6:803:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 09:32:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 09:32:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.24 via Frontend Transport; Tue, 12 Oct 2021 09:32:13 +0000
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
X-Inumbo-ID: 4a3f40d8-2b3f-11ec-811d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634031136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WxUYejhFFr4hBbGUrgNeoZxFCqMl2FOkZil4sMYsVEs=;
	b=X0kRJpOPJHFhs9lm0SPOIIAhl3G0LTQE7suyV3/Om94G42+AWBma6qSpn5aUDmAkvMxfP4
	K4D6B8MbrNgLnNo+pL/9nv4szxN5t4p8Hy5GzKEY4RQF444grcXF6j0pK76n9zaZ7PKiEa
	aR4Xf4EWA0ksSzuazZ8whdZBJS+loh4=
X-MC-Unique: B6IKL9ulMh-ep-neVQWUHg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqG2KDlIA8x3e6SbDjfNXKLEE8GxlA+3BosiRivCrWQwHf1kZrLE4pGJ+10M8KdmLjbaBQkrNcb7QPIn6IcLndRR3oVJd7KywRHeHf30T6TnYHG6GcvXWGoetDpVoZ9M0nL7NgW0+8/FEDOG1+DDmo/fY54HcdT//XvRO+vc0LaLavgos3XqRF4H3GeVeHsPaVL8WMwmprQ3x3rlFrWgFth9jV/PQIau71h7pXJc1NBh3Mh/XT7z7oBV77Jqm7dDKsOLBOQ1L7CiwJSFDRc8Q0yAwlhpS8hA9AvsLOKlUmz5vvZxy+2iaH2cRe5KHziJXNdSJbprcktC83sjwd6R/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDaryNORZQ99VMa9lIXzCL05ed6AFy1YIHp50Rl0NkU=;
 b=Bc7sn50viJ3Wyjf44jeqeByQp2RI2CsbtqkDz1zaysaE6Kd+AvEvOITQlhXSWpVPx8ODSlaJ1vDSFXJBUXMhqyrwv4lgkKEH3q8CWAkQmbXrbeIC7oKOZAgDlUE74uJcztd+OJ8WfwqKOt8FzRpDOluPGveWwxMZU35AMmkmvnXMuFTP9dszzPcq/+i5PGMQvbBHAZR9bmXJgIrQme9z0lHU95Hyg1XSSA+SuczAFVaGUf5LcFhQ+qYDdk1lgf0xlPNHgFSgaLmU+xdDBU/u6Ox+SGBxaSYhD/WBwy3E3TRa2/PBaFkHH5mdEQjvBNs/C9ef+1Fd80gmWDiwPUCP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Rahul Singh <Rahul.Singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andre Przywara <Andre.Przywara@arm.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
 <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
 <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
 <YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
 <FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com>
 <YWRnMfAi808TQ4Gt@MacBook-Air-de-Roger.local>
 <EB1CB53B-9D5A-49C5-A687-841BF94A153F@arm.com>
 <ac6d4785-ac9a-4491-26bb-c66ffe82c55b@suse.com>
 <ED8FC92F-B5EF-4473-B4A9-641C7D44859F@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
Date: Tue, 12 Oct 2021 11:32:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <ED8FC92F-B5EF-4473-B4A9-641C7D44859F@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0019.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cb2c9e5-a8f5-441b-f564-08d98d632c85
X-MS-TrafficTypeDiagnostic: VI1PR04MB6174:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB617421FD1B1B024A1B8ACF3BB3B69@VI1PR04MB6174.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QKI080VSScWtsJGVTeATtgJOpwAnO+HvFwtDTblcv35c72TQFzOg6pUwA58GZbK231mleY2ZGMHtqu38AvJ+B9Vs6cTi40IhVfscKdm7TFBVK4G9h4QaJh7aCJ79C4+nh5yRYvJuh0dPsZeNJeg6JfBPgolZVpZx5rpFyGU9OA8KI1T8/bYEJ5iyPNWtA3sdC9KhCY+CgJs3azoQaNocvm/sN5tRU1kBWNkz87RjKITczzZ+iXXo/zZiFPxW0/OmnxmKP/p68Ob/akK0BRJZAO9hE78fvi6CDrBMlIN1mJtquZ1Gme1jI+eDewgGXMb6P+8th50DBCBQe5QcfYn6E+i3k3Ho5E18/VKR59gE9/uMO8DKPqwOKADSf6UFLj3a5zGD52jBhddj0EYIDIJ2qM+D5/iP0iWBAtPfm9mP3gnqUmfpCZJB6i4pwG6sgol0bdwOfqD8WkZxF7YtNKb09reiJMpSIGYu5wFs+L62np/tnNQF957Jgz1LE6CfAbZ2gzsFi6EWbXPcILlwCP5Fkw5u1kCoSaQ1vSo7a/xVy/SEy/6TtU4TkyEo37TEHcWneND50gnOUYndx2B5jBbNmoDplWeIeHmPH90v10ldzi0az8OPCd0SeYyE4Xy6QGTCh79/IjjKB6zVyjvbiiKA8OakmZZouKjMsK9aKI5nSbrKHgVvLWHQw/Q0ZsJ8v/H7B3JpMs7bBlrcg+7UkexyeA1ea36tL8cSfpMPe7cUU3JZiIK43R3BOrNdARgsDCp7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(8936002)(83380400001)(6486002)(36756003)(4326008)(5660300002)(186003)(26005)(31686004)(54906003)(508600001)(66556008)(66476007)(2906002)(66946007)(16576012)(6916009)(316002)(38100700002)(2616005)(8676002)(956004)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FlAxs33G2XRnzFiW5UwCnezDI9dzXm7yTBUTkJhmONTJRO5ZrFAPuB6f4iGj?=
 =?us-ascii?Q?Gb4Jf6PpSV8Q74JIVrFRS6kOtk+xOsg1S/oTakcbenLi+q13+SbfaX6RTDkf?=
 =?us-ascii?Q?AHO8K4citaX5NoQdrfydHzP+7sz3m+KtL6Tnvx/eyNawyHyFQWoOG5Se3953?=
 =?us-ascii?Q?CntzHFXU0+FmQdjY/7YtJNUQ4P600IW61W2hGlX2gfSgGwtUJnXIt4OaKi3z?=
 =?us-ascii?Q?CpzvELXPr3dNlIP5bZFbYGv0/PUVh++hqevjzA89vF3Bc+0Z7pZ1rFHQDIQU?=
 =?us-ascii?Q?xxvwWj9mKEQnLSytBZi4t3qneM331HesaKhhaIl3ibtkOo5xZLQHeSz9OFgA?=
 =?us-ascii?Q?txVmmhsCHxzqCaqvixVAcymbvwXveCK9nZxA9gnecWzj90WGcTU2on1Gw0/X?=
 =?us-ascii?Q?OOwppaxnFdnv5nR+el1xt0xaaDW1wGvMbpvIfS8Q59Xrpz+BgOBPu6XHe09K?=
 =?us-ascii?Q?j0Rk/bs6rI952F+hephtvCO7lb8w3E5J9ZL37J5szyoYLzZB+AbbZxOpqupy?=
 =?us-ascii?Q?37TOYHsIZ7+aGfwQJUHXkZu4Io9uJsc32T9xfEes5ZjIE+jMd99AN1q6j441?=
 =?us-ascii?Q?Af1td6qH5gJSVoY234XUuVBglLR2BqufnQ+FJ373A0BUlsZzRGvIlVHeiLSH?=
 =?us-ascii?Q?BkNoUaB/jXrIi/ruu9kvTC+hH5mfSHc9DXP1dL3feEJMbBoSIrl3GhwuriV1?=
 =?us-ascii?Q?fMypVBnDI7jetCXTx+i2rBDFdeU77uYncJfABzmOTnt5HcBAhyZoo1y4DIip?=
 =?us-ascii?Q?KNmi4UJD7DsbfeSpBvYCDo19D2DSnmHwX7ZmKw6rxElNLan9Pvk7AMtGyzqc?=
 =?us-ascii?Q?g4UnaNxgYfW2f0jtZs7aTheGzMQ8jpdx42562pgkfsDE5iRk182A6UNqT/u0?=
 =?us-ascii?Q?hDTY7vbyo/qk8qrG+lLvaWaDrMuIZVifxtMNHotbcFd61Wjj0V13dsSQVjDh?=
 =?us-ascii?Q?FU4s6JL3Y1eh4BtA2W9vJnRfQ0fSoCyuDNCiiIqpwH9PdP+5M7x9GHG3/yG0?=
 =?us-ascii?Q?Up4UDKppIkcL3NHM+rAmJYZ9g46h2OGapzsxvCCKTtKi/4TXugCiC/RNwUlc?=
 =?us-ascii?Q?vrtkmkhUVC4PVQ3AAzEvEpqRE6X6EYqxu+4NZibvCCKERd7Gm1DfKBRUr1pj?=
 =?us-ascii?Q?eonjbcaeS2tIjg7hxnazrBQj/QnaiIeSEbufypvrSrqPiXQHoLUfzURm2kOT?=
 =?us-ascii?Q?RfCRp5AhoYY774ix7ULQC1g8yOerX9dfTryCCnXYZ9sOE/BxJF02Mfc2puqm?=
 =?us-ascii?Q?FsVBlbDGEEQen75NLiGeoP8tTisBQjUEcDWWCc/ocro97JU9TI2QmHb/YWkr?=
 =?us-ascii?Q?AArivnZkYuyIdmwPi4QKzltQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb2c9e5-a8f5-441b-f564-08d98d632c85
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:32:13.9110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMVgBm48g5mcys6V/AMc4tjYtlsXUEqlZFk3F2ojpxgVSZDM9Zx1ZEEfv+JjAGoixLG09OVmgmP0dGKWzFWo6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6174

On 12.10.2021 10:41, Bertrand Marquis wrote:
> Hi Jan,
>=20
>> On 12 Oct 2021, at 09:29, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 11.10.2021 19:11, Bertrand Marquis wrote:
>>>> On 11 Oct 2021, at 17:32, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>>>> On Mon, Oct 11, 2021 at 02:16:19PM +0000, Bertrand Marquis wrote:
>>>>>> On 11 Oct 2021, at 14:57, Roger Pau Monn=C3=A9 <roger.pau@citrix.com=
> wrote:
>>>>>> I think the commit message needs to at least be expanded in order to
>>>>>> contain the information provided here. It might also be helpful to
>>>>>> figure out whether we would have to handle IO port accesses in the
>>>>>> future on Arm, or if it's fine to just ignore them.
>>>>>
>>>>> All our investigations and tests have been done without supporting it
>>>>> without any issues so this is not a critical feature (most devices ca=
n
>>>>> be operated without using the I/O ports).
>>>>
>>>> IMO we should let the users know they attempted to use a device with
>>>> BARs in the IO space, and that those BARs won't be accessible which
>>>> could make the device not function as expected.
>>>>
>>>> Do you think it would be reasonable to attempt the hypercall on Arm
>>>> also, and in case of error (on Arm) just print a warning message and
>>>> continue operations as normal?
>>>
>>> I think this would lead to a warning printed on lots of devices where i=
n
>>> fact there would be no issues.
>>>
>>> If this is an issue for a device driver because it cannot operate witho=
ut
>>> I/O ports, this will be raised by the driver inside the guest.
>>
>> On what basis would the driver complain? The kernel might know of
>> the MMIO equivalent for ports, and hence might allow the driver
>> to properly obtain whatever is needed to later access the ports.
>> Just that the port accesses then wouldn't work (possibly crashing
>> the guest, or making it otherwise misbehave).
>=20
> As ECAM and Arm does not support I/O ports, a driver requesting access
> to them would get an error back.
> So in practice it is not possible to try to access the ioports as there i=
s no
> way on arm to use them (no instructions).
>=20
> A driver could misbehave by ignoring the fact that ioports are not there =
but
> I am not quite sure how we could solve that as it would be a bug in the d=
river.

The minimal thing I'd suggest (or maybe you're doing this already)
would be to expose such BARs to the guest as r/o zero, rather than
letting their port nature "shine through".

Jan


