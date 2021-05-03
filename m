Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5DF371708
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 16:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121663.229464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZrk-0004p0-OA; Mon, 03 May 2021 14:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121663.229464; Mon, 03 May 2021 14:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZrk-0004ob-KV; Mon, 03 May 2021 14:48:08 +0000
Received: by outflank-mailman (input) for mailman id 121663;
 Mon, 03 May 2021 14:48:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iacE=J6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ldZri-0004oV-Pk
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 14:48:07 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ceffe932-87d1-42c0-8f5c-d106409c7349;
 Mon, 03 May 2021 14:48:05 +0000 (UTC)
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
X-Inumbo-ID: ceffe932-87d1-42c0-8f5c-d106409c7349
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620053285;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Nz7vPGC3Mw3YCooAlDH3j29Mg4awrUWSkegvVxd5JM0=;
  b=GhTHfdIgUbSZQ+dCwPA/mM3KLehR65eZ6GgWLMKwyL2N1d1V/o26ZUjX
   G2PhxXHBGPE3TpISi+HjbR2Ur4cq+sG/txiVNYGtxFC2mlnH2PaFV9TDZ
   0XEElwz789GI/jIGzvkeuORyXSW0fVLvcXAd79mLp58TtUTxUwr6BKWrl
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uhpS1FFOEnXjnvNHCF21VoeQM6NThp0VMsdyxhN1qsk5jeDv/nFhLp4a8uIrPEhHyvFzqpJjAi
 /hrN6H0gMn1hpSyeVOrHPYagU68QxrUlNhkZH1VN+YOgkRqMkl0IdwaKUlQhBntMUds0ZbFuYq
 dYuqXoXm4SSy20u+Y7au3mPXaw3HBb4ohCA8N6cFgeXWLUt8xd6n7RgugZtTBpa4N0BLQ5UXJb
 j6cWJHPqydMYu9vBvoXMhYajT7X51oC5jzBjd9AmT9aGvQJZ/q8gZkVcxr34k62IBb1PwKrCCl
 5GA=
