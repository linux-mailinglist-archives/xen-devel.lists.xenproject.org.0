Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1A82F6A59
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 20:03:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67502.120542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l07tu-0004At-MZ; Thu, 14 Jan 2021 19:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67502.120542; Thu, 14 Jan 2021 19:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l07tu-0004AU-If; Thu, 14 Jan 2021 19:03:18 +0000
Received: by outflank-mailman (input) for mailman id 67502;
 Thu, 14 Jan 2021 19:03:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUaL=GR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l07ts-0004AP-O4
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 19:03:16 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f2b2ac5-2079-4303-9a8b-9d54689fbfd1;
 Thu, 14 Jan 2021 19:03:15 +0000 (UTC)
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
X-Inumbo-ID: 9f2b2ac5-2079-4303-9a8b-9d54689fbfd1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610650995;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=jCuAQzpxXSOOfSt5gCavhijqN08o0qV+SEzlObKWzys=;
  b=M91q+8hStjytHJUfho2JfTpyBrBu0zY9eKEvlv9YMCNokIC+2Q++g+4U
   JCPN+pIPCq7dffhX3kpGpR3Fk4Oh5tnqgCqPWmRCJwITUbGGgZbJoF/un
   WVjxPUcL0ce0ivEqW0aT+kYTLjwJJs4tH2NtcTTzioOM9AtKPcFHtmxE5
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OKCT7B6lSDTkjVvUw4r4dQgZ3ZmWoIYXTwmXBSPN8k80YxyWcwvMgtNUSlQv3vxiCDyPQJp0X9
 YgQH+gv1V5mFUMfekXT3o1hTSFQ5zW5EO7Qji9JE+miM1Le9FLWkTMFfAtFsVhNt5qnt/MCQq0
 KBb1lW0vH//6zqOhmaJEfbsf9FW3OHQlagX2wO/6t5hI2I+IQELCzmcaGZJDKAebPwst6CDlWh
 etDbWhqTvtWbT3rr4P9mnMPIAGkGPMDoaDfZwC0u3vfVIi5iSJ4Y0YkuHUx9rMnhD3HtGBoXYn
 oRo=
X-SBRS: 5.2
X-MesageID: 36410150
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="36410150"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhtOGHlwXJiDMu3Gkhe3x2VFUB2gNltT8la6rDy2Fz7tNhX1bqg06R9r0IQ9WzGzQ+ev38bmuhKaMaECnsPP10QFiwzjQE9V20h/7hq+2pWpr/DOsYhlQ76yWWroZfeRIjEGF6sXmHEtDo17KHHhOahvSx2yi3jChKXcaUvJswGLz5sU+4u1b05MHODi3ZI1lVVKPCjIT8Hj7dhwlV53XJuAp0y2BOn2UENw+vsdFDLPv88/LI3V9cBThpneO08qLRBHBCxdtGezdbxYc2K13xEQLul3Fm6Tfiopd1K0UmMufQbfQZDnyiNR6cPJ5iph09iRsUYv6GMp25LS6YyVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBHCE4jeaU0sVXAtULZF3unxtgpo28yScfAxHSlmfcQ=;
 b=UXUGULjyPNkBVS8wn9m7mHHxovEl7BIzWj8NgUXff8BRAkmrnCWNKjyvGbSrn3E+WfQnLlWUpafEQ/4gC0mJKE05ZJERIPrjXPDmyOcj/zUQMTCkiWUb4y8XxMsJZhZuD6ymxSfp71sRv5w65Di0/U5RgyeKq9k35tOZy5S+fuwqCxsKuqXb52b7ivN6QCiURsB31ccco2PTdl1wGOAdna6NStQvjKI7cS7gNc/tuDjFMTYF260al/iDcg0J+uqxJWD0TR6l/1arQ5HrGDBg4ZmPnHoOxzxArxxEZS+nCeBVQPIWVXjsCgwI0lxCnxWEeIuhLS4gq0K8Q2UyZdangQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBHCE4jeaU0sVXAtULZF3unxtgpo28yScfAxHSlmfcQ=;
 b=UnzQvugAhjNMp9ZSkTcB/19fPUMCt0rqwzSz54f578cbpD64oR82CTi0Rp8a3iTNOOJgUyNbbEkxPZlVtum97eowpwfeYo5353KOzLN/i033DFga6TtSzp6H0CPmFZV8iEvtYD7GGVc5OMTVc9xNBQSUYW9tbn6ESLT8vmap9sA=
