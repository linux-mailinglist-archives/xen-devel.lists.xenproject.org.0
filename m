Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02185489353
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 09:29:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255219.437317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6q2V-0007oq-KR; Mon, 10 Jan 2022 08:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255219.437317; Mon, 10 Jan 2022 08:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6q2V-0007lO-GH; Mon, 10 Jan 2022 08:28:27 +0000
Received: by outflank-mailman (input) for mailman id 255219;
 Mon, 10 Jan 2022 08:28:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6q2U-0007lH-4x
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 08:28:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4609a73a-71ef-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 09:28:24 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-Uw9iOWfXMuqb4TIyYB5O0Q-2; Mon, 10 Jan 2022 09:28:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3117.eurprd04.prod.outlook.com (2603:10a6:802:6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 08:28:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 08:28:17 +0000
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
X-Inumbo-ID: 4609a73a-71ef-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641803302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALUSQ3JNQ/dzMFaU+G2/NxXu5zdAAVOMVL4X3ryPfGM=;
	b=DyTxMXBE4+t08AZx92dRCCkv8NhHym2F8t7sWhx1OaYJjrkWnr3kG5ISKh2PhSWfuV5nEU
	oYYERzhTCVsJohyhx4OTIrNq7gN7s6Bic+2BL7CC1zOU1hySpcvqw4URNYxH6aDUk27Pa/
	eE5+1PLlFZ0yeNulVA9K5F1n5iW3cso=
X-MC-Unique: Uw9iOWfXMuqb4TIyYB5O0Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkewRIstEdZq3mofxEN86rnynW/jKU1FSLIzC1087kyJ0b1lwlfB5b64USNEPKlvi2CPp6ARUBbwdiCmiT0C2nQiN5WJYHNway3iJGpuD9S3FJm7MpKIE1/03wKdqCOUouVTelHJjCkHh7e4EVdrcFnB+ynJXeR94TSjsmQW5Z0rFG2Ni3xBBhk2glKBBkVmhQkqXqyjmQivI76do4QVR8h/6z3tXHcXzyqRUa9mIv9Y2w6Q3uCYm0fFWk/jcGaeZjPjK0jofyRLbowxn8YXskrqnDu0v8hSWEnDcOWiaX8LFQv/CX3TJvDrjvjximzeti/Nm1A75509HEynvwvoJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALUSQ3JNQ/dzMFaU+G2/NxXu5zdAAVOMVL4X3ryPfGM=;
 b=AGoe0Xh4+M5K6LvmWXXR+mCsQGrF4jELuSOunSziLAvAglQQAdPTJcSH3lMBUIJr0WiVmaCyBTrQH7Wuvx9znJspqZLG67nMh97BYhk/2Z8tRsT7yJzu+UJ+Y5noi+nSmiQPEU0xmOWq0zrvfUvh8UfB1LAYK0EvCRx6X6o1NW/AClZ5Pw9cGBZG6760F4F4+eHuIsmV2fMU28DlDhPpCbwuSp/F86ocUTHzay1krBvJuoGlS5BMxa+r+8ZRjjEXDFPLKmwkjk9Y64rHvtttQHQR+ncXOltgaZ2d4HEtNQq1M2V8nHRsG80b7SovrDVreHyceHS7DlUoINyC+nR5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4303dc16-6804-5cad-67e1-56d06a3b7d30@suse.com>
Date: Mon, 10 Jan 2022 09:28:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] libxl/PCI: defer backend wait upon attaching to PV guest
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <stefano@stabellini.net>
References: <5114ae87-bc0e-3d58-e16e-6d9d2fee0801@suse.com>
 <CAKf6xpt6+ZkXK5uXyp15UyA1J2AhtZWipW04M1xD1Yx4nx3jOw@mail.gmail.com>
 <18a2487b-f754-d971-2e89-93e54b7b951b@suse.com> <YdhaWaxFaC9rZTF5@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YdhaWaxFaC9rZTF5@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79787276-4505-4c07-325b-08d9d4132691