X-SBRS: 5.1
X-MesageID: 42954217
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Un7Yaq/9GeQqraSDxtVuk+FqcL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmzybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIULD38Zn/+
 Nbf6B6YeedMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsLV4hLxW5Ce2CmO2dxQxRLAod8OZ
 qH/8xcpyehf3N/VLXHOlAuWe/fq9rX0K/8aRkdCBI9rCWIhzWk6Ln1eiLoois2eTVJ3Lsk7C
 z5gxX0j5/Tyc2T5z398yvo75pQkMb80dcrPq2xo+UcNzmEsHfMWK1PQLuH1QpFxN2HyFFvq9
 XUpgdlAsIb0QKvQkiQgT/Anzbtyywv7XiK8y7qvVLGrdbiTDw3T+pt7LgpCifx0EYrsNFi3K
 8j5Qvw3PA7fHCw/lWJ2/HyWx5njUayq3Y5+NRj9EB3aocCdKRX6bUW4UI9KuZxIAvB9IslHO
 NyZfusncp+TFXyVQG/gkBfhPaoXng1Ay6cRFkDtsG/w1Ft7QFE5npd68oFknga8pUhD7FC+u
 TfK6xt0IpDV8kMcMtGdag8aPryLlaIbQPHMWqUL1iiPKYbO0jVo5qyxLku/umldLEB0ZNaou
 WObHpo8UoJP27+A8yH25NGtjrXRn+mYDjrwsZCo7Bkp7zVXtPQQG6+YWFrt/Hlj+QUA8XdVf
 r2EolRGeXfIWznHpsM9xHiWqNVNWIVXKQuy5YGcmPLhviOBpzht+TdfvqWDqHqCywYVmT2BW
 ZGcyP0IOlG80C3Sl71iBXcQBrWCwnC1KM1NJKf0/kYyYALOIEJmBMSk06F6saCLiAHkqFeRj
 o7HJrX1oeA4UWm92fB6GtkfjBHCFxO3bnmW3RW4SsDM0b+d6c/q8ySEFoim0evF1tadYf7AQ
 Rfr1N49eacNJqL3x0vDNqhLya8g2YMommJC7MRgLeK68ugWp5QNOdmZIVBUSHwUzBlkwdjr2
 lOLCUeQFXEKz/ogaK5yLoOBO/ecNF4qByxIdFdrE/esUn0n7BselIrGxqVFeKHiwcnQDRZwn
 dr9bUEvbaGkTGzbVckjP8AK11KYmSPCLdgBACIDb8k3IzDSUVVdyOnlDaagxY8di7P+18Jjm
 LsFyGSZMrGG0FQoHxez6bs/m5lb2n1RTMDVllK9alGUUjWsHd61uGGIpC+1GaccXMu6OAQOj
 OtW0pZHipeg/SMkDKFkjeLEnsrgqg0NuvGFbI5bvX4wXW2MrCFkqkAAt5Z9JtoL8rVr+cOSO
 6TEjXldQ/QOqcM4Ui4t3wlMC57pD0YivvuwgTi93X983glA/beSW4WDo0zEpW51SzDSPmJ2p
 ki0o5wkuu0L2nratmJjYvQdCVOLxvPoWiwC8EkwKokyp4ahf9WJd38VzCN6VRsmDMZB+3wnF
 kFQKt67KvaU7UfNPA6SmZ8xB4RiN+LLEEXqQT4De81QEE1gxbgTqe0youNjYBqP1aIqwTxM2
 SO6iFx///KWC2YyL4RYphAV1h+WQwZ6H54+vmFeJCVIAK2d/tb9F7SCA7xTJZtDIyEE64XtB
 B0/pWhmPKWbTPx3ET1sSFgKqxDt0ahTsXaOnPBJcd4t/i7M0+LmK2k/Yqaiyr2UyKybwAgvr
 J+HHZgJvhru30Fl4040i+7V6zxrAYEqjJlkE9av2+o/JOn7mfdFVxBKivDjPxtLGFuDkQ=
X-IronPort-AV: E=Sophos;i="5.82,270,1613451600"; 
   d="scan'208";a="42954217"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKiN2IftHEkTaeCZDp8th+bQxtjQBA85Gn7nhoEApom0LXreNFCw4DhmOkDJbW4pLhQToY06Jwx7+GC8Umd44QwprTX0yGNNkKV3WEipG2QxiAoIdmZ4vrysfveYBZ4BtDwxcBJmPKmkrawjFDXWmicLNJJJGcpcu18aBp21P3X89jRqbpU/Rk8TtCAXuQ4FgNp/ykmqhueNdEGVYOdODINRVSXIoDMk6uLDrCzV+qKvG2SZ5M5Gygiud31WG8t/nfaJp8DHM9ow53y8903UctzkxH5EHnW0M1wN2pD2MRSiawGPY+ZL9S3o+Uw1mp7zak+k5KCItreTeyrW3592CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55J7BXfXNPgVyghL59YD0llMk3eR8G1yedZKy4xUUko=;
 b=TgOfz1nLN0Bef/5Tv38HDNSOnZeNnZlOvrX7z3rZUrS+iQ1qZZi201ouAWg3P/yrnhgtFwo5hA3O+CxCIxKyMrjxS9qBgMMxEfnNAttfOvJEO1sV70ExVhKd3+ZeN+KVwjNe7Kem092tjc/ejAwal1gMHRxcVr32jJI0d5S9QW5+6J1RZLOg3dFbsYhUMcl69K6b+ayEv2pzORnjZNBh5coIQyP5136UGnG7ALKAsd/7wWSovmYhLHVCt1SUvzmZhW9C9bq/JYdFBxoGvs5asy1H6oJloYPJjJ8zlRxMk63jUivbK/wyqBTeRa8/lzzuzbOeJEqHF0bsWbOSmA5HbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55J7BXfXNPgVyghL59YD0llMk3eR8G1yedZKy4xUUko=;
 b=UwfWs5G4iiE6yda9+jM27iDu40uZWnbzrvhTozY2OBFWM408pxVR8IYr8FxoN7RSpPKSCMM9dr9fnYSLrW2KYozQCNCVMvretmxBQDpw2Ig6A1V0scLygsXpyxtcsikRIbSIWybomLTEUDm1/aeBWF/yKkjN+hjH/X8L2y34IXk=