Subject: Re: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
To: Ian Jackson <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>,
	<committers@xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <24567.7198.846779.557032@mariner.uk.xensource.com>
 <24576.27654.137226.608671@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
Date: Thu, 14 Jan 2021 19:02:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <24576.27654.137226.608671@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0491.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::10) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b247fb8d-79c2-47c7-2429-08d8b8bf08cc
X-MS-TrafficTypeDiagnostic: BY5PR03MB5112:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5112C964FDDED90E57E34826BAA80@BY5PR03MB5112.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cv1cHgy7JPUfPc1JQpU8g+ICRvDJ7CRIKfg2WhhGbryDmhXD6vi7FgynQLfDBoffLcWl8CCC1aYUwdiZzmUPIoHhOEdZhPmP3gvoIRxDVjXeiV1l3xqJW3f1vh7BLNAbRR82oIiVpM5aWkhkZXtm2M8UH/Iy40gEdNpw36mF01g09ceWaXda7wbSHpP5GZJLGESzz+KqkGvSLq3gLR3/pgMwXuV6dTHZ9xPWcO3GE/PmmAdNb0bjCq6GW0PY9v6zgWscYdS8exlugqsLsefekBvJmEEjP8DRrCTHCIzQQtqYOR5QnUixFnuh/CAdo05eNWEpJo+N7FbNOuisVw2jsUEin/6TOTW/0ilLm6kDHku7V57MuPZJuRxyI9wLePpcuFBN3lKp+3qmFBFKJ8Lvo3cQfoSDWzlLfnDyEpM4XNchyUAfQRr0veo0v09Gf3u3R9KO/CbQyay+oWXIZuH7w0jGV/QZBKOyNuhEnFyv/jx7LE5GFITaG2fXasInEZS1FuZSAyU2tIA5FZAbvypbO9DsPRCfRdFFzcN7dQ3tY5fIOF0d1sqcKerltfwqHbqw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(8936002)(86362001)(2906002)(31696002)(31686004)(110136005)(478600001)(16526019)(316002)(16576012)(966005)(83380400001)(53546011)(5660300002)(66946007)(66556008)(6486002)(66476007)(6666004)(8676002)(956004)(2616005)(36756003)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S2RMT3NUWGJ4ZDdiT1hFL0cxcFRyallySXlQMm5TUHhaZnVEWng2Tm9zRTl3?=
 =?utf-8?B?QjFrSU9FT2RNYlZIK1lQbVlQMEcvdDZsSnA4UFZUc3h2WGg5cC9MUDZJY0lO?=
 =?utf-8?B?WUNScG96ZkRmQktjM2Q5UVRJdzIyQlFRbVExOSsyNWVrUVlZLytzb0krMkEv?=
 =?utf-8?B?UDZTd1B6c1QyYklrTEdvQW4xaGZHSTI1ZTVJUDNOTlNXaG96R0U5ZHQ1dTJU?=
 =?utf-8?B?ZE9lOGFhdXlwc1pkNW9wUHZYSU5KQnJnWU5CbkJMWGNQN0NWdlJSMll6LzJC?=
 =?utf-8?B?ZUJBaHBKYjRGZG9xUUwrMzdyQ0N6dlZvS2ZNOGYyd2hjZHhZRjV0aWl3WkM0?=
 =?utf-8?B?dkpGTUlYMXRzK00reDVlV1BaQ0QranVhR044SkFnRkZSZXh3bU5EWHJGcWE4?=
 =?utf-8?B?SGtOWEd4aEVlbGJYVUJKaGc5ZFJIc2d6cmdIR2YwZThZb0huM2J2dXp5cGdy?=
 =?utf-8?B?cXh4bzNPQ29WZTIrRHdMVXZiL1lsSS9EWEVkL0xPcFVZMi90aU4yVWs0Y1RD?=
 =?utf-8?B?L29DT1RRSnhzNWVHdzM3YmNTMEJvaWt5M0lpSXloVnF3M1lQbEZmck5QZHMx?=
 =?utf-8?B?TmZuWjRnSm91b1ZlbWxpbkUyeE9nVWxlYmdBYTlna1Y4LzMvUXYyOXoxOGR6?=
 =?utf-8?B?cmk5aTBqOHl4OG55NHcrekpabk1pTjBXdnozNURlR0R1YitlMjRzVjE2UG54?=
 =?utf-8?B?RFpMV3ZESDhGdE14SnRWNEVWNUlUTE1DOTJzbXRMTjNvdEs0OFZ6bUxHN3pD?=
 =?utf-8?B?YlBtcnE5L2ZxNWE4UTZuaXJWM20yTGFUMHFvSnROYWpvdEtSaU9Pc0JHUGE0?=
 =?utf-8?B?eTFUMnlCM0QxREoreDRYMzNaTlhIZkhpNGNHaFZuZHFFelU0MzVEQ09ia1hw?=
 =?utf-8?B?SDFEU1pPVlRmQUN2OW1WT285NFJiVTNFWStHN2pZUEtPaHhGSnFtY3lhVys1?=
 =?utf-8?B?SGxUa2lEdWhOWnVDZTZaVnk5Z21iY2VzRlBudW94R2plVThpeE1Tb3N2QWhK?=
 =?utf-8?B?SUFpVDBNRFh3TWViRm4rQ3J2NTN3QkpWd2xTMTlwaERwYVR3YVZuQ1dWdmZR?=
 =?utf-8?B?NlRVTWFUSlphM1gyMWhvWHVtN0ozSTdDa2MrMVJuWVZsc0FVR2sxS1VwNHlM?=
 =?utf-8?B?cGdJbmRNai9YNkFRWkFwMmFUZktZb0Z2WDFoOXZBY2N6OS9YWHZrWEtsRmly?=
 =?utf-8?B?VlJrek1xOTVwL3VmWVpGWEJsSDRTYkpKejVyNXVOcXRDZlYwbjdTWnFRaytY?=
 =?utf-8?B?YStEYlFKOGptM2UyWFVhazdsSG5WM216WnVvUXlKclJBOTY2aU1IYnM5OFhR?=
 =?utf-8?Q?tX5svwU8ffEEH1QhDwJIgvNRy48dRCmx3S?=
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 19:03:09.5217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: b247fb8d-79c2-47c7-2429-08d8b8bf08cc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6wcnZP1W4I2KL0MijTuUl6GmyGbA3GZ33vIeRSjz3AwSZswrGJwcMnS5BQQ7mN3iZrkUct2Y5VA5hEn9aPl6IRjBFOZnam5yDBNd1N++sU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5112
X-OriginatorOrg: citrix.com

