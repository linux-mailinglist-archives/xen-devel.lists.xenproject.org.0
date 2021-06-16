Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6238F3A9BAC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:08:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143080.263922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVHG-0001JH-B6; Wed, 16 Jun 2021 13:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143080.263922; Wed, 16 Jun 2021 13:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVHG-0001Fu-6O; Wed, 16 Jun 2021 13:08:18 +0000
Received: by outflank-mailman (input) for mailman id 143080;
 Wed, 16 Jun 2021 13:08:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vOo1=LK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ltVHE-0001Bf-K0
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 13:08:16 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d4303b6-94ca-41b8-9804-d5fc67abc46e;
 Wed, 16 Jun 2021 13:08:15 +0000 (UTC)
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
X-Inumbo-ID: 5d4303b6-94ca-41b8-9804-d5fc67abc46e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623848895;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gfB4WLnnfctfUdDhO9e+GdzqwsHatf4UDHelZqgdt9A=;
  b=iZQ/dPOEBn/udJuIRsZJiaeVOznir0B/zABmT8inTVMhPKdBaCo0sY+K
   26zsJ42HzVYeN8U0sXKRVPLnmwN6H3AOVOp7TtsVs3WgrFhg8hCgKcCUn
   NX0oPZ2jZCa0QU/v1AcF51rJbD63TPYzGL4+asRzwVd9UaH7xT8hBVrW1
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ua+CtNaeO+rvzfL/hhXb0jPXAeMPHNCKS6ywtqsyYUPueSJnRazBmBhxZcROrvz5Uzk9rVIXCq
 vReCZOmLenpNbfm8MmelxKHvlaU5J51bVDbFHv2jfgHiyFo6hXicRilA5Gygm0iJQhec28uE40
 dHWpkeQd3ZqXDPAUzmV+pxj8e9A8hBM1Ol+eX2wnU+dsITq5Z+SBC0zVTwKRlXXArUoTJaW+ym
 nwfA8EW3+rMx05QXJa1rSOBNgAc9N2bxINWAA4aOC1fi/SFVRABkPMGZkewCUFTaaxIldAjczs
 eME=
X-SBRS: 5.1
X-MesageID: 46261424
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:w/OMMqmH+a4Gwf8DyLxhQ6xdHBLpDfO1imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdG9qADnhOVICOgqTP2ftWzd1FdAQ7sSibcKrweAJ8S6zJ8l6U
 4CSdkyNDSTNykcsS+S2mDRfLgdKZu8gcaVbIzlvhRQpHRRGsRdBnBCe2Sm+yNNJDVuNN4cLt
 6x98BHrz2vdTA8dcKgHEQIWODFupniiI/mSQRuPW9p1CC+yReTrJLqGRmR2RkTFxlVx605zG
 TDmwvloo2+rvCAzAPG3WO71eUZpDKh8KoDOCW/sLlXFtzesHfrWG2nYczGgNkBmpDu1L/tqq
 iJn/5vBbU115qbRBDOnfKk4Xic7N9p0Q6v9bbQuwqeneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2K3oM3R3am9a/hRrDvCnZPiq59hs1VPFY8FLLNBp40W+01YVJ8GASLh8YgiVO
 1jFtvV6vpaeU6TKymxhBgm/PW8GnAoWhuWSEkLvcKYlzBQgXBi1kMdgMgShG0J+p4xQ4RNo+
 7ELqNrnrdTSdJ+V9M1OA7Ae7rDNoXpe2OGDIu/GyWXKEg3AQO+l3es2sRK2AiDQu158HIdou
 W/bG9l
