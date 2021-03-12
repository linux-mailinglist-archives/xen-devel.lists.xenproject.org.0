Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A04338EB8
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 14:25:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97110.184284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKhnO-0002AL-BB; Fri, 12 Mar 2021 13:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97110.184284; Fri, 12 Mar 2021 13:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKhnO-00029z-7e; Fri, 12 Mar 2021 13:25:38 +0000
Received: by outflank-mailman (input) for mailman id 97110;
 Fri, 12 Mar 2021 13:25:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qc+n=IK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lKhnM-00029u-Nf
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 13:25:36 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d85cf464-ae16-4d58-81e6-465d03456dc0;
 Fri, 12 Mar 2021 13:25:35 +0000 (UTC)
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
X-Inumbo-ID: d85cf464-ae16-4d58-81e6-465d03456dc0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615555535;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lydewPfH7Tzl8FhZHSk4hXXumUbUIRPZWmgAHU98C0U=;
  b=AjZ0fVnYO7O7DDSoPEnEwXPXSUvOApNR2ZdzzvO3SrtZRH9r94Ml9iRp
   bLIUDTJQ3GdomnJEwQohpO7arGx7IE4nY5PGQQnZjztVX+8RHfqxTMskW
   pEsZAUDrtN90ij9Ds+VE3Uf/UEORkEEEbTZAIUE33v/sO/K4fwSkTkDwh
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hcYBs6402z7ru3IdTAu71+W97MMJBDsTliZ0ZRkr11agwfEb3mRhbuQHbxuZ7KgV93P447bcjV
 Gcr4eyHLKIr8St7krbmaGcgM6TRvwOu7Cx6ZjS29dNQUqPjl9AlGEX2rNSpDi7uVzsiGGEqlON
 4RyKP4DP0qia+MqPIIoFzVVAGQcu+vjQ9z5+9le+c6KA5yCtiZbRuUjWrF2tKrdMV0TkGlctC+
 iI0aCCD8kbx4tk0H89jYpxHx4VtTHBHzXc2Jkj/R1yH3hcqJpYPsQV7DMaP059hyUZtc5cbZ7J
 jwU=
X-SBRS: 5.2
X-MesageID: 39161645
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:1VX9m6Pohb+tscBcT2zw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsa9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrwHIMxbVstRQ3a
 IIScVDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RZQZCtBApsQiztRIACdD0FwWU1iDZ02CJ
 KT6qN81kWdUF4Qadm2AWRAYvPKoMfFmImjTRkNARMm7wfmt0LV1JfRFR+E0hACFw5e2LtKyx
 m5ryXVxIWG98u6xBjVynPJ4/1t9ufJ59NfCKW3+7AoAxr2jALAXvUGZ5Sju3QPrPir+BIWlr
 D30m0dFuBSz1+UQW2vuxvq3GDboUUTwlvv00WRj3emgeGRfkNCN+N7iYhUcgTU5iMb1bkWus
 I7vBPti7NtARzNhyj77dTTPisa8XacmnY+jfUVy0VWTIp2Us4gkaUk4EhXHJ0cdRiKirwPLe
 8GNrC42N9ra1+AK1jWsm5zqebcJUgbL1OtR0gPvdGtyD5GnHx15Ftw/r1vol4wsL06UJVK/O
 LCL+BBk6xPVNYfaeZHCP4GWtbfMB2DfTv8dEapZXj3HqAOPHzA77bx/bUO/emvPLgF1oE7lp
 jtWE5R3FRCNX7GOImr5tlm4xrNSGKyUXDG0cdF/aV0vbX6Wf7CLTCDYEpGqbrin9wvRungH9
 qjMpNfBPHuaUH0H5xS4gH4U55ObVEDTcwuvMohUV7mmLOKFqTa8sjgNNrDLrvkFjgpHknlBG
 EYYTT1LMJcqm+xXHvVhwXQRmPNdkTz8YkYKtmew8EjjKw2cqFcuAkcjlq0ouuRLydZj6AwdE
 xiZJPr+5nL4VWezCLt1SFEKxBdBkFa7PHLSHVRvzIHNEvybPIms9WbcmZC4WufKnZEPoTrOT
 8ag24y1bO8LpSWyyxnIcmgKHimg3wao2/PaJsAhKuZ54PAdokjBpgrHIx9fD+7ViBdqEJPki
 NueQUETkjQGnfFkqO+lqEZA+nZap1bmwekIcldrFrFrkWCrcQTRn8WNgTeE/K/sEILfX55l1
 dx+6gQjP6rgjC0M1Yyh+w+LRlxcmiNOalHCw6EfY1QvbjudGhLPCG3rA3fryt2Vnvh9k0UiG
 CkCSGPY/nEDmBQvW1i3r/w/El5cXiceExMeml32LcNZ1juizJW66umd6Cz22yeZh85zuYRPC
 rsTBESLgltrurHniK9qXKnLzEL158uNuvSAPAfaLnVwGqqM5DNv7oBBeVo8JFsM83OvucHXf
 mEQRKcKCr1BooSqlWoj0dgHBMxhGgvkPvu1hGg0XOx22QnB+HOZHthXLMWLrinniHZbsfN9K
 88q907veG9aDqsLvGHzLzadD5FJFf4p3WsQ+QhtJBTuuYTudJIbu7meAqN8EsC+hM0aPrQvg
 c5Zo9Q5bjaII9hf8AIYUtijxEUveXKCHFuixD8B+81QEokgHDaNe6Y+ragk8taPmSx4C/LfW
 SF+yJT//35TzKO+L4TBaU3O3lXYiEHmQJf1dLHU43bEwOxce5fuHK8L3+mabdYIZL1VIk4n1
 Jf49uSmfWQeDe98AfMvSFjKqYL12q8W8u9DEatHuFPmubKdWiks++P4MSpii3wRib+Q0MEhZ
 ddfUhVV/99sFAZ/cUK+xn3bLf2rEIjm0Zf5j8itmeF4PnZ3E7rWWdcMQPYhZ1KWyJ0KXbgt7
 WczdSl