On 14/01/2021 16:06, Ian Jackson wrote:
> The last posting date for new feature patches for Xen 4.15 is
> tomorrow. [1]  We seem to be getting a reasonable good flood of stuff
> trying to meet this deadline :-).
>
> Patches for new fetures posted after tomorrow will be deferred to the
> next Xen release after 4.15.  NB the primary responsibility for
> driving a feature's progress to meet the release schedule, lies with
> the feature's proponent(s).
>
>
>   As a reminder, here is the release schedule:
> + (unchanged information indented with spaces):
>
>    Friday 15th January    Last posting date
>
>        Patches adding new features should be posted to the mailing list
>        by this cate, although perhaps not in their final version.
>
>    Friday 29th January    Feature freeze
>
>        Patches adding new features should be committed by this date.
>        Straightforward bugfixes may continue to be accepted by
>        maintainers.
>
>    Friday 12th February **tentatve**   Code freeze
>
>        Bugfixes only, all changes to be approved by the Release Manager.
>
>    Week of 12th March **tentative**    Release
>        (probably Tuesday or Wednesday)
>
>   Any patches containing substantial refactoring are to treated as
>   new features, even if they intent is to fix bugs.
>
>   Freeze exceptions will not be routine, but may be granted in
>   exceptional cases for small changes on the basis of risk assessment.
>   Large series will not get exceptions.  Contributors *must not* rely on
>   getting, or expect, a freeze exception.
>
> + New or improved tests (supposing they do not involve refactoring,
> + even build system reorganisation), and documentation improvements,
> + will generally be treated as bugfixes.
>
>   The codefreeze and release dates are provisional and will be adjusted
>   in the light of apparent code quality etc.
>
>   If as a feature proponent you feel your feature is at risk and there
>   is something the Xen Project could do to help, please consult me or
>   the Community Manager.  In such situations please reach out earlier
>   rather than later.
>
>
> In my last update I asked this:
>
>> If you are working on a feature you want in 4.15 please let me know
>> about it.  Ideally I'd like a little stanza like this:
>>
>> S: feature name
>> O: feature owner (proponent) name
>> E: feature owner (proponent) email address
>> P: your current estimate of the probability it making 4.15, as a %age
>>
>> But free-form text is OK too.  Please reply to this mail.
> I received one mail.  Thanks to Oleksandr Andrushchenko for his update
> on the following feeature:
>
>   IOREQ feature (+ virtio-mmio) on Arm
>   https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg87002.html
>
>   Julien Grall <julien@xen.org>
>   Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> I see that V4 of this series was just posted.  Thanks, Oleksandr.
> I'll make a separate enquiry about your series.
>
> I think if people don't find the traditional feature tracking useful,
> I will try to assemble Release Notes information later, during the
> freeze, when fewer people are rushing to try to meet the deadlines.