X-MS-TrafficTypeDiagnostic: VI1PR04MB3117:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3117A83F2AE1EB44298C9DA7B3509@VI1PR04MB3117.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FgHdeFKS2ElJNUFInLNLL6ULbjIXxeT/v3xp/s53dfPnQGvF5Ul8pO5yaUV/AgrD2VkV2JqtNZ5kdwZgfC7zjDQPdJLJ+FROOmiu/jZZNnjWuS8/QFr4ka9nPDAhG6VTZDnfm4iRC/S2cvzImezPVLTg5ODHfxos1n/pN77JWNdTiUDsKLzbXR1Ky4Xc5BHJHVYRaQeBKW5J9FIJttujdNttjbIvCszm9tAbufhDISIcwskov2bAB+fYqzqc/EoIEB9ft9UUPS9GaJ+19PTjAmrcjd0VNqouu4KILh5dbbWsDbkhKs5H02bbn1/cP0rWPoipnVbi6CtrrIEC3a1is5Z2XsIvO83X1AGTMHoYI1+nDrc2+IZazZyAR3spXYvDRQbR/uhW1RHpHFrDHr39BCo8evsmuXoSLY3wsu9XxEZlxNxLBupO3YorEIqF6umyhHOr3cdvBDfxh7g3YSG7UnE+3QQEgg565qeZuXXAiPK+qCp2sEESQ33n9609Sj8f2PJzOiDCvg4pDSDQlHzauiXs02MmOI7ALWRnkhk1an2NMU/HZu4oWDInDvjy4x2Gw9NIvuV2ZZ6N5vfyIrbIrjCJs31L+3PgaKcGAa/TQym7L17ddKhuHfc1U6mimd0vYRTF7b2TOi64DEHSVo/GHIAPwQiq0eHj44hvb9/uX0V8kUBsFzZN9IyTN69kucTvMynMrfybg99tBci4zCYIDcmshDcO3QKUIEBdFX/mXqY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(5660300002)(4326008)(86362001)(54906003)(66556008)(66476007)(6506007)(66946007)(316002)(53546011)(186003)(6486002)(26005)(2616005)(2906002)(8676002)(31696002)(6512007)(110136005)(38100700002)(36756003)(31686004)(83380400001)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDhWMVBzT1YzOVAxdnZNVWJCT2FTRCtTbnZXL29tVytBa3B2NCt5V2x2TU9i?=
 =?utf-8?B?eSt5NFNRaWErdU9WWlFLUFVXUHBpclp1Q2h5YnE5TXhGelhSV1NFSFd1OTdQ?=
 =?utf-8?B?SjVpQ205Z1dhNzU4d1Q2d3BKWkJkQ0V5VzhqZFJObWVtS01zTFgzQ2h2NlM5?=
 =?utf-8?B?QlluN0VnNmV3eXFkNSs2SWZra2o3L0k5am4wclJXM3c2WHYxRk5mZk9BTnp1?=
 =?utf-8?B?aXdTTXNidjZVeERzN2dlUHJpUktBZ0ZCRnhacTlIQ1d0d3dwOUZuSnRxUmls?=
 =?utf-8?B?eXRTd0xaS1hHcC8weDVKMmpHcUhzdkxoLzhNWS9oYlFmdVlHVEhaSGVMdHd0?=
 =?utf-8?B?MkVOTFJta3Z3WkZlUkdtdENWQ25aQi9BdVBGQmc2SUxmeGp3N3dFNWg3VDFy?=
 =?utf-8?B?YUpqWHlRM0FybWtaRjk2Z1lLRjl2dGdqUkJBUGdtbUNJUVFlcWhuTllZZHR1?=
 =?utf-8?B?cjRkczFzejk4TzNIY1Nta0JpcEZKRUZTZDNyRzI4bEtLSXY3cmkvNElmNERB?=
 =?utf-8?B?TDE4UnUvWXEvMitKUXVxWU00NlVrREpzajdLNHlvZ2dBZEtNcVFUdUpoNHp5?=
 =?utf-8?B?MkhtNE5iS0Z2T1pnRkRmY0hlV3V3TS9CcGtCcHArU21Sd0NEOWZiTk80QWFj?=
 =?utf-8?B?b3l0MUtZZjJqODd6UUVUclVUd0ZDdldGMzBoWE00aHEzbHNMaVVTcG9TTTE4?=
 =?utf-8?B?NHlFK3BMNmQ1UnN4RjVSMmI4RTc5Q2U3TEpES3FjZllRTzRYRzZaU1hJUkY1?=
 =?utf-8?B?RCtLZmNuVEh4OER4UG5Fc2tjV2lQUE1OQXR4blNMbnkrTVlVRlZQZ3N1ajRx?=
 =?utf-8?B?TEdMeThtMTc5VVRVQ1NERlRzWmNaZVZUYWxYeTB2YlUyWWp6emZhNE1wOFM3?=
 =?utf-8?B?N1JuVHZYbFBhMk80N2sxQnRTaVNHYjdxQkxqWWVlUlJlVmZlT0Y1dmVWRGUv?=
 =?utf-8?B?VTFCczRIVDFCRkFyTWdWYVFlZVpadnpTQmRsS0NKK3ZGaEovWkZFNGJKejdB?=
 =?utf-8?B?UHg0Q1ptODBXVEFZR1FraGFiRUwyNXBrYUdxbldVemUyQThuYUh2UWdIa24r?=
 =?utf-8?B?dHdibjdGdTNqb3hRdENyV3lVdXNXRHF6NDcwUXRDREEzT1haSVdCTFBpTSth?=
 =?utf-8?B?L3h1WUF4NjRnY0hFVlgzRWZCWjM5Q2pyV0Z3dDBMblFQeWdUYm15Y0JMYUx4?=
 =?utf-8?B?a1NUTDEzbk5YNDdjRUdaN05OalVCWDJkSGZBS1BINm9uWERZb2F1ZFRWeWJv?=
 =?utf-8?B?Uk1nWmQyUmhBZlFuSW4zSkxnRnZYMy9lMHBtMCtxL2g5bDRHQkpBSUdmYUVK?=
 =?utf-8?B?OWhlU3ZTejBrWnNIWWlieFBjZ3pheFNTeWRkYlZPNkNHYWhkZjBmblpHSGRT?=
 =?utf-8?B?Y2UxV3ZnemFsR0lQMkpzY3dvalVOUXBuOTI4cWhldkxUTHpFOE93WlMzaWRC?=
 =?utf-8?B?Mk5JTUV0SWVRUkY2dmVuNG5wWUM1azJRV2xvanVtZ3VUdVlrS2VwclJ3NkdB?=
 =?utf-8?B?dVFRWFV0c3RieVBOZ1M0ZXZRU0N2ZWlkVktjdHZ1aXNMakVUbG5oNjJNZk5z?=
 =?utf-8?B?dXRzK3hLdGZDeUVFSkRNZDdhM2g1Qzc1Vk9Jek5wR1E0SXZ3RVRacHo4dG9Z?=
 =?utf-8?B?ME1DcG5RdG9KdVJCWU1lS2NoRjBwT0xYeFdOamJmNmQ4c1ViZzlqaHZERmhF?=
 =?utf-8?B?U0gyQmNOV0lKSHYzb210UVJ6YVBKb1FtTW9CemlxTnRFbTNMYnVUTmRHVVIr?=
 =?utf-8?B?dHduUStWNmdnWmdjMlRrOGVHaHQwNkdCWUQzMVhmcFgyaVdzdHlJUWJzeFd2?=
 =?utf-8?B?bEhOeFlpNC9rTHhQTitBcGlacE53OEx1N0JtTU1KMCtTM0d2UUZQVlVlNlE0?=
 =?utf-8?B?SUFjRGhKcmxRSlk1ZGFYdko4Nk42MXlnNWJrMm90NVBoekVtSzRBUkFzU0hn?=
 =?utf-8?B?NVlMS2dUZUtRSEdzMU82NzJaTmlSa0VXL2FGSmRqSDREL3dOUlQxeiszd1ZF?=
 =?utf-8?B?SkhORWlOZmdQQjdVUW15SEVmUWgxTitTTUFmei9sYlF6cnZ5NUJkUzZabUYr?=
 =?utf-8?B?MTBuMEhiME9yVEZWa3VxbEVEUFplOWdTTm5HWU1HVVVseERxaUY5WCtPQ08r?=
 =?utf-8?B?YUhTcGUzZGlJMFFKZmduRGxBajdiMTJtbmZmcm83bmVxRld2WE9sWTdtUnlY?=
 =?utf-8?Q?o9Ehw1Vk5QShFvSCZ34OdTI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79787276-4505-4c07-325b-08d9d4132691
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 08:28:16.7352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFRDd92TDdEXQA26lkhZ9axiL7/aOhv5HcZnJQNbM/l0j0j4FAiCOvxnGpno/aWyONnQKDN7LhRd/IkGlYQ3Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3117

