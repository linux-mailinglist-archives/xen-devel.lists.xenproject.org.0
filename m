Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275DB338B85
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 12:32:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97039.184170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKg21-0007Rb-JW; Fri, 12 Mar 2021 11:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97039.184170; Fri, 12 Mar 2021 11:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKg21-0007RC-G2; Fri, 12 Mar 2021 11:32:37 +0000
Received: by outflank-mailman (input) for mailman id 97039;
 Fri, 12 Mar 2021 11:32:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qc+n=IK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lKg1z-0007R5-FB
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 11:32:35 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a38df6b-7e16-4a65-b8aa-f4703adb67d4;
 Fri, 12 Mar 2021 11:32:34 +0000 (UTC)
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
X-Inumbo-ID: 1a38df6b-7e16-4a65-b8aa-f4703adb67d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615548754;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aBdTnGhhrQSul1RZpz/EXTjpMCcAdamWjoRiBr5W5nQ=;
  b=fJQ5uhw0T4i2A1QVA6Hjcp67gO1Zud2lgLC3/jvOc7PLpqu4GlxcCIkh
   zPSlGNdbclY3cb7smu5SOy/GOkgEmeJ6FtJ4fzoJvFco53bUA87iz2sUn
   8ivMVjrzybB/jCWk3OK05T4tuca5JXQLMKDJixcMLOEWk8CGqlwc32ByF
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rzMie2vwlVT0QB8YCQxUjYL5mgG2clzUh59vXM0ty5F1XQwonPLDj1VvQ//udHrmy75FKa3MZ1
 vRhmywhAKc5E4XPmqNu/Qew7Z4kQ/QnOGNXxcaT5AsGfJvjS+hU8jvCd3Gsgr9J0SIFy6ciaF2
 T7j7zmR4OrJZV44MWl+wD5bDj/imWeaUyWZB+3Ok14j7Ux7FKGYtPFjJY1GkRU427ZuWvYC80F
 8svH8ifQPSuhReCnYgy+H94QnoWll26Bkt2PlK9wmyNOK7gZrYDV6lxJU/1EkYdRRLoSqX73Zg
 e54=
X-SBRS: 5.2
X-MesageID: 39050510
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:kwTN3Kqd/kjJKUlPFnZuTgwaV5uGKtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQb3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIJg/I
 9aWexFBNX0ZGIWse/T/BS4H9E8wNOO7aCvgqPkw21wSBxxApsA0y5SIG+gYyhLbSNBAoc0E4
 fZw8JBqSapd3h/VLXFOlAuWe/fq9rX0K/8aRkdCBI9rCWIhzWk6Ln1eiLoois2eTVJ3Lsk7C
 z5gxX0j5/Tzs2T5z398yvo75pQkMb80dcrPqKxo+UcNzmEsHfRWK1PQLuH1QpFx92HyFFvq9
 XUpgdlAsIb0QKqQkiQgT/Anzbtyywv7XiK8y7qvVLGrdbiTDw3T+pt7LgpCyfx0EYrsNFi3K
 8j5Qvw3PA2fHCw6RjV3NTGWwpnkUC5uxMZ4IoupkdSTJcEb/tppZEflXklYKsoJj7w64wsDY
 BVfafhzctRGGnqDUzxgnNi25iFUHg1A369MzM/k/3Q+T1XkHdl9lAf1cwSk1wRnahNOqVs1q
 DqNL9lm6pJSdJTRaVhBP0ZSc/yMWDVRwnQWVjibmjPJeUiATbgupT36LI66KWDf4EJ9oI7nN
 DkXElDvWA/VkryAaS1rdN22yGIZF/4cSXmy8lY6ZQ8kKb7XqDXPSqKT01ru9e8ot0Ea/erGM
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5ISR0+OmMTWMYfn39arMMr7Ff7IK3IJS2n/Cn
 wMUHzYP8Nb9H2mXXf+nVz/QHXoVkvj/Y9hMaTT8uQJobJ9c7Fkg0wwsxCU98uLITpNvugdZ0
 1lOo7qlau9uC2X8A/zniFUEysYKnwQzKTrUntMqwNPGVjza6w/t9KWfn0X+HOGIxR4Xv7HCQ
 I3nSUxxYuHa7irgQwyAdOuNWyXy1EJomiRcpsakqqfoeDoZ40/FZRjfKBqDw3EG1hUlG9R2S
 Z+QT5BYnWaOiLliK2jgpBRLvrYbcNAjACiJtMRj2neu0WarcQGXWAaQDaqbM6SjW8VNnhpr2
 w015VarKuLmD6pJ2d6qv8/KkdwZGOeB68DMB6If7xOmrfgeBh5SECDgTDysWB0RkPas2Epwk
 DxJyydfv/GRn5QoGpR3KrR/FRoTWmFZE5rZndmsYpyKHTeth9IoJ22T5v291HURkoJw+kbPj
 2AWzcULw907/2c1RKeml+5ZD8b76RrGtaYIKUocrnV1H/oFZaBkrseGeRIuLx/Msr1j+MNWe
 WDWgOcIT/iEdk10wiNqntNAlgslFAU1dfTnDH15mmx23AyRcfIKFN9XrcBPpWy6XPnS/vg6u
 QxsfsF+c+LdkP/Zd6NxfuJM3ptKhbPrXW3SO9tg5ZOpq42vKZyGZ6ecTag7gAx4DwOaOPP0G
 UZS+BHxZqEHKlFVckbYThY8Vokj87nFjphjiXGRssFOWgwhHraNe6T67XGqbATElSMzTGATW
 W3wml4xbP5RCON2r4RNrIoLUlXYEY67m5+/OnqTfynNCyaM8VC9kG9KHmzbft0T7WEA6wZqn
 9Bkpy1tt7SUyrzwwbLuzRnZopI7ma8WMu3RCaBA/RB/dD/GVOChMKRkYKOpQaybTuwcEIDg4
 JZMWQWc8RYkzEnyLQN7RLacN2+nmsV131E4T9mkVbx2o+ppEfjdHs2TzHxs9FxRjlcMn+BkM
 Lf1/OXvU6NuAR45Q==