(Now I have working email).

Features:

1) acquire_resource fixes.

Not really a new feature - entirely bugfixing a preexisting one.
Developed by me to help 2).  Reasonably well acked, but awaiting
feedback on v3.

2) External Processor Trace support.

Development by Michał.  Depends on 1), and awaiting a new version being
posted.

As far as I'm aware, both Intel and CERT have production systems
deployed using this functionality, so it is very highly desirable to get
into 4.15.

3) Initial Trenchboot+SKINIT support.

I've got two patches I need to clean up and submit which is the first
part of the Trenchboot + Dynamic Root of Trust on AMD support.  This
will get Xen into a position where it can be started via the new grub
"secure_launch" protocol.

Later patches (i.e. post 4.15) will do support for Intel TXT (i.e.
without tboot), as well as the common infrastructure for the TPM event
log and further measurements during the boot process.

4) "simple" autotest support.


Bugs:

1) HPET/PIT issue on newer Intel systems.  This has had literally tens
of reports across the devel and users mailing lists, and prevents Xen
from booting at all on the past two generations of Intel laptop.  I've
finally got a repro and posted a fix to the list, but still in progress.

2) "scheduler broken" bugs.  We've had 4 or 5 reports of Xen not
working, and very little investigation on whats going on.  Suspicion is
that there might be two bugs, one with smt=0 on recent AMD hardware, and
one more general "some workloads cause negative credit" and might or
might not be specific to credit2 (debugging feedback differs - also
might be 3 underlying issue).

All of these have had repeated bug reports.  I'd classify them as
blockers, given the impact they're having on people.

~Andrew