Date: Mon, 3 May 2021 16:47:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 01/12] x86/rtc: drop code related to strict mode
Message-ID: <YJANG3LeuA3Ygt/Q@Air-de-Roger>
References: <20210420140723.65321-1-roger.pau@citrix.com>
 <20210420140723.65321-2-roger.pau@citrix.com>
 <f282a2a2-e5cb-6a65-690a-b9c27c03089a@suse.com>
 <YI/CSKpqWrilNKi8@Air-de-Roger>
 <5b06565e-1f2e-3498-c18f-e7eac0042761@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b06565e-1f2e-3498-c18f-e7eac0042761@suse.com>
X-ClientProxiedBy: MR2P264CA0015.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a79c18fe-435b-4b30-e957-08d90e42734c
X-MS-TrafficTypeDiagnostic: DM5PR03MB3147:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB31475DE68BED9878AF7F0AF58F5B9@DM5PR03MB3147.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eIo0NBbLa9x26YX7LStBfkGit3BwzUB/0nfNpKI/di5C34mbAiK6VOg3z5fCHeI70OKWH166XbZW3M1PkgJQtwoz9eGFOVV6APL1VmoiD97G8z23MzjdGwLngidJP/p7Yd3cyiom8VGPzVbI0Tg+vBNELO2P9CxBS4wfEdtLd1xwgaIjo2R8NCQTk6z4nzchwagt3GXvgElB2Ec0NT+paDiAz6OPbLuwBs0h55ymiiPzB7NuNtyrmx8cxomAJcZSL83cA/nr6mgW+YzGuBTUtYtznS3to20HwYJoFKbpFe/U6QWjTKTD4CdTpkMdzft7bWygcDL3Cx1zNwQdRG4EzNyMsxqREOAl40S0pbwOmTnjpFqpbehZNShf5NWECsFkPQIlADWZlW11X6gnp5+pS5fJziZG0HK8uUhVgGDtVzm2ah0OQPyAMMt9B4XqIb6fTw0CXr3Lz77eNjcKs135UW7F4hRNCKiV6onhbXR0WlUOOzcs+gq67MxOmLMxp9pBUwbJXyhtVRM+6WwQkJEFBxS6aS7XSWTp4dhMTG4PtcL3MGqDRDPXKro6k4bahEO90+dtr7t0J6WjsHqqjZaW2spkxg+K7jSc+ZA+jesJl8sBvvbjwOylBaF9nQzw9MXvlqW2qS9UmRHtCGM30POSpdX2aUPcXOcYMmcayIdYT/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(346002)(376002)(39860400002)(396003)(366004)(6486002)(26005)(16526019)(956004)(316002)(6916009)(6496006)(33716001)(6666004)(5660300002)(9686003)(478600001)(66476007)(85182001)(66556008)(8676002)(66946007)(186003)(83380400001)(38100700002)(8936002)(966005)(4326008)(53546011)(86362001)(45080400002)(54906003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R1ZsdFNNSjhvWmREdTA0Z0tPc3JDUllmanRKL2RkMzU2dU1YQ2VSZWNYU2Iv?=
 =?utf-8?B?VDZNM2N3SnIzSzkrMWdCcHFYdlh1cVJwR3hDWVZYcHZ3L1dpUFArZlk4ZVNT?=
 =?utf-8?B?RWx6U0djR280VDdoZVFtV0hFWG9KZWNiYS84ano2TUtnU2pqRmxwQitVd3hC?=
 =?utf-8?B?aGxvN0VpYWZBSlVCMGlUdXRBcVBTUVkwUXljM0IvdjZ1elAvZTc3Y1p4OWZw?=
 =?utf-8?B?K0IwWEFtZEtvcGdZczVlcTZnVS93UmlmTVhPMGNONGRITk9aMmRJaVk1SXFs?=
 =?utf-8?B?eUlxQ1dmbnhtdmxnU1J1RCtjTWxvSkRxSURTNHdvS3NTK0ROQzlVRE82WFZC?=
 =?utf-8?B?aERXM3dlWktLYkdSNVZtbnpoWlIvRGFPeHpvVkhJdUhwNFNhWk9FRTEzUW5S?=
 =?utf-8?B?ODdZNVJzRVhZTFhaeDBzYm9iV2JBaUJOTUUydzhqaEt0NW4yRzVudkc0b1Np?=
 =?utf-8?B?QmlXTW80MkNvSHpzbnhOMCtmN2NCTlZaZlRzZENIRlpna2RrQnNGemhtT01R?=
 =?utf-8?B?R0QxNDI2bzdGNjdydHVqKzNVck5qSFRFaUxJQW1ja3NxSkRXREQ5VmtxTEMz?=
 =?utf-8?B?dmgybmZIa1JWY3lGK0hhdTZWN1VDTnI0N0M1aGZFSnBWTUdYZHA3aHhVTGlT?=
 =?utf-8?B?Y2R2VkROSHVjVzg3NWV5N2dUL0N3bERldE1hZjlNeHp3VUVSZ3EyNWxNZWpG?=
 =?utf-8?B?N1M0WDU1aUF3SFFJa24vbnRmaWZWN3dXS1RXVXppS0Y5Vkl0TGl2ZkxWNDhr?=
 =?utf-8?B?REdkME9xanZ1UHd1dyt4Vmw3dFBvQmlYWXBuUHVjRm96MlpWZ0VNbndNY281?=
 =?utf-8?B?UEVYVW1rdW9kY3Bhem00cTUyaDY1TFR6SkdaTG1KVmJldjhIZUNuODNSVlVn?=
 =?utf-8?B?d0I1Q3FpU0NhODV5alJ1aHdNNmRJS3paNjJTaFltM1BKU3F0eDk5SGx4S3RQ?=
 =?utf-8?B?VDNOQ0tmZmFLTG9ZR1kxeE9NTk5CZVVWTlVicDVIeXNxZTc5M3NvTnVleFJO?=
 =?utf-8?B?RnlRNkxyRVdWeFJaRUJJLzMrakZaWlF2WmJlNVYxVi95b3dJSkVuMGNXeUFR?=
 =?utf-8?B?bTNTN0x2WG5nRUtYamJmdjREa0lIVG9NKzBtNXlQK1RxVlJTa0lEMTRzRG91?=
 =?utf-8?B?OVVCYkFIcnBNM044TzRESndzZkdUYXBFeVgwTFlONW9WZDNVN0QxZ2RmRGwv?=
 =?utf-8?B?VjY1MnpFbTV0ZFpydGEvejFsaEFqcC8rUWVFM3c1a1EzeTAxM0JYYjlIRWRP?=
 =?utf-8?B?MG9TTkNFSkJzOXZSMk5POWdiTVJVVjNUbU5ldi9HSktUL2NhS0F5dklMTE5B?=
 =?utf-8?B?RlZBOGNYMXI3K0xmeUhuMW1UYXpCZUJ3MlhYYW1OT2NQcStpbEtGc3hjbnIv?=
 =?utf-8?B?Y1hVMFFJeEZaSzU4OWxoQ2Q0WmZoWGFXRnczaXZHdlRXV1ZBL3ByQk5QOWZq?=
 =?utf-8?B?NFc3UDcvM1dzQzA2K29VVDlTcUVpVlJGekdhdEpmc29DOGNqRGxIQkxoTC9Q?=
 =?utf-8?B?ekZ3WVRVNmJIcS9Hc1RCcDQvNUNTdFJTOTBWR0JWNVgrS3JWYTRnK09OaTNQ?=
 =?utf-8?B?RzRPNnkvc3c1b0pqQVhPQTM0b0VnQVpaTitnRDFWUjNYdmVrSmNrM0RoZVNl?=
 =?utf-8?B?UHNQK0lXSjlLY3hYM3hPanZFSUxRS21hK2U5SXpPZjNCcGZaYnlUWG5JYVM5?=
 =?utf-8?B?TWt3MG9vUXJSeXozSVFKZ3J4a01BUjJQaC9VM3ZSbnRCSW93b0NobGVWNHZV?=
 =?utf-8?Q?Em4vdJKYIcPliJO34vbdxAwVql97OUUd9xsGq3V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a79c18fe-435b-4b30-e957-08d90e42734c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 14:48:01.5901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0ZTyF+WvZX+yGHXOAikeFlFqdA58/mM/3umV8LxDm+7d/kxdi4w9cDA8XFVCuCvjgP3X+8MsELM7IOscpYmJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3147
X-OriginatorOrg: citrix.com

On Mon, May 03, 2021 at 02:26:51PM +0200, Jan Beulich wrote:
> On 03.05.2021 11:28, Roger Pau Monné wrote:
> > On Thu, Apr 29, 2021 at 04:53:07PM +0200, Jan Beulich wrote:
> >> On 20.04.2021 16:07, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/hvm/rtc.c
> >>> +++ b/xen/arch/x86/hvm/rtc.c
> >>> @@ -46,15 +46,6 @@
> >>>  #define epoch_year     1900
> >>>  #define get_year(x)    (x + epoch_year)
> >>>  
> >>> -enum rtc_mode {
> >>> -   rtc_mode_no_ack,
> >>> -   rtc_mode_strict
> >>> -};
> >>> -
> >>> -/* This must be in sync with how hvmloader sets the ACPI WAET flags. */
> >>> -#define mode_is(d, m) ((void)(d), rtc_mode_##m == rtc_mode_no_ack)
> >>> -#define rtc_mode_is(s, m) mode_is(vrtc_domain(s), m)
> >>
> >> Leaving aside my concerns about this removal, I think some form of
> >> reference to hvmloader and its respective behavior should remain
> >> here, presumably in form of a (replacement) comment.
> > 
> > What about adding a comment in rtc_pf_callback:
> > 
> > /*
> >  * The current RTC implementation will inject an interrupt regardless
> >  * of whether REG_C has been read since the last interrupt was
> >  * injected. This is why the ACPI WAET 'RTC good' flag must be
> >  * unconditionally set by hvmloader.
> >  */
> 
> For one I'm unconvinced this is "must"; I think it is "may". We're
> producing excess interrupts for an unaware guest, aiui. Presumably most
> guests can tolerate this, but - second - it may be unnecessary overhead.
> Which in turn may be why nobody has complained so far, as this sort of
> overhead my be hard to notice. I also suspect the RTC may not be used
> very often for generating a periodic interrupt.

I agree that there might be some overhead here, but asking for the
guest to read REG_C in order to receive further interrupts also seems
like quite a lot of overhead because all the interception involved.
IMO it's best to unconditionally offer the no_ack mode (like Xen has
been doing).

