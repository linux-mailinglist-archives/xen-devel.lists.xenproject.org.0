Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876A4323DBB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 14:20:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89348.168207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEu4z-00012x-F8; Wed, 24 Feb 2021 13:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89348.168207; Wed, 24 Feb 2021 13:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEu4z-00012X-Bm; Wed, 24 Feb 2021 13:19:49 +0000
Received: by outflank-mailman (input) for mailman id 89348;
 Wed, 24 Feb 2021 13:19:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mT50=H2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lEu4x-00012O-IJ
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 13:19:47 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa6c802f-4a2b-433a-903c-f682eefc88da;
 Wed, 24 Feb 2021 13:19:46 +0000 (UTC)
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
X-Inumbo-ID: aa6c802f-4a2b-433a-903c-f682eefc88da
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614172786;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U5tDomzb85iVlXrYubYyW0d9mDUTX4a2KHOHlXo7OJU=;
  b=PuecgNBXgx52MY4TncxAr+vxANR63hEcrhHxArmx1e1DlvczWQqyJkwH
   sOP/RGJyKM7u3KtapHWFLsggzpDLUkzqfUMnUbs1JaBD+6MRWx56tZ6sH
   UxSdi2eKBPVgcODL/sglwLBcaytg3s4KpTRqCRRUVz4G4YFBYa0ciRQW0
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8SjJ09VYnBnjhFlRMP2dXrPB/MfQ9AhT/eUewo+tB6w5lzsh6sYzzYjKNtMgM7K1kCXVb868sB
 cpebFqRTYGE1tq/jvChDxamXoRlHhrIQyHehYz2sYMNEKup4SMpNUdr4R8RxXQauCNB3Qd8pvm
 nVjO9tgJZjhcFDg4l7lrxwcA+zD2KCkPeM0a5lgKKC/2J7yH05hopgo7V+PklaRjP2bk4RG0Gs
 mW49VYq/xy1603IPZxiq+25ktm0UVnQTU9QLG5Ug6WdNVfnS+qXx3aIvzq/ycbO38YPmPXTWDK
 03E=
X-SBRS: 5.2
X-MesageID: 38286341
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,203,1610427600"; 
   d="scan'208";a="38286341"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOp3XA7R+yLaaLssaHVR26Y+KK6+Xe603MDGipN225uKKCr5V6Cq62lI0HsDU5z2Db6YLAXicgyNCfhEUfm55yWM9VoUclwuMbgvQXYgWAPBrDxi9LBam8t1mQwSe47iWg2bsHOCt6Oks0iJk1w6eSVu+foA1QuQv9wtb0wDDHw9V0h1ALJTv/a53dQUC6yyPU7KygmfQexzApbQajGyhiGTWDovdgLHZepxDkwsRjcolm9K1ajavNPv+Y4ZYSZL/xe+FiQGwbsyn4IJP7AbOlJER8h/yc6M69MgR3bFlKGWBcdQK9py3c8hz/v552a9NHIwVgpDAmUgCIZBNfdddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5tDomzb85iVlXrYubYyW0d9mDUTX4a2KHOHlXo7OJU=;
 b=dB9nXTUIRDcRXKtuANYFMPRMUjYJZULRpabCiJ/yMYZbGM0DQaioXUsvHVUHn01wxHQAJX5fJwW581iM0GsSJDr9YvBVmYD27x0zNRu9oqTglj4DSEiFDrmoAO9RLtHaIWMZBAtm2Q5pS4N1qzyz3ZiqisYacm9avmecuqkg93otdVJNQiEITqpjroBlOfLFKUMDztN4W3I3k2VFp1kpMHqtPNR4hkt8vi3BCKRIIjFTokxxDt0VcP77W+HC74c6rtTyPixWWEgzxNiHzHHLC0+KAQiV3uFruelEmSbu4VHMLuxvJLip4/93pGaVxEyL8YVzzLQQox6i0XuFH2j8+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5tDomzb85iVlXrYubYyW0d9mDUTX4a2KHOHlXo7OJU=;
 b=xSqpQTRzlE2kD50MS8ROIHUEv+9yampM4OZP8K4BNm0dN6RN0l9NiOsGzTNdRVr4xamZiEB9oQXEbxCwa58r3vol4vBxS+rf89obmGU8R9hopav7bWsoo+uMg5S90XmKHfDCKPCCPVeuTBwpickkMK9k9xTFCXC4FuqNuMcztMs=