X-IronPort-AV: E=Sophos;i="5.83,278,1616472000"; 
   d="scan'208";a="46261424"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBbjebTFX3Oun0Ft9HWc0byHl2kpkuMtOcknlQAl8hsmsPWpIxdFSM6pPeVGIdILyOZOxN8v009/NWZxAx4+xAA/Ht8TL/TBCyiHUUoH4Olu5BtgvIJQByZTYxkUm8tec3WnjOEZQWjB5mH5VEEeaKos+EdsHRnt4WtQlR+ZIBKA42oGclcvAXdhKLD3hup+6v0teyO+3aNDeEz6sc0U8jO5SuLsYRkJmI7vj87In1WlWiqu2cFE1Rv0YW2Hu8+r1/elFXER/UOsdj3Mzj4iRWUcEQM/sJn1QYV+ijf6sL/vVBdThQYpgt0LvuNMPbVqvPhEqMBQSSh5mjLk58HH9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5O9mg7xjMiZSLFM8fAN66veyxGTyxu0Qce0UXo8k07I=;
 b=R87pcTK7GOjdXbWF1Mm4tSriinywPoxleanpry7NnvD33CNxj18qWfcEnxNpUpu11J1ro/t/c5BKQ46LT0TqzzWoZXC9eSTuZFy40ZkhfS9hB/hBt0iAXc7RwMOI4eDgSqXstr/LhtbBKZEeGaGw/M4VhkvfEhMDdlNPBNP+nH6piICRp8naw+flbiYRDN59GyQa9jVP/PRpP9kE6Yo1XYvMTrAMsTo977I4ysWEltIbT8x2ebVv6kGiG4opc/kBnKASJIAItqrqnxptAR81NjxSfJLdMS6wTmieTNKwougrtluE2aWuVe/40LeEAeLWHeetpXD7ocvUTx52ORKeEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5O9mg7xjMiZSLFM8fAN66veyxGTyxu0Qce0UXo8k07I=;
 b=EsOYUW5e5ClKnfnsE6vRJPGxXTGjXfIdQ5CFSq0DdaWXS/RQE/1gsxHQ3u0Q2t+l9ErC+ogkiW/VHGEMNiJD+E2zK5+txWBAs7ns9xUswh6+dMdFrHIhU+tsQF0CWxaFDcYPxgwWifo6nvvU61rVpaGvRVgUhNwPGiW19KwzT70=
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210615161905.9831-1-andrew.cooper3@citrix.com>
 <20210615161905.9831-3-andrew.cooper3@citrix.com>
 <c59dae19-2a88-9449-468a-ab22d38fd0e7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/5] tools/tests: Drop run runes