Also strict_mode wasn't really behaving according to the spec either,
as it would injected up to 10 interrupts without the user have read
REG_C.

> (I've also not seen the
> flag named "RTC good" - the ACPI constant is ACPI_WAET_RTC_NO_ACK, for
> example.)

I'm reading the WAET spec as published my Microsoft:

http://msdn.microsoft.com/en-us/windows/hardware/gg487524.aspx

Where the flag is listed as 'RTC good'. Maybe that's outdated now?
Seems to be the official source for the specification from
https://uefi.org/acpi.

> >>> @@ -337,8 +336,7 @@ int pt_update_irq(struct vcpu *v)
> >>>      {
> >>>          if ( pt->pending_intr_nr )
> >>>          {
> >>> -            /* RTC code takes care of disabling the timer itself. */
> >>> -            if ( (pt->irq != RTC_IRQ || !pt->priv) && pt_irq_masked(pt) &&
> >>> +            if ( pt_irq_masked(pt) &&
> >>>                   /* Level interrupts should be asserted even if masked. */
> >>>                   !pt->level )
> >>>              {
> >>
> >> I'm struggling to relate this to any other part of the patch. In
> >> particular I can't find the case where a periodic timer would be
> >> registered with RTC_IRQ and a NULL private pointer. The only use
> >> I can find is with a non-NULL pointer, which would mean the "else"
> >> path is always taken at present for the RTC case (which you now
> >> change).
> > 
> > Right, the else case was always taken because as the comment noted RTC
> > would take care of disabling itself (by calling destroy_periodic_time
> > from the callback when using strict_mode). When no_ack mode was
> > implemented this wasn't taken into account AFAICT, and thus the RTC
> > was never removed from the list even when masked.
> > 
> > I think with no_ack mode the RTC shouldn't have this specific handling
> > in pt_update_irq, as it should behave like any other virtual timer.
> > I could try to split this as a separate bugfix, but then I would have
> > to teach pt_update_irq to differentiate between strict_mode and no_ack
> > mode.
> 
> A fair part of my confusion was about "&& !pt->priv".

I think you meant "|| !pt->priv"?

> I've looked back
> at 9607327abbd3 ("x86/HVM: properly handle RTC periodic timer even when
> !RTC_PIE"), where this was added. It was, afaict, to cover for
> hpet_set_timer() passing NULL with RTC_IRQ.

That's tricky, as hpet_set_timer hardcodes 8 instead of using RTC_IRQ
which makes it really easy to miss.

> Which makes me suspect that
> be07023be115 ("x86/vhpet: add support for level triggered interrupts")
> may have subtly broken things.

Right - as that would have made the RTC irq when generated from the
HPET no longer be suspended when masked (as pt->priv would no longer
be NULL). Could be fixed with:

diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index ca94e8b4538..f2cbd12f400 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -318,7 +318,8 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
                          hpet_tick_to_ns(h, diff),
                          oneshot ? 0 : hpet_tick_to_ns(h, h->hpet.period[tn]),
                          irq, timer_level(h, tn) ? hpet_timer_fired : NULL,
-                         (void *)(unsigned long)tn, timer_level(h, tn));
+                         timer_level(h, tn) ? (void *)(unsigned long)tn : NULL,
+                         timer_level(h, tn));
 }
 
 static inline uint64_t hpet_fixup_reg(

Passing again NULL as the callback private data for edge triggered
interrupts.

> > Would you be fine if the following is added to the commit message
> > instead:
> > 
> > "Note that the special handling of the RTC timer done in pt_update_irq
> > is wrong for the no_ack mode, as the RTC timer callback won't disable
> > the timer anymore when it detects the guest is not reading REG_C. As
> > such remove the code as part of the removal of strict_mode, and don't
> > special case the RTC timer anymore in pt_update_irq."
> 
> Not sure yet - as per above I'm still not convinced this part of the
> change is correct.

I believe part of this handling is kind of bogus - for example I'm
unsure Xen should account masked interrupt injections as missed ticks.
A guest might decide to mask it's interrupt source for whatever
reason, and then it shouldn't receive a flurry of interrupts when
unmasked. Ie: missed ticks should only be accounted for interrupts
that should have been delivered but the guest wasn't scheduled. I
think such model would also simplify some of the logic that we
currently have.

In fact I have a patch on top of this current series which I haven't
posted yet that does implement this new mode of not accounting masked
interrupts as missed ticks to the delivered later.

Thanks, Roger.

