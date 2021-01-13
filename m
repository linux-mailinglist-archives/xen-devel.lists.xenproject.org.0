Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A63E92F5464
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 22:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66760.118714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kznH2-0000Jt-Ap; Wed, 13 Jan 2021 21:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66760.118714; Wed, 13 Jan 2021 21:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kznH2-0000JU-6n; Wed, 13 Jan 2021 21:01:48 +0000
Received: by outflank-mailman (input) for mailman id 66760;
 Wed, 13 Jan 2021 21:01:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QFkA=GQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kznH0-0000JP-3s
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 21:01:46 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a3cc71c-3fb5-4c29-954f-5b58c93f117a;
 Wed, 13 Jan 2021 21:01:44 +0000 (UTC)
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
X-Inumbo-ID: 1a3cc71c-3fb5-4c29-954f-5b58c93f117a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610571704;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8ZZ8szRmKBRvwzfNR53C4cv/rYFIInvXqRurisfEsV0=;
  b=Al5hgOL+ZMSi76/sbWYYIW6ZFSUyFpfptbQXoBYW5mgqFZGoxe5eyAhT
   FdHIi5NaG3Hd15P0QVB5f8y/w5RCIrJVOD1PJhG/3GTe3PhVDfY8Eosfo
   xFtFt9NQIDKO/ubc+XyDYRZpBuGve+LB7sJio00kpQOpyL+rBpBUoXHxM
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZsqB+DoB5lUrsYITRL4a6PIFOhl8/djoLYKbwu3kfqH7da4/TMTAuikKQOzVg67StXL2vhIZK2
 emcw5bo2pm6+lf2SgzV19if0rw1k4pRyosiufm0D6TMS0/C5Lzf+IF+GrkZgrUEynoYLzIyj0t
 Dci62QCIz/6u0xZe0m1cao+7Ua4NLN8lCz+p+e1XAfiZhT8o9J9hBzQ4eNZl0KPnl3eeR0fUNY
 ujr2RcCdZw1nn59SzEVD5yKpeqJ/cngUAvASpXQlrCYsyTml2EjVjbfnZ01+WJai9RcP5PFrjn
 h+Q=
X-SBRS: 5.2
X-MesageID: 35409997
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,345,1602561600"; 
   d="scan'208";a="35409997"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XR5xRZdt1J/shUw+zcP5rEUJeNLH9f5e8b1dqVI7WZjzrJEhFf6v0MX00L/Pt7eeZv73PxfyvOHP4JoT+4s4/MbxFR/eNGeNM2+EFi+XUOeXSfu05p9JfRspESBXeiB3p1XDV716SZZYaM9MnHmqkC4DOICvl5u8AyLdg0GGGHFgBUFsQ7RaDCfZ4yfRf+lh/zUZNYyREeKHofTj60svrvVycG1yAlhRBoor2atuivA/FcjVMOBi9hRDoiD72GTDrTBnADBLW1ewqTgKpa25rjr67kqxiOC0vlsUdSjbylEw3COaJg1MUPMAoCFdieDjlmIgjvypsy7esoprvSGV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZZ8szRmKBRvwzfNR53C4cv/rYFIInvXqRurisfEsV0=;
 b=M4zmNY/ywUhgyILoGhI+0vfuVGN7xwPatHIrTxQupimwQ0XV6RRiNoPwSzD1pNBN3uIeaC3rX0lmGA4sfj7hnb2795y4kcyBfZaPNwr9ogHVBCB7mOH/S5E3HQCxQ7W9OWAX++9/2lluL66dHBT7ol/LsoevoWrmGpcnfjtVeOrz6WyNyAnNJjsUJHi9KnHDTtY5XJTW2Vam9d2ouTz6Kv8C/UD1haPVGyJoiIjkolyqQtyfefp7JydtiqmFYh5lkWF4m9cZ4p1U0aMsk4FBizA9Yt0ii2idLKTcI7Q39mgX50dX+TLmn9z9Z5MscU7X+QbpbeJwIY1/wn1J8kV5dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZZ8szRmKBRvwzfNR53C4cv/rYFIInvXqRurisfEsV0=;
 b=qNRFfiQVb0l+vwofMpTxCrIdldexfCmEKyA45QgBVcyeXnz+7Zgadrv5OoIGe5y1GJdZ+oV6NwlkcF0rUENKK2lt1GdDT161xIzH5TaqNBJs0G+UXRLKKGSN7rA+O7+fihOMUIYOIYiSP9v4A3BjMY3rlTsbq7ZVCdXBH3m82y4=