X-IronPort-AV: E=Sophos;i="5.81,243,1610427600"; 
   d="scan'208";a="39050510"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6d/wjNPbY8DYbha1d6NEZNnvYc2nsMTR9ed+FO4jZDNlYwFlxsg5NOUXO0E7GK1ShbYYupmHV0ZQPBCYIV5RogcmVMOqr11kDwaDYrT6MV+LyMKBkn+zsT5ZCZ90sIGBlpv7Iz9d3DlUymAgV0UF4vyavsOnGgRozgWunO9EK1XJ0UbR7kx8FpJCHZgUKMM7EhErScD/eDfTfI1LgnmUbpOOmmp11erjO5HSkwK0JatG2ZtBlfxOZnoGHnoMoIsvb4Vr/+g2uvM46PA8N11f4gGJcdtDGcnORaTNXxtpaZwmqRJn8t1flUwchLBbg4LphXxkpy4SMlRvuzXpmnZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OipArakd9AaJeEKxw3eFbyi0e1wSm70+BLcthU5Ler4=;
 b=YWABBXS+vFEkeYh6Gd4FzHBsT72cTs77AuW1oJIYDQQEeh7K2PPRwz5hivlTpnYiw0MSZmECd/NyXP9XRGqEZWErvLbUnGtWbnJncag72XqmDG7WQ6wrdvALucUfDSHCQp28VysZkqHWt9ZRVuVrebzXSQk5nefpzpIhpEG8d8aA7AOx/LUVDndAY3gmE4mQgLMg3p8ofbPkKzRhewgChBh+UGcQipWDKSRiStwdiIPexqJkcSEl1qSqEtjmS9+IQv5bUOY1iQrGaNeLrDau7aEFarzVtyZT5OaZiIY+Id88vKOnCtuum/6d+/jM4YxpN/PXJnDKt2zAhwiKFMMLeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OipArakd9AaJeEKxw3eFbyi0e1wSm70+BLcthU5Ler4=;
 b=h5lsugTX7/IBtEURJTnVJUleQk0QHQEHMNpPCOSfpzgnttTdr1WDkfQFmgaO/D7xcd8VB/FOSMBWRzp1HpiHGwQ5UOx9S+S6MtyB3Fclco1/osv/mV+D+dYlIzwfqdOmpudGEV9TC0uu0JYj67EfR8ENjcggNulRSnI4RlE1qZo=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