X-IronPort-AV: E=Sophos;i="5.81,243,1610427600"; 
   d="scan'208";a="39161645"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVPnCPHSBZxlwk8WToU/xTtEarTKilbmgijvTUisz6l1+/WfwPYRdUaHH9RAuhrYIfg7/6upNzQKwYF3IozGD4g5nyBdeqB2oJCp0I5saNqaISBeEyk8bPLWu6JUM3LM29VCN4g+/9CAhGv6oAFeCAI9xHpCAMhhyIUDj/Sybp1xnpcmY+runSCYz0xkcfFOAvl1gtfQ6wfm02XXitOO6nMpy2mM3pFQXhJFlqzR8EAgoC/NHqFJtTys6sfRCQKoLKscJsBX7CfOLw/0wtRTMm+C1neMw1vw/Wo1lVWtEYZrI6zZIvXRS8XTgQTP7jGsPoOcmoe0oNBw2CyO+mXB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uwt255OP6dwuelu+TJrjEQQibtbltatYNSr7c26diKE=;
 b=VlkFShxZBbR4lQ69trMtR8gvadEzY7i17jWuUGxdb1fAVWfVsBMZPL+yDm5IYxuEF+SnaMn1994LK7JVB6o3d2+2lVaRwFlQBgZAbBBTWwLdovju0ItEE55N/esTcGSk1AaSZ5GgTD7LxPizA0+BWtuxUMD3r3zoaWK857Zvagkca4pLZhmvziyORNEzjZaPz2eGyhuVwI1BMyZ4nGxhgeq/RKt6BveM3n04LGuq7jRoIXAUsYBNJ6m2vhDDbpEGYjjR1HX0gc4ThbLM9gYoWvBQZjgH3eyvsjxFAeTlbEJWf0r6mYqNnMuVDBVxYAlFVgCfZlic80cK2Em8k/S9+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uwt255OP6dwuelu+TJrjEQQibtbltatYNSr7c26diKE=;
 b=Cz607iMRaD0ciHcuNCbXkTKEQSI7gjocDdpUUqwqlKUl8WnjT8wzUXCNekLHJ3dyVswg13EuN/e2usQqdr4AQxIjbC0P9WgpUy+thzL/Z6yZpf7Vx2iwj2CedQzADN5rwsDR1x9gRodatsCT7MGLQFVLFKfcEC2PMItmaFrkW4w=
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
 <1642726c-0134-fb90-164a-e49672f613ff@citrix.com>
 <81539e7d-6b3c-8261-6959-67ef1dc136bf@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4722bb38-387a-7bd2-12fc-87dcbde48d4f@citrix.com>