Message-ID: <4a57467a-36ea-bd5b-7e6a-ed0dfaa33314@citrix.com>
Date: Wed, 16 Jun 2021 14:08:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c59dae19-2a88-9449-468a-ab22d38fd0e7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0376.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::28) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57002e7b-d8b3-4fb3-a4a4-08d930c7cb3c
X-MS-TrafficTypeDiagnostic: BYAPR03MB3989:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB39898DCBD749EB51D4AC7559BA0F9@BYAPR03MB3989.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EEZwqa9ocIae61Wd9CX5qlL+UH0l8dCU2AjUDYfwtnlIulfTSLJ6eeNPkbq3BJ5DCC4x0G879QIX43zUxBVLQ1fwjFBrbI8WJZ0uPnYvg07RwtkFLMuvmb8AGFE3r1jJFORLDruZezH2FyEDtJUhSMmJFkd65QJEWbuzO+FcmC08tqv8+vm6FqncsScR/WlngS4kIMK8jVBA8GWaWCgsnoONEvSGtU3Dn3znUMeVOstKIuRm36s9QThe4cE6ceJ63rolRK0RxTdoLZdRSYsGTi+0yr/u+mBQSFiOu6CMIKrTnCJ9VWPEYloBWblCoelEaJoJ4tad8EEvhvhHmrbCOfKNcJ/76iO8G8w7WnA2biqM/ubDv6/FpeJPuqG31RMBdtjBDaZP5MyoefdFRPHhDUoLFjhcw3XuwdJbGBCON23A9IiY/GXNYDrt7FrWYSK54y+gb/c63LdjR+tjzuV0h2HFq6UqTnAO8/vvO+cB1H6tAHbfGK3LUDkv2l4LSs89bldi2TCoxrNHQFEAmzRYzJeLwfIfR12EIdL1nFbCgHujf0E22HZSeNPAgb7rFrNsJ7ksu0sJkdJAcDVO+RpxM3HzBMCSUp2TtK4ATwdhSIa+vjjHkz6//Uujj95dT7nzKDT9+ixjVPCwaMP313vQpXQJFLhmaev3mvcMEokUdwufM1hpFnVM4HbLrUOp2YRD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(2906002)(38100700002)(4326008)(478600001)(31686004)(83380400001)(6666004)(956004)(2616005)(6916009)(54906003)(8676002)(186003)(5660300002)(16576012)(6486002)(53546011)(16526019)(66946007)(31696002)(26005)(86362001)(36756003)(66556008)(66476007)(316002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlhjMzd5ZFoyd3pYYmxvNHBYUXRJdW9oS0krQ3hxeWRmc1lkckJpc0FSd2pV?=
 =?utf-8?B?Q1VEWXdWK0xPVDRJNTR0NkROT05YQjZ5NGdYMDlWZXZHY0RhbWJNdjI5b1pa?=
 =?utf-8?B?L0drYWUvRFFIY3cwUFhTM1ppdkJPM1VLcHJMMEcrU1ByTXExK1dmT09uYnNL?=
 =?utf-8?B?ZkVXYzdmY3VPOFVuTW9nYXJSK0thUTVBelpiY2c0VmJjM3ZwMkNDbXplamNL?=
 =?utf-8?B?Yzc4UGlRVWdrZ0VGdWxqL1VpNU1UNmVOWUpaUGU0SFFWM1piTGp5WE9RaHJJ?=
 =?utf-8?B?SmR2SkkwVHZBN3l0K0tLZjZZUUhxWGhVa09nRmQvb2p1R3pVNUdlMCtRUmti?=
 =?utf-8?B?Szh2emN2L0piZ3ZhTEVGTkJkdkNMeXpTZ1pFVTdWOEE4bkpzTGlzY3BERWtp?=
 =?utf-8?B?a3E4WC9HSm5QS2dyQTJYYk5Nc0ZwZWdINm16RWFFQ3lxdkI0WDN6TkpGSHlJ?=
 =?utf-8?B?WmlZYnV4enAwSHhxRjM3V0lvZ3UwOHRoQittcnh1RXEwRTlMUjRFWjR3OEla?=
 =?utf-8?B?TmhWeDVFaEZMWmJOclppSTQxT2c0UXpOTjQzQ2Q1SDBmYng5Zks5eUt6WVBi?=
 =?utf-8?B?TTRDN0VpUDdLVzlhQnM4OFFMSXhoVWRQZFp0UTBHYnFMMEptczdzQUxZZkQw?=
 =?utf-8?B?TDlNa2NDTEg1bGJiOFMxaUlYWkxDZVJvYk82RmhJb25acDZKMUVNZWwyVVpX?=
 =?utf-8?B?NWZtOWZUcmNxeG16c1lMdENyRHdKdFBuTTJZa3podFFUVk14UlFjN0JZeEZQ?=
 =?utf-8?B?YmxEMThQa2k0eEVFcnY1YytLNlpoUzNlTWE0eHpQQU5zQVdnbDVrc1lGM0Rl?=
 =?utf-8?B?a094aDBGWmxJamNBd2tWRFRKWStLNCtqRXJUT3FXYW50cnpQS3hudkYrcFRu?=
 =?utf-8?B?U1h0LzQ1UG1UVUdzYUJHNDAwMld6N3NxV3dGNEd3M01LNnlDTHFXTnhON1pv?=
 =?utf-8?B?NmRaY3NyNUl2L25ZZzJnMlRLMTR6TkZxaEcvYitSMStOWkdVS1IrLzJKelpO?=
 =?utf-8?B?TUgwZnRSRTdiK0VLQTE5ZFdWOW0wbWZUUTdkTjBRZWQ0M1BjengyRzBEUGJs?=
 =?utf-8?B?Sm9wMEtvekxzdHlUZzN2M09sM3kxUUN0OXh2cWRpQklkQUEvcWlqMWVwcXgw?=
 =?utf-8?B?aUFKWmd5S20xM3N0N1pleFlnVDJDeTVNV3FxbTlocDFXTFk3Nk9vWDE1cjk3?=
 =?utf-8?B?alJ5SGdRczhsdXI2YWJTUG1TSWkrYVMrTU1yRkFBZjcwNlJPa1QxL3FyaGg5?=
 =?utf-8?B?aGFUUnBmT2JnVHNRbU1pR3dvaTcra2NpTjBHTFNSNDk3KzMrSGpBUnhFRFFI?=
 =?utf-8?B?NzZ4SDFZMmhVZVdWT2pFVkp6cUxkdW9yODJwTmprZFVHcldyRnI5bTBibzNt?=
 =?utf-8?B?MFM3RUduWlZRdTJOS1RDRTZoUUNmdlZ6Z1p1VDk1N0pXOTlZemxpNmR6NC82?=
 =?utf-8?B?eGl3anFCeU1tT3psbDZ1cXh2cVdGbUtBSUZLK1UyMWhnSzdZZmJLNzYvaTFS?=
 =?utf-8?B?cE5BbzRxUk44Z00wNnIvTEdVZE0yb3p6a1R3WVpzallTWHk5UUpYbXh0Z0hm?=
 =?utf-8?B?S241Mk9kZ2hmU3cxdlV5K1NzZ3kwSjZ3RzgyQXZWYVYvblh4RjlrZ2VDOEYw?=
 =?utf-8?B?eWFuTkcvekpnSGdLdmdxeWNjMDl3VGp3d05MRmd5czYrdk4xTTJHLytyNnpO?=
 =?utf-8?B?NmxLMVIranQ3L2wrZ2cvVGRxMUVjcmtDd1F3cWhtZmlWc2N3eUQvNE9lWm5M?=
 =?utf-8?Q?2j4U4vZQGuRRhmzx1VcpmPIyqYA0pVC+COjivYm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57002e7b-d8b3-4fb3-a4a4-08d930c7cb3c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 13:08:11.9448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sb49vt0rfAQivhXI0l3bm7SP5f3Tthhf6FbvVlIM8Ga66hBw6Z4QOZ+3R1EkVzmYT/H4lijlpqYFoWw6kg+LJ2OaTaNUqExLrt9CBlskCAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3989
