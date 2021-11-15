Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D60AB450A59
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 17:58:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225991.390398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmfIy-00038p-6r; Mon, 15 Nov 2021 16:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225991.390398; Mon, 15 Nov 2021 16:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmfIy-00036F-35; Mon, 15 Nov 2021 16:58:04 +0000
Received: by outflank-mailman (input) for mailman id 225991;
 Mon, 15 Nov 2021 16:58:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmfIx-000369-DW
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 16:58:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31ba34d4-4635-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 17:58:02 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-HXi0Du19OMSEN2qxJZSDCQ-1; Mon, 15 Nov 2021 17:58:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6672.eurprd04.prod.outlook.com (2603:10a6:803:127::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 16:57:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 16:57:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0072.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.16 via Frontend Transport; Mon, 15 Nov 2021 16:57:58 +0000
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
X-Inumbo-ID: 31ba34d4-4635-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636995482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4FYFwjhBFFSIHbqFkVF8giP30sb9GLgqfB/tiJLWHCY=;
	b=LuQe2TdyUCElnDDMQx5Ql/0npR+vJGGROffSOwFA00sJfB5Mpi2C1Ai8r3jTMSCmd8tw2d
	8t5eRuFCW7YE2jRoT6CQoyNXn4GL+73k6h1haW2hWQQFM1bwxrIgThcZ00lfwvka9bYK6Y
	NuLT8/GckpEgTJovqP3rv6zzIt3I3IA=
X-MC-Unique: HXi0Du19OMSEN2qxJZSDCQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrpFVWU/de9LXi9jZ0g6lGzVAOLxCvZtpftC93Ck2wfYaPJUdKRSWDJcRpIdzpgBNt29DtR5ObtBRtJwS5KSuf7fdSNWj0cJ6zEc4I6p1dtYnCh67YjWXLfZiNoX+bOWwCKmLiyPou8uQVFwPUJtSKeLCRf0UQThxleNwXk4zgOn/oSYwX5+l2lURAy8tt+wKKHjNfXJP+7jCFuKjyKsbIiiwxQMh4lUQwLdMp+UIrR8iINMY4uerFo1xcIFRVE90ph+A9NZ1t/F8BaNf+e58nnhp291Gn7yvdHMIltrLBE8IhxZ5u1a7HUZWmHgAmQfajo1S+1HbJZN7oHJqqfkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FYFwjhBFFSIHbqFkVF8giP30sb9GLgqfB/tiJLWHCY=;
 b=Qz3pm2LjBCpNDq0vlEcrk61k/WqYNaAOhI6pGnDppcl4x/UrR9C2tN4yDIg2X8JE98+7ayCsZ7sgTuDfj1LKH+WR3LTUCC/EVsItwg0LV2Ja8LTAuqTlP2AVvIDmwFcZd4iN+fBDrnRPeZTEbeZx6Pdwg/0Y+DnY4Y7bN1QQfCCLPecxLvr37q68E2uu5ANSyD73KYNXGRivH/quSoCn4ZpQQTLvKUZ8CPQj+qigv5pXyVeP51vaTyi8VAo4WsAYa2Z8mMxJKOxK49byvfYXLRnJISjjA3oxaV7Re7881PoXSbdyXKmoMmoQhe+XVxA5LMggp5zKXKwZtJt5exYAzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <afd9fe9d-dd18-9a4b-e43a-f0ae8b2afcf9@suse.com>
Date: Mon, 15 Nov 2021 17:57:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 03/11] vpci: make vpci registers removal a dedicated
 function
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-4-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105065629.940943-4-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0072.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bbedf3c-aaf4-401b-caa8-08d9a85913cd
X-MS-TrafficTypeDiagnostic: VE1PR04MB6672:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66725B386B7BA19BDE004401B3989@VE1PR04MB6672.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7/x6qsjpDCD2oETDm9bzItvhnLiadOXX9DVdm6C97R0yJspX5kMz+g2U0IlUicX8W3mzSW7ZEJRloUROwhCebjLPRHXz2651z6uRWDeBuLND/Gp5Ti//pl7UFADNU1qEytxP4UHAvQRIL7QtGT7LHcNALS6cj4Ue8sLWgaA1/mRPPCOe2GOk+l2NVTgsdbytdtmtK+ZHZ05OYBrzpZPOT0efcp94z/gfngCYEKQNY3fEzIki4vFJM9kQkP4hY6vR2IXzc/9VTsdGEvSs09hONbfujNLztLulidnpTLgKeRuEqZadMTRBt4jWxsVrKBMc4Sol0ra5eb/TqRcA/QDlW6hyzOTflcGmGOx5+dXmPuNhdXozmBEzAiq9u1eTniHkE7zO+rkGPQV/VEd56O97UVGtxdmsAIsljtjN3/25L4QC0vjrV7/2GOhWCLFPNbaXc4ScTimoITUjWmpNjEfnhoNH/DN/y075iCLy5IlWqjIcXjk090pJCaqnXHXNo24AlExKJYv5NVzut/1SLlH41VzwzyCamMxVl7EaMHcDjx5+WGhJ0e51xkvl9H5aiC4TRJm596JQTq9SUsTNJG7IwX/z8kxS41fldOhIq/MFaGyayXj1VXl1MmZnj/P8LeVSEfVs3/ajbPlnOib70Qu1gACjQg5y8lNd+SZqE2QxqUU0BTZemoDnfr/zugi311DZ4LpFtC23tXnUgJ5W5gyjvDE1QMowbeBVdXj5/aTT1Gs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(26005)(4326008)(6916009)(66946007)(7416002)(36756003)(4744005)(31686004)(8676002)(31696002)(508600001)(38100700002)(2616005)(316002)(5660300002)(8936002)(956004)(6486002)(16576012)(86362001)(2906002)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1d4U1psZWUyV3FIVmlVYUNDVXo2NzJySnZzaEhsY0FXMWJJN3FwaUVYQ2Y3?=
 =?utf-8?B?SitUejZVVUord3JIZ05GbGIxVUlVd0tSdHAwbFBVL09EMWRPWjBndi96dXQ0?=
 =?utf-8?B?NENPUWtFNE1UcVJub2RxQWVTU21qYWRnR1VUenYzRG1kVGlDVU9aaGNtQnQ4?=
 =?utf-8?B?RkhMTHhDQXlHMzlxZUFXZXQ4VzBDb0JuSXg5R0JSNStFdTY4bXhObHA0dVU4?=
 =?utf-8?B?ZGZ0WkllNlUxZ2oxbTZnOENPWU1nL3dIMHprS2tHcDlxMjRKQW5CYnA5UTdi?=
 =?utf-8?B?dzRQYWM3Q3hpbm96Rkg5Nzl4dzhHTzNrK21CNGd2VFRNWFZpakpHTVpESElE?=
 =?utf-8?B?N0JYaXFzaFJTUnVzaFhkUHdKcEJJaFJQVWdaS3JXN0k4UVZCMlNGRUhRVUg4?=
 =?utf-8?B?NnZ5R0ErWVRyS2pKcEJvV2tzRGdERFBXSnZxR1JvMGw5K1I4SWdObGVZMFY5?=
 =?utf-8?B?Qmtpd1Q2RTRiWGJRTjZtaWxweHhKZkc5aWRjRnZDN1VQYWVvZndsQjNyamdi?=
 =?utf-8?B?aStZTEIwVmh5eGxNMU51TEJLS0hjZjRTcXRRTS9SS3FqellvRVZxZVZMR3pS?=
 =?utf-8?B?dWhxY0dwSXpJMXU2UE83THJUYkwwbG1NYXZVajhEWXZMcVdOTFB2QjNadzhq?=
 =?utf-8?B?d2N4WU4wWXpKaTY2a2duQ3czbEhFNUdGVXpaUmJyZ1pIUjZsckZUZVl2YTdk?=
 =?utf-8?B?Z1pOZDc1bFlGTU95U0p0WmtZQTdJbnFTR25NalBvU3V0N1F2NHBTVzJsQWNE?=
 =?utf-8?B?VERndmwxbStnaXVtNDZmNWNuV1FnaHBwblhuVUY4enNGNEpRR2g2N24wS1J2?=
 =?utf-8?B?aUFJZGlXekxKMVJXZ3FpZ2lVelpNOW96Mks4UVJhTnIvK2FOZTFuNWZaaWE0?=
 =?utf-8?B?OGtyZjkvOWgvNDRjaTRyYXNMN1lGQnkralFPdEVIWTJDR1lGVitiK2ZrcEZv?=
 =?utf-8?B?MThLVElMQlNTdzFTV0tsVjNvVStjK2pkNmVXK1J4TkJyMk1LcHNQd0h5amgx?=
 =?utf-8?B?UXRZcXpROTIycXcwNC9FTmZmTDRHSXBwMEg4cGc5dkFsUitsdGJIWEFPczZS?=
 =?utf-8?B?MmJaWjJHT2xOQVY2NEQzSXdNRllQRzA3SHpzUHpRSmNZbmdsb3ovSGZNV2p0?=
 =?utf-8?B?QnJrbGo0SG0vc2RVajV6TnBKMjdYSUZKT3BFSkJ5S2RnTG9EMTR2U2g2dk5E?=
 =?utf-8?B?RnRnaHZKS1M3RTJBR1VvcFFPa0ZSWHpWWkl5MHpRL3R1VVIyck85U0VRUlo0?=
 =?utf-8?B?Z0FrOHFjM2QwTiszV2owNWpkWGZQMXIybkV5MkgzK2tFMWlVcDNhcGVSZzlr?=
 =?utf-8?B?Ykh0b1o2andDZkRwbEkrMVBTcUMxSzRNdHAxR2EycGVyQXJCdWNKSHRZR2tq?=
 =?utf-8?B?dE9PdGNHMk10QW1XTHA3RmY4Tm0ycUhsNU9LS2pWVXhTS0k3NGVCajhDbnpm?=
 =?utf-8?B?YzVCTkZVTGEySmdtYVBOZXVkVS9uaWI2NUZ5T1NicUt1NWUyaXdDZlRIQ3dG?=
 =?utf-8?B?d1JnQ29KMWVMbkg3ZVJWNUhKUVhTUU9ab1ZPeC9zNElTL2swOStmdmpsZFQw?=
 =?utf-8?B?dWFsUzVSbmVxTE5UMkpLSDRTaWNpbDRPWVMwamkvRDNFWFVxL0srNTR6ODZz?=
 =?utf-8?B?dFpJbFcxaTh0NHpWS1NpYmY5UTB4Yk5kdUNQVzBjV0R2ekRYVE4xeFNHMEt0?=
 =?utf-8?B?YTlTOEtkNGZOZ3B0OHVDYm5GRWg4S0gvUFZMcmVmYmxUQ0FHbVFGM3dVV2ZL?=
 =?utf-8?B?Q0ppTGlhS0lMVlFRSU05ajZnaFhxQUx4N25OalQ0TkhONTQxNnd5U200U3g0?=
 =?utf-8?B?WCtkaFFNVlpjSmlNeXcvRG9qbFYwSTIwaXF3RUFsUHVMS1RVbHRHMmhhVnZK?=
 =?utf-8?B?RGVEanV5NndoOTltUVljd2h3LzY4Rnlid3RDVUNqOXV4eURpSFhKclp5cW5U?=
 =?utf-8?B?M1NqM0Z4MlN4RmV1cTByb3I0b1hhbC9nd3hkZWxOcHdHRzB6U1Q4MW1ENWRp?=
 =?utf-8?B?bmhWSzNiSVd6d2g3TVFQUmNaekZ0TUgvZ1NRY0dINDNXUHNWS1E1TTd6aFZN?=
 =?utf-8?B?cHBrZDArRDVJYnZwQTVWcmJDdlBtVXdMb2ZMWHp2SVh6OUFSem9wYlJRQlY4?=
 =?utf-8?B?aXJMSmhjK1RzNm9mdHgyUVlmeVpHMDJKK2Z0dFFSbDNTc3VHTERyUHQ1ZU4v?=
 =?utf-8?Q?LgPX893icvBAAbmSLlm1WpE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bbedf3c-aaf4-401b-caa8-08d9a85913cd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 16:57:58.9044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDBFJBhKAmKaDjWHUdSuN6UgSFNJO9AUnQ5l9SRKgEtfi8xfLA9/2YvONMJrjLvAHo/M4HXbU4fkT+cIigqyPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6672

On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> This is in preparation for dynamic assignment of the vpci register
> handlers depending on the domain: hwdom or guest.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v3:
> - remove all R-b's due to changes
> - s/vpci_remove_device_registers/vpci_remove_device_handlers

Should this maybe extend to the title then?

Jan