Message-ID: <1642726c-0134-fb90-164a-e49672f613ff@citrix.com>
Date: Fri, 12 Mar 2021 11:32:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::25) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2642243-af7a-415b-cd78-08d8e54a853a
X-MS-TrafficTypeDiagnostic: BN7PR03MB3731:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB3731825EEDE61990E952CA6BBA6F9@BN7PR03MB3731.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RZULfqUhJmSTwGZrDBlWMaASPoprhswkijl48298jIqMVDfxWw8DOfctsylQx/Hska5WMBesE/anyYTI0Pp3/BfnrcFlITTEqiHL3iAtbPMXdPg58j9tTVrKZNSRf46TPQekCH81rytqB1E+SpI83st2Zg+jHCQOfQFH84YKEqAdKNoYjInpaTP+DhaHqc6FTXI6LCSTuZUijD7qHTYpnXGkiF7FTSmXjS0qdfVRJIXlSR++chTUX0ZYiL+JAiUMOeRWKaJxvKnOOPn2ZHb33BRerFTVQM8NIcwJ9pVprOtSTNxqqrq31Pj03Pgvw8UnWmEu/XDwdPi3PKsFd9gtkJ/tnrLlTfpF55isDKstNa4XY+gLjgoRYh8Aq2TVkQ6+IoATMIq4Bk9CjLe//OAWUWEQPBEPRZY4Y5hbdxmCvuqyYQqnaT3VL5/z2jtrDohykWQquXVujbukJNbHzHTgWXGlnNf6duevw/VfB2kCfeGcGWkk0pbi6607GJipV5wOQOqKNFoZvarocZ3q1aFo09psQVeqlg9zarqLCTiwZB/BPRhWVlIWXq5H/2q4WR2aqXmpRQcPMvyccR77TsysgoDbS+3u8IIUUdBYJhbfmHhWc+LlXti1TECHV6ZyVn8hdRGrWdDYs3S0VLyOyJoBOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(31686004)(66556008)(66476007)(186003)(26005)(16526019)(66946007)(8676002)(478600001)(2906002)(8936002)(956004)(2616005)(4326008)(86362001)(53546011)(31696002)(36756003)(6486002)(5660300002)(54906003)(316002)(16576012)(6666004)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QlNZOEhxOUVFbDR4eld5SXR0VFJSdlNwYkFBTDVjS2RHMEZHb2tQRzZjR1dY?=
 =?utf-8?B?cjhoR2ZJRlpPTTl4cGhYVmlPYUJBb0lLelRkMXk5RDI2U2JxUDZ2cjE4YTQ1?=
 =?utf-8?B?WlJKTDJzZmxMQ25PTVg1dzRWSUZlOVRkWGkwL2xadi9WaFlDU0NTZjlmNHdi?=
 =?utf-8?B?WkNBSTdxY0ljeFVGbHAwVGFKaWIvQSt5dnUvRkhaZDRqN2hFV1orcTRFZ08x?=
 =?utf-8?B?eWFyeTVqemR6aVV6cHdYdXVTZVF4YWhFbVI5TEdOYXdFc0UrWEthNzNrQ1Vi?=
 =?utf-8?B?aUUzQ0ZTQU9DRERDbEpMZHBzQTlOSWFMb3BXeTVrS2syUmRGZTYxb3d5eEk3?=
 =?utf-8?B?K3pIU2pkZjdTRVJFSTcrdWdjN2dGNityRHJLWlJoUkU5ajdPVU4yNXpHcndl?=
 =?utf-8?B?bERtN3BSVHA4Umx6Q2NQSHAzK05jQjdJMXFqaHFqaCtXcVcxeU1MNHhTcWhW?=
 =?utf-8?B?OEIrM2JvNUVUeUcrUkkzbHNFdzJReTZ4WkU4TksvTGVIckl3TnNtUHBRc3RM?=
 =?utf-8?B?Y3BuUXNxNHRlWU43eE9PcjNINVZzTEJGbkF5b2I5aWNZUE5vVFFEWVJsWGx4?=
 =?utf-8?B?aUFDS0hpMDZGRGc4K2dtRmZGbXkvMnFwTTQwSUdDSWR3b3M0TVhhLzZ1QmY3?=
 =?utf-8?B?RkhCSytMamloSVNScXY5UU1KV1E5a2hWRXM2NzByRlpiaFBXZE1kdjI4RnNW?=
 =?utf-8?B?bG1qNm0xK0hkY0FhRU5NbU9TMDFETTQ0S2dCWlZ5M2o3YUlidGZvY2ZCSHhP?=
 =?utf-8?B?QjQ2UEdFTFlDczVBNWdNajlZclZKQVFFU0UzL2lVV3NqaXJ1RWVxdnJLWWYr?=
 =?utf-8?B?QUJTc0FqNVluT3hhYUVHVzNaZGliM3c1Q1dKREFaSGwzSmlJWVJGN3dJUWhV?=
 =?utf-8?B?YkhqTFMyOTYrVzAxWlgzd3g1RUxWNnZIZHNYN3dtcXFuUjBVdTVjVmdxRmVI?=
 =?utf-8?B?Z3MzdU95WDNmMW9xdFNLSkROK05UK2hmK1NqZmtBT1VyVytEVjhLZjhpVDdK?=
 =?utf-8?B?Q1B1RGQyZmt2MkE0b05uWUJFSjhIOU1ibERxQW01bFY0WGExZ2Nzd0pYSG1j?=
 =?utf-8?B?RE9TcENFa2VQWU9DN1ltUlpQRlZHZU5sR2x1ZFhib2o3OUlHaG1RMWhML2cr?=
 =?utf-8?B?NmI1ckVtTTdJaklyM2dtVStsUEprZ3FlWjREdlIxZHphZk1aNlk5ejgzdHRE?=
 =?utf-8?B?RWFCb0EzNlVKSDQ1NnJsaWNBNmxBdHRzbWtoWjVCNXpDT2VnRG0zOUxpOWM0?=
 =?utf-8?B?RGdnZmthVmZHT2lJY1JsZzd6a24zclc5NmpzOC9ZWUEvZXRzZUNjczlKcm00?=
 =?utf-8?B?Ym04NnFDRGdPUmdjSXhuaXBEWCtkc3JLY3VKcDV0WXN4K1dMSFhobWhWT3FG?=
 =?utf-8?B?cVQ2WnNCMjQ1WERKMVJJdng1YncvNU9MYldsRms5ZWJrWmNwVXpYVXRqcWFY?=
 =?utf-8?B?THJ1QVlTNEliZ0NZUHdIVVRhV3RMNUdVZ0JuZWtrdXptWHBLbkJ0ODdBL25X?=
 =?utf-8?B?Vjc4ZktBSE5rMkgreHFEdkwzTGd4ZEpmMFBKNTRVNGNSUXQ4QVE3UUxoVnNa?=
 =?utf-8?B?d1h4T3dvWUdzaENnbmJ1NHpLOVFnTVc3NDFnRHJoUGxOQ1pkMEYyZlpkbTNY?=
 =?utf-8?B?Z09HL1hRN24zVlFtVEFDaFJxaWZZTTFDN3gweTh5NUk5YmdVSUtuVUVJWHBU?=
 =?utf-8?B?cXJ5OEU2a2FUWGFBdWxwbU9vMmxRaDZVb3c2R1pZM2llNTJSVDJiN0hPdE1P?=
 =?utf-8?Q?6A+JxkXx5eUfD35IgCF3SCYfF9fdUdMPtRSVfPp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2642243-af7a-415b-cd78-08d8e54a853a
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 11:32:30.0947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXSl+ISfacABkKgMhwrrDoDADbZXSyIgJoRBdFlAs2C0BDBWxZTUeFkVC8Tv/B3p2WNzyst1OfpOLk8XsoC/n4Hsv7X2pZBaWGmDosCWNiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3731
X-OriginatorOrg: citrix.com

