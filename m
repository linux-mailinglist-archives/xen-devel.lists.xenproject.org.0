Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DB83E183D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 17:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164435.300736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBfSV-0004Id-C7; Thu, 05 Aug 2021 15:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164435.300736; Thu, 05 Aug 2021 15:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBfSV-0004GP-8M; Thu, 05 Aug 2021 15:38:59 +0000
Received: by outflank-mailman (input) for mailman id 164435;
 Thu, 05 Aug 2021 15:38:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1FJ0=M4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mBfSU-0004GJ-5C
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 15:38:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3eb07262-f603-11eb-9c36-12813bfff9fa;
 Thu, 05 Aug 2021 15:38:56 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-HCl8urOQM8-hPYaCRA7GDQ-1;
 Thu, 05 Aug 2021 17:38:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4847.eurprd04.prod.outlook.com (2603:10a6:803:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 15:38:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 15:38:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0068.eurprd04.prod.outlook.com (2603:10a6:208:1::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 15:38:51 +0000
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
X-Inumbo-ID: 3eb07262-f603-11eb-9c36-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628177936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u9WK7Uny8iP6bvLYMQuGW8UNEeilR7najs7REoLXaWk=;
	b=f7XQM1XlDGTvjW0QdpE6KURuPD1l7wQ+Gx9bHmy014ZeLyCRFME8VuPAirts/U+z8C83FA
	Io6108UnjaKHKprbqW5tEURze7by2GRkKMMFzb4m1qrO5O6BfClSloqyH6K9QlYpuoYhFC
	gc6rDVsTT+2gf6OSJ8sj5mxfcRMrj1Y=
X-MC-Unique: HCl8urOQM8-hPYaCRA7GDQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McJMRMhzq3ehLyYJscO6HPhDcefRuo6VSegKgOQJ3siQeATw3rK9nbfo40H09kTo8e08SEdngO2qyYLjw6u3O7OBOJxcEb/OUVlBxr38JZ5OBtqtQrsLrI2/SBxw3Ger+ScRj5A/4p8s/KLRVceOii/3KQk+n++Znawq+Vmpjq2OGeJBQQzO4pjend85buB+nI1ffNqoSIPji1br3qWFyqNFHYCPc5IJTuFI99Uzqk89O1gxXo/GX7Md0+t7xCCEgiZt9jNwZwrmVD6dplSnOQnvyaUWlLCnbG/3gtJ7J87OBsxJCMAU+QRIe/vRPlVkOSBvSZWXBSC9LqS1XCA8Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9WK7Uny8iP6bvLYMQuGW8UNEeilR7najs7REoLXaWk=;
 b=cc5mKoCFepW1j7TPhWqFuXOXy8TTAHdx2UYdgyHiRvIuwzoToWuV9JoO1iouQDDY5gyfGIqrMm0i5FAKvNpe0hnneesmxgUFW0fnflp4F/VaLPZ2SRdp2dCw9UiD8NEfy5lrzACLxjmsmmY0nDwkdh0Zoi/10aIvQm50tIAbtaA1vjpAV8L6nhAFSCblZL4bKktSpC33GCl+l7ihM7BP2b2aFZwl884c4BhWXkrx59fMicbQByz1kRvckk7nTGdnYpsIGvULuwyfuBrKYRy+wZ6FCKMPL7EwFL+a6pjlWgMv2GihIcVAx7ylY7aDRJLBxXKsrrGjcnMWfmVIHKaubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] libxl: Fix stubdom PCI passthrough
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <20210804221749.56320-1-jandryuk@gmail.com>
 <cb1b8918-639f-668f-c663-a6392a2d8e1f@suse.com>
 <CAKf6xpt3_erJPzG6awZorr+tBi5DyfGRZeeaYACe3v5O=aK7PQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c13aef2f-7707-6caf-e4bc-df62c5737e8a@suse.com>
Date: Thu, 5 Aug 2021 17:38:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <CAKf6xpt3_erJPzG6awZorr+tBi5DyfGRZeeaYACe3v5O=aK7PQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0068.eurprd04.prod.outlook.com
 (2603:10a6:208:1::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddffe3e4-866f-42c1-41c3-08d958272051
X-MS-TrafficTypeDiagnostic: VI1PR04MB4847:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB484748D6A576608093B5EDB2B3F29@VI1PR04MB4847.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q9dTrZcGr9u8a8x9UAH/PLEuJ8guBdQruwR/a9JV8zs4P8vO7yELI1/cr6glUJ7gvhVfoADWLq/39csgBs29srMX37TX/W2Moaw5/3DQDJBzvKKdXSkhs3CBqVCgg0RVdAgBv7FkPUz098LsI8McbJR1YLjluaAC6CZAR4LGNzM3/B4/Pl4nyEsSUa/S5fef2P6ScaMZeAxSJpLa5GAG1/dZdCGNb8xVx/jtY+cCiHLKBi1UL6KS4j5iBr4blPLUJkycV0bF8lyh5/Q7kTXzCbIIwh4mOyQ1uUyUcAlFc3NxZ/oCw84waOaRuoPYKDmNIdmJv4hDs/YjwjajGaXWuxGEVkW1yCscQuX+2I3R1tPUUbCLsBEKScaCgjIvLV8RD5S/46bP9a1doxhfbuQT+89Bek1dI7mKu7R6oHabHYoKMGco4xpf9i70tRhavQ/RLsF2Wh3UdGi/D8SZmA0yuACB5X+xJsU7BaYjFk6Z3PlAxTZirVRCP39wSocyTn0f9+ioyWSrR3LGaZ7WPqEAkVRISfcObgl6nwR6Y6oNBkzg3qQLR9eM4CFzH12IokYNUhWsHrHXWDNrVmYwMvfKgn9vAd3h1IhqPXnS+EY5gGFvea+U/pgRQ1GYLxkWQrd3hiEtdM9cidohfm606mINnUniD4hxoncAmGaX+GxmzUB8nYNX8tw0pZV7oQKTbS52DWTB1BYZUgGRTtEP1Y5Z2vnSbFemiqVyTqequQTh7t4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(39860400002)(376002)(396003)(53546011)(86362001)(478600001)(26005)(956004)(38100700002)(5660300002)(2616005)(36756003)(31696002)(4326008)(54906003)(83380400001)(31686004)(186003)(8936002)(316002)(16576012)(66476007)(66556008)(66946007)(8676002)(6486002)(2906002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3BiYTMzZmppeEcxQy8rU3Q2SE9pT2tHdGtINVh0SnY5RW9uMTRkc2QxT2FL?=
 =?utf-8?B?MW9ORStTQ1k0U2sxMWx4SVcxKzdibFNuZmdGUWtDTVY0aFZiQStjWFo3anFj?=
 =?utf-8?B?bkFieUYrQzBwTXE5Y3lSQjR1OFpzd1lxRVVpRE1jZ0dVM1NXdzdmeDRpNjRX?=
 =?utf-8?B?Z0lxbzZId0JmbDBsN0FoUjlTRlNhOHVLeUVjUUh0MlMzd3YwTkxPaUd3Y3dw?=
 =?utf-8?B?d0FlQjY5aGlzVjNML24yc3Q2cFkxVVpHblVVdytpK1JlK2pJSFhkbm1wa2hr?=
 =?utf-8?B?dTNMMWd5ZVhkb3JoMGphTmV0SW14OGZMb3huTlFzYlZuRmxEcEZ3Tlp6UjBY?=
 =?utf-8?B?blI4ZDJ1U2JLWGozR3hLUEJNUnlEU2t3Y21NdDNITGdURGMyZGZHVlpXQ3dP?=
 =?utf-8?B?OC9XNDBLY1BycEpneVZjU3VMbmRKVmxWU21KNUJ5VzhTVko4bzdONDhrRW1F?=
 =?utf-8?B?eEp5b3hVUWprWkoyK25peGNiQmllTFM0dHpiM0w1SkRrcVJJWnc5cVl3WFF5?=
 =?utf-8?B?MGtjTENiQS9wSmNUYUNCc3JLZk1kVFZSUzJ0SFRVMHRIdEllMkk5RXZrUDVE?=
 =?utf-8?B?TXZDUnk5WGpPTm5VLzFoZnJQR29OUXJEN3R3cVdMVHVJeTVMLyt5VlFLUTFj?=
 =?utf-8?B?ZFJsSS9wSUVvMnVsV3J3ZDNybG9MSUVRbEltaFI1SGJEaHdLcGpzZGhKMkxt?=
 =?utf-8?B?Z1ZGRnFzVXhVeTVNZG5DaVZ5QW9IWkkwWUpwdXNEczZ1UXlIeHlmd2ZacGtD?=
 =?utf-8?B?VTFLeFJhY3dHanBUeGE2dTZ6d3hNMjFFYnp2OG5SRU8ySkRISHExby9kWXRC?=
 =?utf-8?B?b2pXd3N2RldpVGhJOVN6NHVQazl5QVJqZCtuRUJzZ0NiWDBOT0ZIcENBd09s?=
 =?utf-8?B?emxMQ3FuSHIzMkFIcVl3eEdWa1BTS0t6d1Z3YmthZG10VzkxTzFFdVR6c3VQ?=
 =?utf-8?B?WHdnQUQydlo4TjlTNGJjY2hZL0tEdUhiU3NiV0ZJM21iY1l1anY0TXFNWnNT?=
 =?utf-8?B?NGFVWXQ1K3hLSXJLYXFYZlN0dHRhZXNWUGp1d0tkcm1yWGRRYWU1YUEzWDdF?=
 =?utf-8?B?QkJ5WmtYRnQwSjF1UnAwZysyUHpZWXlvRm93OEI5aTVHSU1qY255TkJ6V1Qr?=
 =?utf-8?B?bHZvNURSUEpTSW04b1NxMlphOThKWXZCejJCUmhkTG5pT1NYRjFFZ2tJK1dh?=
 =?utf-8?B?UnVnclRUa2Q2aE03WmZzZ0Z2YkxOWFp3SUxyenRDTHg4RENHaUFselVKQXlo?=
 =?utf-8?B?enM5Ry9IRGh3ZUpKUDh0bEZ5UEpZaU50K1lOL2J0STN1ZUd6aGRIZi8xVzdu?=
 =?utf-8?B?T3pGckJVU05maEZBQmtpa3FLaG1pNU9RelFTZkhSU2RtcFlRNjlybTI1Q2ZQ?=
 =?utf-8?B?WFRCRUZBZHNUSDhmVUJwT2p6Q1FrN3pTcWwxWGFiekJZSER3NUdsSGFtTHZw?=
 =?utf-8?B?QmJkL09WbGp0RlEvTlM3OCtmWUxwSWUwZy9nOTkvUGcrQjdBby9aUGRzcjJF?=
 =?utf-8?B?TTNUUnJBTitpUEh6c09wR0tkemhBZit5TVAvWGlYVGZUblFTeWJNbVczeC9B?=
 =?utf-8?B?RGtwT0xxVkNLOFhpQ2hZSkRvcWRjNEtMSG85K3BZZHJEc2lHVVRLMEwrdGUv?=
 =?utf-8?B?amxzamduQ28vcEVxOUtoYm9hSVA3eEpMTkw0U21SY1AyY1phRWFXNTF0NFBi?=
 =?utf-8?B?eUhLSmFmQUdabXFrcG5VTmhGUjRtd25sV0lyYU93ME11aDhyRDR3WVRFUUMy?=
 =?utf-8?Q?creHYrju+Z5fMu3lknYgmu75Q+1GZbjkf/WxxT6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddffe3e4-866f-42c1-41c3-08d958272051
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 15:38:52.0140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dcu+DwzNVD0S4UWKbhB4z2Xw7Eg/3jT6LYrWaCDove/3mOwO9GrGxxQJqu4FBSIYQMpKpv3xrUkIh+9wCl6AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4847

On 05.08.2021 16:57, Jason Andryuk wrote:
> On Thu, Aug 5, 2021 at 2:20 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 05.08.2021 00:17, Jason Andryuk wrote:
>>> commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
>>> reflected in the config"
>>
>> This should be in a Fixes: tag; whether you fully spell out the
>> reference here or instead refer to that tag would by up to you.
> 
> Yes, you are correct.  Thanks.
> 
>>> broken stubdom PCI passthrough when it moved
>>> libxl__create_pci_backend later in the function.  xl pci-attach for a
>>> running PV domain may also have been broken, but that was not verified.
>>>
>>> The stubdomain is running (!starting) and PV, so it calls
>>> libxl__wait_for_backend.  With the new placement of
>>> libxl__create_pci_backend, the path does not exist and the call
>>> immediately fails.
>>> libxl: error: libxl_device.c:1388:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/43/0 does not exist
>>> libxl: error: libxl_pci.c:1764:device_pci_add_done: Domain 42:libxl__device_pci_add failed for PCI device 0:2:0.0 (rc -3)
>>> libxl: error: libxl_create.c:1857:domcreate_attach_devices: Domain 42:unable to add pci devices
>>>
>>> The wait is only relevant when the backend is already present.  Use the
>>> read on num_devs to decide whether the backend exists and therefore the
>>> wait is needed.
>>
>> But the presence of the node is not an indication of the backend existing,
>> is it? libxl__device_pci_add_xenstore() itself writes the node a few lines
>> down from your change, so upon processing a 2nd device the function would
>> still behave as it does now.
> 
> The way this code is written, num_devs is an indicator.  As you say,
> it's used to control if the overall backend is created.  When the
> backend is created without num_devs, Linux xen-pciback closes the
> front/back with "Error reading number of devices".  I also tried
> adding a new libxl__create_pci_backend() call which wrote num_devs
> "0", but that failed with some error I did not write down.  Although I
> may have messed that up by not executing the transaction.
> 
> When libxl__device_pci_add_xenstore() runs a second time, the wait is
> fine because the backend exists.

Ah yes, now I recall, because I stumbled over this unhelpful behavior
a couple of months ago. As mentioned back then I think it is wrong to
create the backend after adding just the first device; it would
better be created once all devices have got populated to xenstore. At
the time I did submit a kernel side patch to deal with the odd
behavior. This has gone in upstream in the meantime, but I would have
preferred if the issue would (also) have been addressed in libxl.

>  I just tested to confirm.  Testing
> `xl create` for HVM w/ Linux stubdom and 2 PCI devices shows the
> wait's watch trigger for Reconfiguring and Reconfigured before it
> settles back to Connected.
> 
> The point of the wait is to let the front/back finish any
> Reconfiguring for a running domain before a new attachment is
> initiated.  If we have to create the backend, then the wait is
> unnecessary - a non-existant backend cannot be Reconfiguring.  The
> function already changes behavior depending on the num_devs node.
> When num_devs doesn't exist, it creates the backend.  That is why I
> went with an additional parameter and comment.
> 
> Would you like an expansion of the commit message with something like:
> """
> The wait is only relevant when the backend is already present.
> num_devs is already used to determine if the backend needs to be
> created.  Re-use num_devs to determine if the backend wait is
> necessary.  The wait is necessary to avoid racing with another PCI
> attachment reconfiguring the front/back. If we are creating the
> backend, then we don't have to worry about a racing reconfigure.
> """

Might help, yes.

Jan


