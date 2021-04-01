Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D690351577
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104507.199945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxsN-0001IV-Ud; Thu, 01 Apr 2021 14:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104507.199945; Thu, 01 Apr 2021 14:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxsN-0001I6-RT; Thu, 01 Apr 2021 14:00:47 +0000
Received: by outflank-mailman (input) for mailman id 104507;
 Thu, 01 Apr 2021 14:00:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRxsM-0001I1-7y
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:00:46 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58d20fec-1f3e-489c-ac47-f51429ad5397;
 Thu, 01 Apr 2021 14:00:44 +0000 (UTC)
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
X-Inumbo-ID: 58d20fec-1f3e-489c-ac47-f51429ad5397
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617285644;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=C73Pd4ceP/D/YEBjUB7YwX9APTcL/8vrdofjkKqfH3E=;
  b=fomrScFzysX2zkT6//obF7n3xOlelH/97n7w6E3eS0/EcXarGFh6kL9M
   S/EIU3craOFoV3//QEmZ5Dk+AbikjsBiUNCxyDh5kCTSPQt0eJC9lORN7
   eX5o8DND6lvTTft6GUypwfPhG44dfartIxZb5BfajuOPJt76OuNVF4TSE
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: szbrlNACxLrexQmE1Oc9RstcF2x+WnndYYhbsUgOlnOECH7bgMn/jClUCRck1hhNSABb1rt9Mv
 SVmcQKwLD3WOJdIUZk7YwN/UiUoxL3IALrqEHMG5aouh8qLikRx4C6fNUAVc1ryzhavj8sg3nl
 EyF4Ypi/NhjBTxd5DRjGh5DJyzS9p9Bqdi+qgtjs4ii5IoQgP4r3UTcUQUNsO3P+UX0ICrMP23
 f7XRFSOCP3XN8oqGDIJA9Ov5qi7vt8hfqghkqe0wf0CPQZdph0hiaoJ4skWUQ8MnDDqVvKPtUS
 UCc=
X-SBRS: 5.2
X-MesageID: 40700716
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YsI9paoKu1xG8O5v6X8f0wkaV5uGKtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQb3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIJg/I
 9aWexFBNX0ZGIWse/T/BS4H9E8wNOO7aCvgqPkw21wSBxxApsA0y5SIG+gYylLbSNBAoc0E4
 fZw8JBqSapd3h/VLXFOlAuWe/fq9rX0K/8aRkdCBI9rCWIhzWk6Ln1eiLoois2eTVJ3Lsk7C
 z5gxX0j5/Tzs2T5z398yvo75pQkMb80dcrPqKxo+UcNzmEsHfRWK1PQLuH1QpFxt2HyFFvq9
 XUpgdlAsIb0QKqQkiQgT/Anzbtyywv7XiK8y7qvVLGrdbiTDw3T+pt7LgpCyfx0EYrsNFi3K
 8j5Qvw3PA2fHCw6RjV3NTGWwpnkUC5uxMZ4IkupkdSTJcEb/tppZEflXklYKsoJj7w64wsDY
 BVfaPhzctRGGnqCkzxgnNi25iFUHg1A369MzM/k/3Q+T1XkHdl9lAf1cwSk1wRnahNOqVs1q
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
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40700716"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chzLzPIBjaRAaMYlcGfOnEGgIpdxbUdjRWwD1hh5xE16qVlGz+yPxPGr1KEcGunUkbOBEH7Gm1DWuj+ECOhEpwgovo23ddQP1eLlj+WEKIn91uUSmBfNQ1uwvMZZiZlFMdxanoMEOQ1Vy4hfUT58FfwOU84I/HC7Nr0mUMBBkRZNRjSiXTu1YT/jqnsOU6Q++nZEWerlnAOt/op987FXBSUSRcLzuJPjueZaEvrtlwpC6lq2CCcGbPrWZ+/WC60qruCDsSdxqQSJoD1knOg6k66b5OyJS4tNEsrgstUJ+ZEqOQnraaxd+KrWpXi1uFRwHIouMDxUgT3sbnksYEu5Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ioUgUKguW/HD9IrIpUOvi0JBwfDa+xZmXShjaADYv8=;
 b=jBxTHCLb8P4eZ/TAUkCQTMa3xYjrwFoF6BFpbrYwFc2sfvXYFRpVRBdNF9IFlwOuGb4UhSngSCGWo/bQ0s92jNXJURknZ5a/qtCba6SnT07eJtNQ0cWIz1Op5Eac15KxzQ9QmmwVzJuKbXMNlCpIQsiLyvaRw7KYtD4Ver5cEE7rXLyBfzG5Ez8irBN2vgz6pM8bIYP+AyaKRFISMhaDSjg+EMPICiAIszuEN/Qvts5eNQ+3WmgCucOStXqODUVe71F7otgUZ6uh6JHSNj2AZnyw3eG9vGT2eHOfbTRbwuRpx+yDzggihgcXhn+Ea98w9qI9FNdYyBVD6uDgrSabRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ioUgUKguW/HD9IrIpUOvi0JBwfDa+xZmXShjaADYv8=;
 b=pWi0P7bmnvaZnNU9e8h1AmzDS5MQAz0gMQr6RwyEkL+zo7rTuD2Tf0LLsxucN26OvDlzkhbJqNCCdIrzV7LM3pAnsBGMeL8Bx9jPjVUH+d5eZSxzSd3I3wxtlIhTGa0Zv6ku8n+ljBJVhVaMrVEuBH2jKMMq8aFC5ds6ofds6Xs=
