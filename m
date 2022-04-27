Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD8D5113F0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 10:57:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314583.532711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdTW-0004Aq-3L; Wed, 27 Apr 2022 08:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314583.532711; Wed, 27 Apr 2022 08:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdTV-000484-W0; Wed, 27 Apr 2022 08:56:41 +0000
Received: by outflank-mailman (input) for mailman id 314583;
 Wed, 27 Apr 2022 08:56:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njdTU-00047y-MD
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 08:56:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f382204f-c607-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 10:56:39 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-tPPjMRP9Pju0xuilONgCQA-1; Wed, 27 Apr 2022 10:56:37 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB5073.eurprd04.prod.outlook.com (2603:10a6:208:c9::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 08:56:36 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 08:56:36 +0000
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
X-Inumbo-ID: f382204f-c607-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651049799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJgAgIyE6IlrZhdygWFn95C0pk/xjUHBEyq+DZ54MXk=;
	b=NKB/gsrSGGZdVpBR3Z9RdUX1YWPKSJE/Ai1a2MLow09Gy2OJL7kpFbO4sPSwjziDCkGddT
	3LDD21OPxK5tJswCjS5smIix4zb5OyaTUyHhZ0mTwP/Srsn86iEvpI3ja4vlaJvYNphmDS
	TEdl74JIf93ronPvn0eJJD+rYjkAXZY=
X-MC-Unique: tPPjMRP9Pju0xuilONgCQA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCxXrY3GClAJp5Nb0zrLSy5WOoiFLpiCN9ayP3WqmUEjRY74aX8XfAxy+p0kjmR7SsGfy5hoVwJbpDI5AgIkV0gaLkyHhbaw3NlipZDNtQPdCx4Orb/VSu4lazXa9Rx2AvOAbaQVfQXbfqxLtJe8VOe2Idinvvma9nYryzhPxfnpr7VLfhtVcT/GpV8qAkMbRGDkFnCMzg7gbTn7bnSLuLxcY+0v/BM8ObuEu72jUS1iAZXAkiIVBCw2I9k43DDQSDe7WeYPZi+6CEYSzDz2oxmtEemuoK7y+7GlMaRQElhaR7ErFiVRMa4JNC3RbGLxbQfzDVYYySQNXBdwwE91iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJgAgIyE6IlrZhdygWFn95C0pk/xjUHBEyq+DZ54MXk=;
 b=X9pM+IBRF7beYmeZY6eG6sKQiSRadjkKb/EMmVckHGgv3ydBJt9vEzbTRXN1+R/VZFcjwfDLRLl8eWifc3QXcAcgrZI8V7Siqbw4MLCTjBUGkdDSMDWlSywZjxcHQXSZfaJf5QtQbq9NhVoZH6V0I2wHIuZIwL+1krzPBQJpMEdL1gxFVbGMeAh33tsxSxdt3fwYFhqhqXhZAiJB1vGvgddBJjNXpOiLkYb0HAgL6et4lvAPEFnvBEilV9G9229mWkJGLp1VgJHD6V1HbC9piFFsMWHViXnNbFO+uZxBDnnvKFhDEjs3zYT9kYwxlmMSCMUfOZEValqGktxq0SN5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3591eec7-1299-8783-26ad-ffe27bb9fdcd@suse.com>
Date: Wed, 27 Apr 2022 10:56:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 3/4] Add a new hypercall to get the ESRT
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <Yl7aC2a+TtOaFtqZ@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yl7aC2a+TtOaFtqZ@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0311.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::8) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1ff8997-821f-458d-90a9-08da282bd5a6
X-MS-TrafficTypeDiagnostic: AM0PR04MB5073:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB50734320D0F6ECF626147CAFB3FA9@AM0PR04MB5073.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	67CsV9Wd0oJD2AXNHBlpBqsGHXiSTyTq4jRb9mwVWC1NJg9clW1ItEjZ08Em4Alkcm/xkJfr+8SGfwwB8BYA6fCFkHQvl1UAfE4awQyWVaeZt4tu8nMYH2KLdZlHeGO+bLVD00KwPEM8zznp8TvnUIsQb0UNv7EuV6aGt90PRm4OOfD4efIFMr57j7SgSVc36Dk81MynZZO12/M3gE0HaYdt/mVQ3DLZD8iHEVYeM0p7mr3ixls8mdN6D7aK+N4Re51P8R+krVuO9RQezy3DoDvSYcyUrHOtYsz90FOml0jAOlQLQFbdTZBnMOtUuiwVluPZYKA9SR94ozjET1y0Iktu61ptM+qdhrfk13cRZMIiLulIvkJhH9S+htTnNv0H+PuoX77O/IDPA38Zi21aD/TiZ0kDvxX8r5dfz2TT2wUZQwKf8HvWMMrZYfSVBH4Z12gbfV+ROlvhGg7rY9DgPYbDDLPMoazBDR2UipN6c7C2xe8pSfnqCvWaYNt0Aqdw3caz0YPgTp6tY++46v2M4Fr5eYrxJC09ouqgl8LEtJHAXJlrE96N9lyLC1XpFcL1EBMvOp4x/wUJ9cfqVIYGlZOjnLEleItjVw05v9A4q7LoTfMxUFJOXdo/Q6+zBAue8g5vekXOuYE8f07k7BB8g8cf111kPJxmRTdNoGc6XAPF4+iwC2/DeaTDPBi+3HL/LT+PCIlcYoMj4jIPMlhJUcD0vocyfRmckAEAhuTEEdqogAWj4uKpaBxtVtRuJTNTOuCNSln3b9Usn3zz5R7Sow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(83380400001)(6916009)(54906003)(53546011)(8676002)(4326008)(2616005)(31686004)(316002)(186003)(66476007)(66946007)(36756003)(26005)(6486002)(66556008)(4744005)(2906002)(508600001)(38100700002)(6512007)(5660300002)(6506007)(31696002)(86362001)(15583001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2toSmh6RmNwUzN3c1NnR1JxcERZbTU5bm9XdjNDYk0xaWNpM1daQk9QR3lS?=
 =?utf-8?B?eXc5OWJGNjFKRjBJbmlGNHpmelRFSXU0OGhmMmpPTVVRdG51K0lkTUhNSUh5?=
 =?utf-8?B?RmVKbEMyK2hFYy9xUzN1blZ5bDdLeWJHQUdtL3haN2tqb2swK1d6VlZWTi8x?=
 =?utf-8?B?WTdYdzhBazdHcFZTaHF4KzhIWGo5ZmZkcVZUR1IzOVk0bExZenI5TzNoeTVt?=
 =?utf-8?B?QlhXalR0REF3ODNSUWJka3hmRi8rUkI0UmxRZHliNHVpRXlJQzdWUEEyTVNz?=
 =?utf-8?B?NkwxTWMrTlJhazZPdys2cm1JZC9mMGVvVjQ4SCtYNTlZVXY0YlB2VzlyVFU4?=
 =?utf-8?B?OE5GUDZraFJqTWhDbGVmSENpb2VmTWVaYmk2RkhDUHUra1owTWFIdklGTnZR?=
 =?utf-8?B?TzFLeGcxc201SXg2eEVaUVpEZ3B4R3RJQnRnVnVNdFZndWFhTWFBNDhISVJ5?=
 =?utf-8?B?eUl5SE5LRGdFSkhISElxUzBieUdkUTluMDRWeWRRM2tYWHhlYW0yMnJKcHV1?=
 =?utf-8?B?K0NSK05MTHdKY3ZkSEJYeGdwQ2U0M2cyYkJlSVFhMGZ0K0VVK0U1SnNjbnRt?=
 =?utf-8?B?Y21qL0I3UENIKzBPUEhCeXNSU29YRjJmVlpJZ2RvNzNpS2FtMWZkQWR3RGxM?=
 =?utf-8?B?Wi9CK1ZxWkg5TFBPQkFhdkNzSSt6LzkrTjBHeDNyY2I3c1lnT2lERXBqQnNs?=
 =?utf-8?B?M2dreWxTdlhYTkJMb3RVUWtuY0R1NEZzK0FMQTI5MStTNVpVeWFGR3ZldzNE?=
 =?utf-8?B?NEN0TWwyUkZmQ1h3U0xSWVNQZzVaSG1SNThUeDhuMmMwWUFyZUJuWmN5SEdK?=
 =?utf-8?B?S2RDVUJFVGk2Um01ZHBnOHR5aTNXYmRZeGhkNnU3cTY1WXJBTEVjRWR0eG13?=
 =?utf-8?B?R2w2WGNZMkR1RXhjdUNIYWJGYWRBL0ZaczVhUUF4em9EdXBnWW5pSTlqeW1R?=
 =?utf-8?B?ZGxSbkd3SWduK05pOCsxSFI4bEk2dFZLaTZBTmw0ZC9CNFlFbEpXQ3FDSzU0?=
 =?utf-8?B?TnlXRXlLTDhxeUpNVzBlc2JZNGRaS0t0SmppUWtZRGJobXV1SE02bDRTZFY2?=
 =?utf-8?B?WUdzN0lUWm5XU2xDaVdERUtUVW1zSWQwZS83QzdjNmNEdktvYVdvOVlCNk95?=
 =?utf-8?B?OUkyUDBOVkM3VWVmcUdUN0hkR3AvYVVvSDZ1VENqZlkzK3JTcHRQeGEyMU5s?=
 =?utf-8?B?cklDbHQ3QzlGeGVtZnYxWS9mbFJlQjdUTVBJbnBIMSs2c0JMSDYxK2JCNVVh?=
 =?utf-8?B?RjFoMEFTdUlibE16d3N5cEFldjU5QmFZWHQ4d0dWSFlsSjVBeHBRMFN5QlNG?=
 =?utf-8?B?Wk9va2dUb2c3ZUZ6dFRNbEtiU0g4TnV2Zi84cXZlS3dlWGVCeTBkOG0zRXJX?=
 =?utf-8?B?T2ROY0ZXN284ZGVKUkZGWngxVkdJME9CS1NXSElEY3lRZ0g3cFVGMkkzdHpO?=
 =?utf-8?B?WFI2T1BkYzd2UDlpOFJGQlFBU1NSMXFvSnVreGxwenhERkV5TjJTaFV2L1VU?=
 =?utf-8?B?b0xFQzNOWWhwbEZub0FYelZ6QW5JRGFkM1JwZmlDVm85VjdUQVc3MFFjVGdP?=
 =?utf-8?B?a2plWGgrVzZiVnRqS0RKakhUYWI5aHVPdnVoU2xvTXI1bVY0L0NTdVY2akxu?=
 =?utf-8?B?MW9QaVlGR3hoZFdlT0lpZWEvdW1NSklnWXRzdGZNNnd2amFLaGxEQTBMa1JW?=
 =?utf-8?B?R29qWHdMSEFYNTNSdFk1Tm1iWFQxNkZGWjN1czdQbDJBS1Q3eGFuT1hYdkpk?=
 =?utf-8?B?ZUxhcXZNeTEvT2VRVTNDT1BvK05jakFocUJMRnZEZHR4NUlEamlZU3RqSmJW?=
 =?utf-8?B?WGZnc2I2NjVRTlA0MGdxWC9sem9zOEFKMzFsQ0hNbnkyWGVMYWY0MmFzWnZk?=
 =?utf-8?B?S1REWjczWm9Fd2pYc3ZoeTNSTVR1RTR2NENZdzVLb1pORGs1K0FoNTFTWXYw?=
 =?utf-8?B?TDJNZVQ4cTJ6MVM3UzRXRTE0M0w1ODMzV01wQ1h2eWFzRmRCREpKSkFWMWw4?=
 =?utf-8?B?M1dJc1FQY0JGMFA0ZE1jQWo4RTA5b2hOYTRrOVNvMnRHL1ZiNnlQY1Raampj?=
 =?utf-8?B?eHlOdXpYenNLVVpFazhGQ3ZDSUQ1WEswMTl3OTExamxmVGVqYzdNbEg0eHd4?=
 =?utf-8?B?OEd0c2lnZFJmZVFFLzhlV0dFZlpJVlVqUFZhejNxUzk3S1BUeE00OTRPTmE0?=
 =?utf-8?B?eks4MkY5TGdlSklsUzFkOFBRZ3N5eHlwZmRZNlRpSEZzVlEyVDYxdGZhNGYw?=
 =?utf-8?B?UndPdW9xdy9md2JVcklwMHJuZnRBRlZIU3g5YjNBejV0WTMzQ3M4OTlrc1g5?=
 =?utf-8?B?QXVxMHVhdlJ2MFA3QXJBdTdXZjdLcDRCanUvbVJOVWpVSG5TZkR2dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ff8997-821f-458d-90a9-08da282bd5a6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:56:36.0451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUck6YmjK9SLYi7myMzsVZK77UYIkVPcf5Gq+Ofv2oXJ8lVRzGxPee+osfft4BQ4q/pZrFlLX1RvO6r4AHfj/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5073

On 19.04.2022 17:49, Demi Marie Obenour wrote:
> This hypercall can be used to get the ESRT from the hypervisor.  It
> returning successfully also indicates that Xen has reserved the ESRT and
> it can safely be parsed by dom0.

I'm not convinced of the need, and I view such an addition as inconsistent
with the original intentions. The pointer comes from the config table,
which Dom0 already has access to. All a Dom0 kernel may need to know in
addition is whether the range was properly reserved. This could be achieved
by splitting the EFI memory map entry in patch 2, instead of only splitting
the E820 derivation, as then XEN_FW_EFI_MEM_INFO can be used to find out
the range's type. Another way to find out would be for Dom0 to attempt to
map this area as MMIO, after first checking that no part of the range is in
its own memory allocation. This 2nd approach may, however, not really be
suitable for PVH Dom0, I think.

Jan