On 10/03/2021 10:13, Jan Beulich wrote:
> Sadly I was wrong to suggest dropping vaddrs' initializer during review
> of v2 of the patch introducing this code. gcc 4.3 can't cope.
>
> Fixes: 52531c734ea1 ("xen/gnttab: Rework resource acquisition")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4026,7 +4026,7 @@ int gnttab_acquire_resource(
>      struct grant_table *gt =3D d->grant_table;
>      unsigned int i, final_frame;
>      mfn_t tmp;
> -    void **vaddrs;
> +    void **vaddrs =3D NULL;
>      int rc =3D -EINVAL;
> =20
>      if ( !nr_frames )

in v1, there was a companion check.

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index f937c1d350..2bb07f129f 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4059,6 +4059,16 @@ int gnttab_acquire_resource(
=C2=A0=C2=A0=C2=A0=C2=A0 if ( rc )
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
=C2=A0
+=C2=A0=C2=A0=C2=A0 /*
+=C2=A0=C2=A0=C2=A0=C2=A0 * Some older toolchains can't spot that vaddrs is=
 non-NULL on
non-error
+=C2=A0=C2=A0=C2=A0=C2=A0 * paths.=C2=A0 Leave some runtime safety.
+=C2=A0=C2=A0=C2=A0=C2=A0 */
+=C2=A0=C2=A0=C2=A0 if ( !vaddrs )
+=C2=A0=C2=A0=C2=A0 {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_UNREACHABLE();
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
+=C2=A0=C2=A0=C2=A0 }
+
=C2=A0=C2=A0=C2=A0=C2=A0 for ( i =3D 0; i < nr_frames; ++i )
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_list[i] =3D virt_to_mf=
n(vaddrs[frame + i]);
=C2=A0

With this reinstated, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