On 07.01.2022 16:20, Anthony PERARD wrote:
> On Tue, Dec 14, 2021 at 02:52:43PM +0100, Jan Beulich wrote:
>> On 14.12.2021 14:34, Jason Andryuk wrote:
>>> On Tue, Dec 14, 2021 at 2:50 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> Attempting to wait when the backend hasn't been created yet can't work:
>>>> the function will complain "Backend ... does not exist". Move the
>>>> waiting past the creation of the backend (and that of other related
>>>> nodes), hoping that there are no other dependencies that would now be
>>>> broken.
>>>>
>>>> Fixes: 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are reflected in the config")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Just to make it explicit: I have no idea why the waiting is needed in
>>>> the first place. It's been there from the very introduction of PCI
>>>> passthrough support (commit b0a1af61678b). I therefore can't exclude
>>>> that an even better fix would be to simply omit the 2nd hunk here.
>>>
>>> The first time a device is attached, the backend does not exist, and
>>> the wait is not needed.  However, when a second device is attached,
>>> the backend does exist.  Since pciback goes through Reconfiguring and
>>> Reconfigured, I believe the wait exists to let the frontend/backend
>>> settle back to Connected before modifying the xenstore entries to add
>>> the additional device.  I could be wrong, but that is my best answer
>>> for why someone went to the trouble of adding a wait in the first
>>> place.
>>
>> If things are as you describe them, then the change here is wrong: The
>> waiting gets moved from before the creation of the new device's nodes
>> to immediately after. Yet then I also can't see how else I should
>> address the issue at hand, so I'd have to defer to someone else; this
>> may involve undoing / redoing some of what the commit referenced by
>> the Fixes: tag did.
>>
>> However, since all new nodes get added in a single transaction, I
>> can't see why waiting for the completion of a prior reconfigure would
>> be necessary: That'll either notice (and process) the new nodes, or
>> it won't. If it does, the next reconfigure would simply be a no-op.
> 
> Well, the current code is checking that the backend is in a known state:
> "Connected". Without this, the backend could be in any state like
> "Closing" or other error, not just reconfiguring. We probably want to
> keep checking that the backend can expect more devices.

Perhaps; I wonder though whether that's enough. The backend may also not
expect (or successfully deal with) new devices for other reasons. IOW
some kind of check of the success of the "addition" would seem to be
needed anyway.

> Looking at Linux PCI PV backend implementation, I think linux reads
> "num_devs", takes time to do configuration of new devs, then set "state"
> to "reconfigured". So if libxl set's "num_devs" and "states" while
> Linux takes time to config new devs, Linux will never check "num_devs"
> again and ignore new added devices. So I guess it doesn't matter if we
> wait before or after to read "state"=="connected".
> 
> There is no real documentation on this PV PCI passthrough, so it is hard
> to tell what libxl can do. The pci backend xenstore path isn't even in
> "xenstore-paths.pandoc".
> 
> But overall, maybe Jason's proposed change would be better, that is to
> wait on the backend before adding a new device but only when there's
> already a device which mean the backend would exist. (It would be better
> to me as it doesn't change when the waiting is done.)

It's hard for me to tell without having seen Jason's full patch. I also
understand it has been submitted earlier than mine, so I wonder what its
status is.

Jan