Subject: Re: [PATCH for-4.15 6/7] CHANGELOG.md: Various entries, mostly
 xenstore
To: George Dunlap <george.dunlap@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <ian.jackson@citrix.com>
References: <20210401133827.362216-1-george.dunlap@citrix.com>
 <20210401133827.362216-6-george.dunlap@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <97d317fb-16d7-a14e-e74e-62fa83159838@citrix.com>
Date: Thu, 1 Apr 2021 15:00:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210401133827.362216-6-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::7) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ee72e24-1ec9-476f-8ce4-08d8f516889d
X-MS-TrafficTypeDiagnostic: BN3PR03MB2372:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB23726C07F0476151EEE6BE9BBA7B9@BN3PR03MB2372.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eQ5vFuq045yHjtTWrMpB8ReU5LCzGRRk9mxZHMuABR3ae20PfJ5CSZcnXjP8ZmAJDqy4Ms11kVmMkKaRXZTcrNbRF1oZPfNZqHk0wRSFhSLFOeOXxyu40OpYFXIkH+IYsbe1bpE1ltPHNHwCuB39rQkXAoMKFQH6qb7irdgz8Bp1MLEf3wS9beqT6R6pSQpKSfx3KYYVjH02BGQeq0scV3z7SlWjV3kjdcDLGV413ev+UDIJ5WHcu4cT8KZ/FLWs4i/A3bn5UbNBcTBwZofqTnfWh8ksBAEI7vZn8uIRcGxJ9nk8qXT++pEt00HR34qFBxVu3JA0CYSt7aUgi4pLDEzoEhacMuqUqFRULzKEICbxg9/Yn63fO+YepWthCzFr+g9wVJE8zmYckvxIAPXxFETOFG0do1GU1HZ7eW7q3lIc3uBa4OLyJyuh9L5fSB/VtiAyKat+6+sCQY6zA6737NEUSrguTxbm244attXCD/oWc+pk3t0Czuyu6/Y90SOiqzoqaIjH3LyncBlJ4bmNtjvtv9NSFdgZngorH+N8PIckVO7GroGx1qGCcRaDDeJHeincp/OmeIyS/FbvDFXDsHfX3s5BlPyjfNWCLt5Vgs9v6NwpF/rkU6USuTBi46e/rKWoHh+5uVNuq/Y9dge7xfP7OA1RTgEoxjHnsXeI2gciLxPcLt0r0LIs2Ooz85YFsY7HU7KkmwHDaXfgfxX838iF9TJ7xbkyYmx+1qVC1aiXr5wC0bxRgLwC/oJOuqQX2S5lXZ6a2tdoh7qAqls8hpOSAIHgilgMiL3yo3EJzvzoCQIROeFZ/20Q2dwmg1USBOeAvKO/ClUvVKZA87iw7j/1jWYtuxLy4idgaNW+5zNtBbCvURsN8uJlt2EeDr+H
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(8676002)(31686004)(8936002)(31696002)(186003)(6666004)(2616005)(956004)(54906003)(107886003)(26005)(83380400001)(16526019)(6486002)(36756003)(86362001)(16576012)(316002)(478600001)(66946007)(4326008)(38100700001)(53546011)(66556008)(66476007)(5660300002)(2906002)(59356011)(207903002)(219803003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OGpPWFU0SVZnRFBKQmJFK0JsQUtkdTdtZWJtUUxmWTUwUUg4Szl5M2x4S3lL?=
 =?utf-8?B?djQ5ZE9xb0p3NGx3WVFRSm5yZ0ZxU1FjKy9ISXpkZVIrLzBUeTZNVzNQYjZE?=
 =?utf-8?B?Q3FtUlRaWkFKOURnNTZDeG0zeTZFdExkeE16eExxKzlJY0xQb1RMdGpaaDIr?=
 =?utf-8?B?RFAvdHFqdWo4Y0pld1o1ZEtQWTV4WFRKa1VQelpwdGlkZWU0SEltRXlzazg0?=
 =?utf-8?B?UUJiNFRTZkJSc292NDd1T3FseHY4SlZmMDZ0Nm9jVURQcXhyRjh6RVJDVmV6?=
 =?utf-8?B?WTl3ZjlQMFRtV2VJMGlXL0RjTlllSmFBZ0hITkIyRzlZTk5nMGJ2VG8raC9S?=
 =?utf-8?B?cHZodjBPaVR2TDdIRUVDQjlPenY0SkpCd205d0RRREgrTVhkZ1pzQkxSK1M3?=
 =?utf-8?B?aExlWERFWUVQdXMrWnBnQUJLUzZ5dlg0UHJ6MzV0Zk04d2RnckZ6MElOUTR5?=
 =?utf-8?B?K3pQeExmb1YxTU0weEpiaWJFMzg2NUs4T2lGZDdhM2FVcjhVOWtQYTlobElO?=
 =?utf-8?B?bzVudDJVTlhaSGw0UmlJZnhqN2FDUG85TThoaDN6cUtMNUFWRk1naklQS2ZE?=
 =?utf-8?B?YkQ1c3RMSXY1dHRmSnlJdkRickU0MEZRWHlnbG4vZVJJVXNJR09IYWpGS2s5?=
 =?utf-8?B?bS9MMjM1V0F1TG9kZk00bENidmZxUkNFMUE2T3RCUFd3RTJZTDd4R25jRHJG?=
 =?utf-8?B?bjV1R0NoV2I3SGRUMUErWDFFMElVa2ozUG05YWRySGJjUy8rbC9uQXF2MmZO?=
 =?utf-8?B?eVdITzdiamZRLzFwSjZHbGFXcGU1aXZERVo4emx3R2JoaWI5blBCVW9mMjNS?=
 =?utf-8?B?WTdDVXNrZk1oSElzcHZYV25TQnZwUFdYZVhSemtGY0hUNWx4cVY0dEtYUk4x?=
 =?utf-8?B?NDRscEdoZnVRZmt3Nm9vYjZ3Y3VOeDUrU203MmZvK0lEeDFURi9INGQ5OC9n?=
 =?utf-8?B?TitoS1hvSzBFZDFMUWxqZmtpWWFNdVhRVXJTVGs0THViSFc4L3ZkYktSekFX?=
 =?utf-8?B?VTF4THhpeHUrMThlcFlWMC9TWHRzSWF0Vm5mQ0hrMHhGYWlQbjdackgwY3NW?=
 =?utf-8?B?bWJJZDlGQkE2MlRCWHYxelB6WDl0eTFGcHNlMnFmakYzVk0wdUZ3RDhXMmNu?=
 =?utf-8?B?Mnoyb01QUWxlVTFkZkdDQkRKZS91MnNBVVExUGlKN1hJTGhVZUtVWXFJRHpm?=
 =?utf-8?B?Q2Z0blhTVlV2L0VZdlg0L0dDUjQ4R0NoaGtLQnVHelJtSWtqZzhGUjAzVmFO?=
 =?utf-8?B?SkRGczExenJvMVZvM25MYStON2JMM0RacWxxVER5TnN0VnYyTUxvaHg1WHR4?=
 =?utf-8?B?N29QQmtvMTkveFZNRkRRT1lET1BDNkNvTUJGMXVwY2tGbU0vQWtGckM0QkQ2?=
 =?utf-8?B?QmZYOEhnTHJLbUpXRm81OEtscG1Qc2c0VXpnRXRDbE4rRnFmOGgxMFNZSnR2?=
 =?utf-8?B?ekQ3YXdYNnhRVGFyNkdTMHRPNFd0NER1dzloZ1dNaWlybjlLejNHOWpNZnEr?=
 =?utf-8?B?TkRaZ0NtNThHRTNITE5ZRnA0MkNGeE91eFllTnJTYWJoL054ekRGUXpPcEQy?=
 =?utf-8?B?ZVJaV3RRLzJwc3FQcEUvanl2blVyMkRUellJZHVpRG83QTBhQXdPbDE1dExl?=
 =?utf-8?B?UC9HMW9sWjAyZEdCWTVHWnhLdzlBZ1lKcXBjaHFXMUF5VVdTNW8zTkV1RENW?=
 =?utf-8?B?MmVmR2U2cmtWWnRWUUE5SU5MekRvSGtSR0hZWmJiaHQ3Qk10QmNyajhFWHQ2?=
 =?utf-8?Q?8l00K5ZHJKKH7NA2guUi02urs/O/Sh7PuQvWK1r?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee72e24-1ec9-476f-8ce4-08d8f516889d
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 14:00:40.5216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFqxlft8K+uWws3tExxmtOwS1j0BHGwOdoJ6uhYEdVuoK6N5WmYVxN3UIphzcpsR4aMKpPv9mPkTD7MJCBo6touDqtj1C5AOSb5bTqi1BzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2372
X-OriginatorOrg: citrix.com

On 01/04/2021 14:38, George Dunlap wrote:
> ...grouped by submitters / maintainers
>
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
> CC: Juergen Gross <jgross@suse.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Ian Jackson <ian.jackson@citrix.com>
> ---
>  CHANGELOG.md | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 2f26cd5c87..9c272a0113 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -28,8 +28,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - Factored out HVM-specific shadow code, improving code clarity and reducing the size of PV-only hypervisor builds
>   - Added XEN_SCRIPT_DIR configuration option to specify location for Xen scripts, rather than hard-coding /etc/xen/scripts
>   - xennet: Documented a way for the backend (or toolstack) to specify MTU to the frontend
> + - Fix permissions for watches on @introduceDomain and @releaseDomain: By default, only privileged domains can set watches; but specific domains can be given permission in order to allow disaggregation.

This is XSA-115, and isn't something new in 4.15 vs 4.14.  (I think?)

> + - xenstore can now be live-updated on a running system.

This needs to be very clear that it is tech preview.  It does not
currently work cleanly if a malicious VM deliberately holds a
transaction open.

~Andrew