Date: Fri, 12 Mar 2021 13:25:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <81539e7d-6b3c-8261-6959-67ef1dc136bf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0445.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::25) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6233838a-c069-406f-78a7-08d8e55a4ae8
X-MS-TrafficTypeDiagnostic: BN8PR03MB5121:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB5121EF8395C1EC246A4CE6F9BA6F9@BN8PR03MB5121.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hsg5n7Scfqk0+K/W9QhsBZZKbzN9HinYBB+Mnk9LtBQbiEIf3OHHaCAlJwK1ABv3AEBfnUWP4zZrOxiWejLDrQl0u8W0zDAJlr+ihRVUjipcYOQ82+DDCwgfKUxPrjYYa11Tsn2AtlvGexUedxT6vNXh5Zjaez8ikd/GYpBLexT/BycDKwcrPJ239sUJbuEwsg4J9uipf0Znx4+HO5rCMQ9tWXcIGkhPb040m3/doQT5SOYHP8e4zJib51fTeXiZnHX/3ILrSBaFQbVp6CZCvGqWWMLAHIX2iXVEXoCGMUtrKLMyek5XpOoTSkamgl8P3grtjsCfBP13NXp5yKdgOrcN3mPDzwGaxITnUKg3ivgttP35YbTgOSFlnnlO3F5fxxwKaM+2vTmh5xO/N2rRsQcU/k54sk9tygBX6E27c5ZpZD4A6J7kyANeK6N4c98uZEjWbXs00xGmzBpNab02eZCkeUHZ/Uo2BD6Ii/ep2LVmM7MvR0jgu4OPq88edx8Y+SB6Sz8OGIx3JX0hhZKxzuJYlKr9mIyMvjA4pVJ2xRGKpQjf88cLZKK/1GBNnGBZjGLCAY49YbzCKh1e66WTdnPy0JjFMIXzJfGVnkels58=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(478600001)(5660300002)(16576012)(4326008)(8676002)(86362001)(316002)(31686004)(36756003)(53546011)(54906003)(956004)(2616005)(2906002)(6916009)(31696002)(8936002)(16526019)(186003)(66946007)(26005)(66476007)(6486002)(66556008)(6666004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OEEzWmsvYjhyN1lmTGdDQndLUWROTU5maFZwNUtObHQyK2p6ZDVNdjJMVjRj?=
 =?utf-8?B?Vy9ocEZLODBTejBzam5xQkFXQWxmL2hDWkxlcWNyLzh1V3A3WlJSMTIyQ2tz?=
 =?utf-8?B?MVZvNkFnT2Y1cDJvMHBQS3F5NVZ1ZjVibmJESG9tKzBkcUNjMC9vTSs3Y1pC?=
 =?utf-8?B?UVVNRHk4cHJvQUtCU0xNOFBScW5SdHRSbXBqVkxCci9sazJjZmFHSndiano0?=
 =?utf-8?B?dVQzUWowaFBWbmZhOVppazgvRlcrYW5QbXdCQXY2dFN2cHVRdVFWKzZuWmZt?=
 =?utf-8?B?djB0aVVXR2lRanB6SFlEdmZOc0w5WmFTQTJ6dTRDK3ovRUhuQkQ3QVA1eUxW?=
 =?utf-8?B?MWRpWDFSM1BzTU5PakJnZGNiOS9hS0lRR09TQmQxcGZUN3BYbDkvbzFoSTZS?=
 =?utf-8?B?WUlHQnNkOGQrV3pETUdLaE9oOUpVLzcrNHlBT1Z1cEhiRmN4NUlrSzN6RXBZ?=
 =?utf-8?B?b1JsVmxxYjI4L1lITW5nVytlclA3YXQxMDYyMExyWTdwdVA5TEhUUFFSZzEx?=
 =?utf-8?B?ekRPYnkxcUpUQnhqMlMwNWt6dnE4Z2hyMVZPaTRnLzRMV3dQMDdMVlZzMWly?=
 =?utf-8?B?NnAwbUdhZWkyNW1PdnNCZzRTcnViZm91SFpKb3R1OW45VzRUeVhnc0V3V0xv?=
 =?utf-8?B?eWlranlBbDhGSmFmc2paY2lYTUVNUmdOZUx5ZUxjeHRlQThuK1E1ZFJ6dWFt?=
 =?utf-8?B?K1hUbnh0L2Z5czRkMTBsbklKbmJaK21zeDFOQ244WDRsSlRhMXYrS3didzlT?=
 =?utf-8?B?YnNGZUdwRUkrYnM2ZUs4ZWxEMGRrYi9Cc0w1YzJUUDVBV0RwOS80WXBFODE4?=
 =?utf-8?B?MEhpZXhGb0d0U1NrUjNKVHYyTlFhWkZlSWRPc2QvQTNlNWNDMkhVWUZMQVlx?=
 =?utf-8?B?S254VHNuM2VON1VEc0V2TjE4T0FDU0ZCYkVLSDJzcXZVV04xK3JJQW5ZSlBZ?=
 =?utf-8?B?R2NUekpKNCtKdHhBWFB0MGlGNTA4dzRreG9pbE9kZzhiSm9iRDJ3Q0tvMjZy?=
 =?utf-8?B?SXB1NGhkTFRBblZnTVVxOW54SmsrMFhiRXFQU3M2UEF6OXh3M2tmNS8rb3Fy?=
 =?utf-8?B?M3RYME1qWGZGSXRhVGl5VEw1aXlIQTUzRTBtWVgzeDlkMUg0K0tzL1NxK3Rh?=
 =?utf-8?B?VEMzMUV1TTBpUjdMTmFtRXB2T1RaNnBnZWdDQzlEemFDTmJXK1ZCTWRBVGp2?=
 =?utf-8?B?NUZMSkpUODU3c25uUGZXR3BWUFZQRjk0dTE1UDBId0RLL2REa2tncnRMR1l4?=
 =?utf-8?B?NC94OGY5Nno1MVh3ci85Q01HSTUyVHVPTlVjRUJyelZ4WjJyQ3AzdmdnUzMx?=
 =?utf-8?B?cU42aGZwNGlBZXlDVjhjcGlHak4vRDdldWFSdjI3TjNwdHJDQ0JVTG1IYjVT?=
 =?utf-8?B?UkNjQ042OGt5Z3ZReEJNNDI1Y01ad045K2p2cmJTKzFEdjlPUnNBOUVtdEpa?=
 =?utf-8?B?S3Z3WUJNemlKaWdVMjdTS1lNSUtuMDBhL3puTURYeTNqR1FHanBhQ1cyRGo5?=
 =?utf-8?B?eDltUFh2akpaNExMcUUyaHZaNktoR0RZS0pmYkVGTWxYOXhySEJnNTFZaWdp?=
 =?utf-8?B?aUdMYjlIb2JLNVJQckVwWWlKWEx1RHhpSnA5cXZKdHJGVG51VEg4dERrQXFF?=
 =?utf-8?B?ZlJkcjlhaVVFa3R6RjVQVVBub0NlOHB0RTRkRTZDcUQ0bnNuWnBrVzVieU1C?=
 =?utf-8?B?Rlo0ZzBhbXpNQ2UrbmtzYzVJK3ZvUTVkN2RTM2VqU2VFY28yQzgvdFlOZzRi?=
 =?utf-8?Q?5VeQioFlMYvj6Sc+a9UPa4RRMeOeA59VJPFnhJB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6233838a-c069-406f-78a7-08d8e55a4ae8
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 13:25:24.0781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sM2516WTByocLiq8NCTPf/suNXGxJv8vL7EPayzaIXWZfWGkhec0AaOYDlBKCj81mV7lPZm7xx0WLYV3yaWaNCsNqYEkQ+KV76mimhp5Y0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5121
X-OriginatorOrg: citrix.com

On 12/03/2021 13:08, Jan Beulich wrote:
> On 12.03.2021 12:32, Andrew Cooper wrote:
>> On 10/03/2021 10:13, Jan Beulich wrote:
>>> Sadly I was wrong to suggest dropping vaddrs' initializer during review
>>> of v2 of the patch introducing this code. gcc 4.3 can't cope.
>>>
>>> Fixes: 52531c734ea1 ("xen/gnttab: Rework resource acquisition")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -4026,7 +4026,7 @@ int gnttab_acquire_resource(
>>>      struct grant_table *gt = d->grant_table;
>>>      unsigned int i, final_frame;
>>>      mfn_t tmp;
>>> -    void **vaddrs;
>>> +    void **vaddrs = NULL;
>>>      int rc = -EINVAL;
>>>  
>>>      if ( !nr_frames )
>> in v1, there was a companion check.
>>
>> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
>> index f937c1d350..2bb07f129f 100644
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -4059,6 +4059,16 @@ int gnttab_acquire_resource(
>>      if ( rc )
>>          goto out;
>>  
>> +    /*
>> +     * Some older toolchains can't spot that vaddrs is non-NULL on
>> non-error
>> +     * paths.  Leave some runtime safety.
>> +     */
>> +    if ( !vaddrs )
>> +    {
>> +        ASSERT_UNREACHABLE();
>> +        goto out;
>> +    }
>> +
>>      for ( i = 0; i < nr_frames; ++i )
>>          mfn_list[i] = virt_to_mfn(vaddrs[frame + i]);
> Oh, I didn't realize this. Will add, but did you really mean to
> have the function return success in this case (on a release
> build)? I'd be inclined to put it ahead of if "if ( rc )" and
> set rc (to e.g. -ENODATA) in this case.

Oh - quite right.  Returning 0 here will hit the assertion/failsafe
protecting against livelock.

I'd be tempted to chose -EINVAL because the only plausible way to get
here is a bad id, and that path should have errored out earlier.

And yeah, with the rc adjustment, fine to reposition.

~Andrew