Subject: Re: Purpose of translate MSI interrupt into INTx for guest
 passthrough
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20210112141057.xjbslkq2em56kk3r@Air-de-Roger>
 <20210112142529.btveobjtj45hcvg6@Air-de-Roger>
 <CAKf6xptsLxtjE3-MORi2eQ7ew+rMU1qPaxfPDpOu0Cz74-r0gw@mail.gmail.com>
 <20210112155159.mqhfkww4uflttdno@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5d8c11e4-a406-372f-c568-e7fbb2291ab6@citrix.com>
Date: Wed, 13 Jan 2021 21:00:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210112155159.mqhfkww4uflttdno@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::32) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d60c9917-7665-4c83-355b-08d8b8066bb3
X-MS-TrafficTypeDiagnostic: BYAPR03MB4280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB428030AC76BFAACD6007E9FBBAA90@BYAPR03MB4280.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Osd8cfsnxjLw9FoHgnoBQcwhSX0x3Gwt5x49Xv9DlG4T8G15eqTbVT4bHvtof69Oa4/0VRsvrj2NSoVqTN+oOp3AdW5PGnt50s8imMud0aA9nWyr+262Jrf7OdXNZO8otbotajR041wp5WN7ahyslCeKGf6RhxKAAwMKoLfYjcYrEyfhOoBuZ8Tf5q74O6vI9OgetWsrEM7Eil+gr8zH5XkP2rnIkRwhjQgXCOplbQ1zSwqBpjC97dMCKnZ0blR5OSX2TPI2CypcyY0IibDeLancPJpYhKuuOWnQCWh6QKftXFo0eNzOj3uzrBsPbA03irzaW48TkiOTll9sSM+3uaswE8YXczcNoVd080sB2BBX0JaKIlZ6/3QE01RSGCsnOkQixumfxEcwC8z0iV8lCQOJpgjqiOLo7DoctR29WL0FvMktTcttiXcjgt3l8N69fs58wMt6IvNTfMMSKewDUvq+CDFTxp5keBEjVuJkbdXTF36s3cCaF1NZezsBK0yqoYAyCyMhJ7Og8BPLiMy+vriDUugowpWWkmd/aP9ZVgEqrNZBJ6W3UcCFRNNzHXJc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(16526019)(26005)(83380400001)(36756003)(53546011)(6486002)(66556008)(478600001)(186003)(31686004)(2906002)(31696002)(66946007)(316002)(66476007)(54906003)(16576012)(5660300002)(6666004)(8676002)(86362001)(110136005)(8936002)(956004)(966005)(2616005)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: f5J8+tjVoQaXkTU8TzKErHshyLaDsssGUKzgv4XaLaF/TQRZBAk56yXbBhjXjimsOvdsG3Z7thUFmHpFBol4CefPQI3r1d3dF0aQudazUsyewlk5NTa/tqyRPGioFVDIqpke6AfmvHeuLwhCARyafb0bYytrc9WZd9Soj7NxeygSKxje+XJ8++oVe5wvZSNBswsIAkawanYfl0ZshWOSfM9sEDx9yN5iVx93V8cexuIfXWGSVh3KagfoojcTGc0a9jshFz80OesaBKJuDY7+mfKEf1gR5ejM6jv9nTOxNg64d1kieIi9f3R5v29o4ZJf+k9Vtsrs6pzdRtRmh7Qg3gnTPCGdRfKitVdtrag5bQkRtNMrOJA85r7U/BDtEwmlauZCtoeuj398yCqiesnso53jCK+GOjuhVmYuEX2W3M512Zahu3B21vY0jYUckhLlpnAlfL1ZHT/EZJNiftTcGsfGmysCCcXW6umyh3oxrCGsWxAlcHr1usAZcINXQ+Ng+H6gP5eQ6+h+IGLKdGCTGNvKYn99jMLYm0MZrR1I4rEd0+uprPbN14AatKXh4r2Nf53xOqZaR5lRG5YXisHTpvkJEbAuqFAuNcL4ibDcRZyifRSg0hjTs8Vrferbu1D2TaFquhz3ixP3hUEddGeWbw0TCymAdHfTkgJk3mG9XJoEk8oVaMd+UoioJSKyv9lrWPk5UbWUy0J9q4AFzoAP3SsR0gkOgpia1As7I0UXeH6pBZb50VpRxh2qnZITflV1ktZGtaStU9E7p/XIYkt4L2XmJvhrEOK/ozaSaeBbk0yEolCHinscOP3H32sZB9eUXav4NPtatstjuq3LJjgsULe+FTkaCr5Pm+hVqYs8j2ttv84EYfQJRXvh648WdYdHYS8cEVFZlZ9Op/iu+360oS6qd1pmSKqHMiStj4/7+9U=
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 21:01:38.8047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: d60c9917-7665-4c83-355b-08d8b8066bb3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZW8AiDwhuzJhK1nZne8svfLruKsRXBbLpraJ7nV0g/VCjT/RtH+Wpu82UgobA4Vt9nWXbVeK1rZJCvxBCZQMvtQHwghZktuipYYZR4FBr50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4280
X-OriginatorOrg: citrix.com