Subject: Re: [PATCH 2/2] hvmloader: do not include system headers for type
 declarations
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20210224102641.89455-1-roger.pau@citrix.com>
 <20210224102641.89455-3-roger.pau@citrix.com>
 <fb677f29-2b21-aaf1-1127-6774fb8e91e9@suse.com>
 <24630.13192.874503.894268@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1b251bb0-fecf-e5ed-c6e5-a2cb7c612cf1@citrix.com>
Date: Wed, 24 Feb 2021 13:19:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <24630.13192.874503.894268@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0257.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 964933cf-18f8-460c-d1e5-08d8d8c6d1d8
X-MS-TrafficTypeDiagnostic: BYAPR03MB4421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB44217FE3079C1CF4CAC5DED0BA9F9@BYAPR03MB4421.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mpMA3mf1wpiS6SFhIXFIMBcx4aMfQXjBrafXwBvbgacA4lNH1kirOiLal0KDl+RbWwCc7irtm200Xm5DpxPx8AV83FjcHguq137xWPpHbju4rBiXAcAgPSHs59bh1wYqq/fS3IUIlmxT5+r9CziZqbnkeUJDBhWIff/h+4g1YLPDU0WIK0UigxjvnT83ai7No/T9ej9fXBVK3wFmCkWAxZRdM4FoItsYXAItTerPq0P5yl2L2rAmRr+79ddoxme+pM0RgH8tNXVKHLMTEG02p+DRYQ5RXuYxNpmYVOKBtGxycGzUBy94GEYQVCBzeCj0ifmnew3GRySFE708NLk8duaL3tECUgtSCBZYw5uqw3a4X7dnlCPe2nwNvZuKDqGctJMYslCdswwcmQcyGHLAvWnh6yeQp1IhxqvKlq8vsVCH/X+mlLs8DeujyYqVkDqoOKkmeWiDUKQmql6FD2pMR0xPDQ1Vj89X8jcObC4Jba99lreH3eRj545yV0Ad71FYaJRP6YbSc9p8IkhiGsxJwo8vCsfOHIHVfxnIMx5H2FX9Z4aJLKk+7RWW2PqIFhZ3g8yJ4f9I5etT/aZqPw9mM5GLH5Txb0iYF9kusqUJBa0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(396003)(366004)(376002)(346002)(136003)(36756003)(316002)(53546011)(66476007)(6666004)(16576012)(31686004)(956004)(6486002)(2616005)(186003)(5660300002)(478600001)(16526019)(4744005)(8676002)(66556008)(2906002)(66946007)(31696002)(86362001)(26005)(8936002)(110136005)(4326008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bFo4SXlRUjVzSG9ZYW9YaTVOeDgwMTUwQkZwSUxDN01EUFAxVW13dndZYXkv?=
 =?utf-8?B?bURUSDN5REk1VHppaW9nNWR4dHBEQkZYY2RvZ0gvbEJlM2U1SnFmUmpuWEJR?=
 =?utf-8?B?TE13U0dQeGY5TXJaWGVRWi9lT1JYNmFrVnZjbzVFbGZRS081MVVybnJIM0x5?=
 =?utf-8?B?b1FpUVBZMnVtYjgra3ZlaUVVcnRvbWttcVl0dXpCaGN5Q1Fvb2RDNEsrOUtK?=
 =?utf-8?B?WWkvWUlmZ29DR2ZYRDZDamljTGhkRzhmTllkU1E5MlBaN29GaFhSQ1RKRDd3?=
 =?utf-8?B?aEZXN0F3alE3ZEJPSUt5UWg3ZkZBQVdKUis0MlhsZDdUYncvSUNKTkowTWhN?=
 =?utf-8?B?bW9ObHJFMGg0UmcrRUxLaW1BcDRRb3NjdWZ4TjNodG9qUXk4MFB4SDZMTmVX?=
 =?utf-8?B?MlFsYUdWTktQN3pONUN6SGYwSDRpdkVkdnY2T1BkTlNibDY1UjR4YUtpTWdX?=
 =?utf-8?B?OEg2bXIzOEluL3I5YjdxVVNvak5aVnpIZHo3bXNnRHhvdVA2a05IRDJWY2Vo?=
 =?utf-8?B?R0Z3d2xnRGhPbUNac0tiN0N6RHM5VlNXVkFxMEtPZnREYnBIcFB0SUloNGpi?=
 =?utf-8?B?VkdTYUVFQ2pISzlXaGdwWllSRnpCemdGUjI4bGVWVnF5YWE5UmQ1cWtwYTdt?=
 =?utf-8?B?UENVTStYQVZhdC9ZdVVKOC9BUWRuYXFnY2hwOVdidU14akVVaTNUY3VtZnZz?=
 =?utf-8?B?aGdtb2NwTVB6bW8rOEtLUzM3RzZPcncxZ21ia3FwTWtJcWxqYi9SRjBoMFVY?=
 =?utf-8?B?WExYMnZObE95OFNvY3dWdUxTNGhSMXFEQUtLOXV0ODBOdGNCSmRnL3h1YXo3?=
 =?utf-8?B?d3ZzWFh5N0JBSE8vL0hGUDd5cjkvV1VhNzM2Zm91Q2RxY0wrb0c2cjc3ZUF2?=
 =?utf-8?B?MDY2OEZ2YmZ2SmRGZlVsdmwxR0xEYi85ZWJoTWpzaGJWeWR2NGNaSGFTMDJ1?=
 =?utf-8?B?TStsZm5vMXV1KzJGRjBYZVVHT3JGeWZBbjRPems1Y0cvQUJWQTB0Z0ZIMDlq?=
 =?utf-8?B?QnFhWkpiVnJlbkk4eUUyaU9JYzhTaTgweTlHeWJZL2dmeGNHYkhSQ3FybUpO?=
 =?utf-8?B?SW05S3hwOHdHdEoybElYL3g1VVoyRWZNRDJLYk9nNm9IdXh6Y0Q3ZUsyQitj?=
 =?utf-8?B?MFhGaHRHM2pmL2lVeFdHR0Nxcy9kVGhxRk84NSs0NWdBaTBETGVGb2plVCtL?=
 =?utf-8?B?Q2x2akc2Y0hjYVpUalJzR3R6VS9ob1hKTi9CWW9JTklWSTgyYTVwSytBNWI0?=
 =?utf-8?B?YnIydlI1MFZDSVpOeGxsNUttM0RpQXRpVmdFMDVBZDNyN1d5NDV0N09vT0d2?=
 =?utf-8?B?YXNJbkg1dnJEKzNudjdSRlZ2dm5RN1FNZ29KamVJUG9BY3cwWGNmV3c5Ulp2?=
 =?utf-8?B?T0NKQlJ5dk5YQU1oWVpsZU9BeFdzTlZRNUM4QVU5RmRaQmdzQ1BmMXEyMmxM?=
 =?utf-8?B?Q3lIaHdtKzJlWVIwM0J6aVJpcG1zWkVWVkc5ektNSTNUeGljVm9aak9Eamtv?=
 =?utf-8?B?bmxOTVV3TmttcDgydFpwb1NFSHY4NzE2QytkL2hEL09xVWhrMWlNR2NTaGQr?=
 =?utf-8?B?b0FqQ2RzeXRBTFlaNi81elZnTFNteVhqeGkvK3E5dkZFR1h2dkpnRFB4ZUhK?=
 =?utf-8?B?c2FaMTdBY0d3Y3JCdnkwVlptUFRpNjMxb3BscEQ5SXlMVGhPME1OMmsyeC9Q?=
 =?utf-8?B?U3JTRDNhT3NOajZ6K1hwZWpvVmc1RS9hcTYveENJQklIczVUVU5JVzJLblJB?=
 =?utf-8?Q?nUAOn9tU22xYGri3+EVKyzBGGp5Its0sLc0r152?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 964933cf-18f8-460c-d1e5-08d8d8c6d1d8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 13:19:31.0176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uO9PArvS7uguG++y3AQnporAq58YPCx8eAwGCjnmbyRbDPslqq/DqJBlOtJD/hkAPQNI8wbqCcqIBIT3KKjuOKqLkNXw3NrmsNvJX8XjBjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4421
X-OriginatorOrg: citrix.com

On 24/02/2021 11:07, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH 2/2] hvmloader: do not include system headers for type declarations"):
>> Like the hypervisor, we should prefer using __SIZE_TYPE__
>> when available.
> I disagree.

size_t is obnoxious in the C spec.  It might not be the largest native
word size on the processor, and in some 64bit environments, it really is
32 bits.

It cannot be correctly derived from a standard type, and must come from
the compiler, because it critical that it matches what the compiler
generates for the sizeof operator.

Posix being fairly sane prohibits environments where the maximum object
size is smaller than the address size, which is why aliasing it to
unsigned long works in the common case.

~Andrew