X-OriginatorOrg: citrix.com

On 16/06/2021 07:44, Jan Beulich wrote:
> On 15.06.2021 18:19, Andrew Cooper wrote:
>> --- a/tools/tests/x86_emulator/Makefile
>> +++ b/tools/tests/x86_emulator/Makefile
>> @@ -7,10 +7,6 @@ TARGET :=3D test_x86_emulator
>>  .PHONY: all
>>  all:
>> =20
>> -.PHONY: run
>> -run: $(TARGET)
>> -	./$(TARGET)
>> -
>>  # Add libx86 to the build
>>  vpath %.c $(XEN_ROOT)/xen/lib/x86
>> =20
> This is not only incomplete, but actively (specifically here for my
> own frequent using of it, but other tests I do run occasionally as
> well, and then also that same way) harming things as long as you
> don't introduce an alternative way. Note the top-level Makefile
> making use of these rules, and note also the run32 companion here.

Honestly, this makefile is borderline impossible to follow.=C2=A0 I failed =
to
make the install runes work, which is part of why I deferred the
unit-like tests for now.

But I'm taking this as a strong preference to keep the run target?

TBH, this patch is a little on the side of the rest of the series.=C2=A0 I
stand by my commit message though - these are inconsistent, and buggy in
at least one case.

~Andrew