On 12/01/2021 15:51, Roger Pau Monné wrote:
> On Tue, Jan 12, 2021 at 09:48:17AM -0500, Jason Andryuk wrote:
>> On Tue, Jan 12, 2021 at 9:25 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>> Dropping Qing He as this address bounces.
>>>
>>> On Tue, Jan 12, 2021 at 03:10:57PM +0100, Roger Pau Monné wrote:
>>>> Hello,
>>>>
>>>> While trying to do some cleanup of the Xen interrupt support for pci
>>>> pass though I came across the MSI to INTx translation that Xen is in
>>>> theory capable of performing (ie: use a physical MSI interrupt source
>>>> and inject that as an INTx to a guest).
>>>>
>>>> AFAICT such functionality is not wired up to the toolstack, so it's
>>>> hard to tell what's the indented purpose, or whether it has seen any
>>>> usage.
>>> So apparently it is wired up to the toolstack for qemu-traditional,
>>> albeit it's disabled by default. There's some documentation in
>>> xl-pci-configuration:
>>>
>>> "When enabled, MSI-INTx translation will always enable MSI on the PCI
>>> device regardless of whether the guest uses INTx or MSI."
>>>
>>> So the main purpose seem to be to always use the MSI interrupt source
>>> regardless of whether the guest is using INTx or MSI. Maybe the
>>> purpose was to workaround some bugs when using INTx? Or buggy devices
>>> with INTx interrupts?
>>>
>>> qemu-upstream doesn't seem to support it anymore, so I would still
>>> like to remove it if we get consensus.
>> The cover letter from
>> http://old-list-archives.xenproject.org/archives/html/xen-devel/2009-01/msg00228.html
>> """
>> This patchset enables MSI-INTx interrupt translation for HVM
>> domains. The intention of the patch is to use MSI as the physical
>> interrupt mechanism for passthrough device as much as possible,
>> thus reducing the pirq sharing among domains.
>>
>> When MSI is globally enabled, if the device has the MSI capability
>> but doesn't used by the guest, hypervisor will try to user MSI as
>> the underlying pirq and inject translated INTx irq to guest
>> vioapic. When guest itself enabled MSI or MSI-X, the translation
>> is automatically turned off.
>>
>> Add a config file option to disable/enable this feature. Also, in
>> order to allow the user to override the option per device, a
>> per-device option mechanism is implemented and an MSI-INTx option
>> is added
>> """
>>
>> It seems like it could be a good idea, but I don't know if it presents
>> compatibility issues when actually used.
> Hm, MSI interrupts are edge triggered, while INTx is (usually) level.
> Also devices capable of multiple MSI vectors will be limited to a
> single one, and I'm not sure whether the transition from translated
> MSI to INTx into multiple MSIs would work correctly, as seems tricky.
>
>> As you say, it's not supported by qemu-upstream, so maybe it should
>> just be dropped.
> I don't really see much value in forcing Xen to always use MSI
> regardless of whether the guest is using INTx or MSI, and it's likely
> to cause more issues than benefits.
>
> IMO I think we should get rid of this, as the only real value is
> having Xen using MSI intend of INTx, but it's not introducing any kind
> of functionality from a guest PoV.

I find this feature very dubious.

While I agree that reducing INTx sharing between domains is obviously a
good thing, I don't see how the device can possibly be expected to work
if the in-guest driver doesn't have an accurate idea of what's going on.

There are up to 4 INTx lines, but absolutely nothing to suggest that
these would logically map to the first 4 MSIs enabled on the device. 
Even in the simplified case of only INTA and a single MSI, there's
nothing to suggest that the device will behave in the same way when it
comes to generating interrupts.

The difference between edge and line interrupts forces the guest driver
to explicitly de-assert the (what it thinks is a) line interrupt in a
device-specific manner, which in turn risks confusing the device which
is configured in MSI mode.

Also, it means Xen's emulation of edge=>line semantics has no clue when
to correctly deassert the line, without having device-specific knowledge
in the hypervisor, and appropriate trap&emulate intercepts on whatever
the devices deassert mechanism is.

I don't see how a feature like this can ever have worked, other than by
shear luck.

~Andrew

