Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E1E4BB9BE
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 13:59:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275386.471222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL2qs-0007Lj-It; Fri, 18 Feb 2022 12:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275386.471222; Fri, 18 Feb 2022 12:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL2qs-0007Is-FH; Fri, 18 Feb 2022 12:59:10 +0000
Received: by outflank-mailman (input) for mailman id 275386;
 Fri, 18 Feb 2022 12:59:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Z2s=TB=citrix.com=prvs=041b9fbab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nL2qq-0007IR-KC
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 12:59:08 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cf6292d-90ba-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 13:59:06 +0100 (CET)
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
X-Inumbo-ID: 8cf6292d-90ba-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645189146;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=lddUhaVDBPtq6QBodkEwUXilrGgtaPioD/w3S4ycJKc=;
  b=DRrrQhC6+ZWIqYUW5Tp90tcLxQDGBabC1vnVVkQ8L/3WPHdpIj6MVCEw
   SV0I08o7OZlhl05bHpw5qYOIWj++JCwanyFI7nLTBR8q1HhgS/fJk1qS6
   0FjWA7DJcBuPWhizsyjGZL+ibyQHpl7fRGkWD54TnPVXN4NWHgwgnct07
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64515871
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WjBE/al7ZGZdlctGccME1nzo5gxLJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZDTjSM/qIYzD8fYx/Ooi09h4FuceGzN9qTAVu+Xo3QyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2UILd9IR2NYy24DjWlPV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYaisCJJeLpMYhCzIGFSNmAqYe+aDFCC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJHNWc2MUSfOnWjPH8zUY8PxN2yo0DvLQBq9lyPpoMdzU/6mVkZPL/Fb4OOJ43iqd9utkSFo
 mPL+UzpDxdcM8aQoRKe6W6ljOLLmSL9WaoRGae++/osh0ecrkQMDDUGWF39puO24ma3XtkOd
 WQP4CEg664/6CSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRSXKa9ECzHsO3O9HXrZHZTfTRqiTI4oRUtwPXIurt0sjDzFv09FqytsdatGC7y6
 mXfxMQhvIk7gckO3qS92FnIhTOwu5TEJjIIChXrsnGNtV0gOtP8D2C8wR2CtKsbct7FJrWUl
 CVcw6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sxm81Y67omhezO
 Sc/XD+9ArcKbRNGioctPuqM5zwCl/SIKDgcfqm8giBySpZwbhSb2ypleFSd2Wvg+GB1z/1iY
 M3HKZfwUy9AYUiC8NZQb75MuVPM7npjrV4/uLihl0j3uVZgTCX9pUg53KumMblisfLsTPT9+
 NdDLcqaoyizo8WlChQ7BbU7dAhQRVBiXMieg5UOKoarf1o3cEl8WqS56e5wJORYc1F9y76gE
 oeVARQDljISRBTvdG23V5yUQOmxBc0m9SpjZ0TB/z+AghAeXGpm149GH7Mfdrg77u1zi/lyS
 vgOYcKbBfpTDD/A/lwggVPV9eSOqDzDadqyAheY
IronPort-HdrOrdr: A9a23:9JUbQKnF2h4LBPiOjDy/Y3cCTBLpDfOKimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcIi7SdW9qXO1z+8Q3WGIVY3SHTUOy1HYU72KirGSgwEIeheOuNK1sJ
 0AT0EQMqyJMbEXt7eZ3OD8Kadc/DDlytHquQ699QYXcegCUcgJhG0Vanf5LqQ1fng9OXNQLu
 vA2iMtnUvGRZ1jVLXDOpBzZZmkmzSkruOCXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3Q/MyYwrOG4y6Z81WWw4VdmdPnxNcGLteLkNIpJjLljRvtTJh9WoeFoCs+rIiUmRMXeZ
 j30lMd1vZImjXsl1KO0ELQMs7boW4TAkrZuBilaL3Y0JfErXwBepB8bMliA2XkAgIbzaBBOe
 Rwrj6kXtNsfGD9dG6W3am5azh60kWzunYsiugVkjhWVpYfcqZYqcgF8FpSC4poJlO21GkLKp
 gkMCjn3ocdTbpaVQGvgkB/hNi3GngjFBaPRUYP/sSTzjhNhXh8i08V3tYWkHsM/I80D8As3Z
 WKDo140LVVCsMGZ6N0A+kMBcOxF2zWWBrJdGafO07uGq0LM2/E75T3/LI27ue3f4Fg9up/pL
 3RFFdD8WIicUPnDsODmJVN7xDWWW24GS/gz8lPjqIJ8oEUhICbeBFrZGpe5vdIks9vdPEzAc
 zDSq6+K8WTWVfTJQ==
X-IronPort-AV: E=Sophos;i="5.88,378,1635220800"; 
   d="scan'208";a="64515871"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKpx8OtfNiKqpj3E7/+4tU8un8NBhKyBfhswN6EkyGZNK0zZL0iLDIWpghTVWdOnleuior3KqFJu3Pio/OHw3ix9LEIRfFFWkbZjUWWqIUFzxJYz82e4n7HCZe6J860nPGZJFzOiW/xNWepU6JjzCAKhTrMsPP7Fk0FJM+oUKcB89QmKu8uXXZG5p9tHZWaipl2ZvMsV3hcDvNZtrEH09BarOxtyNQ+UyIG8lKkQDlzVNFIaki+WGi1DZKimQIGkP9b6HY2hdkHgAcde7FEtqfQpDDELaVE4aTNZFapHwJds4zqenRUw+MWeIYvMCOetu7d0BqK4m/wqIQw86+Eolg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lddUhaVDBPtq6QBodkEwUXilrGgtaPioD/w3S4ycJKc=;
 b=Fos/PXbDqM8INz22x/3RC021KBKVv0dKdJMZI9YkQ50klf6U+f00qnz5QOXSNqaOzRbpoXrU1TcxVFD0MYqsXyBYqaiMcywLkoA6o94HpWJHIqPAcmUM35hUpEPSwKnSJiVc66Lkn7eZDnn8J1df3tyWL25en1s7YJl282KcD8W2ampnPz5Z+0JC05M46li00Pes48EHZ0YR+L2qycVVU6womqrhG5EN4Q+TPKOjKnDO1KbehpU/2J951IzhXJILFAVTHzXg4b+CuOCKGXw0iLj6Ye7Rjn59bbJYrsGKHU8c1lGNXAsXh+kiznRHdqG2SpZHRwr5AuwKPZIri6VuPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lddUhaVDBPtq6QBodkEwUXilrGgtaPioD/w3S4ycJKc=;
 b=dKiutzeDrcdE1mW1dyW6sVgpoxPRPePDCiPG4lsu93oTqaYzwvGEXvwWx+DK+U7svAg9YCqTW9SkvYR6+25ig1QDtxcn1mPCdsGVcMq9E7yWjHaLKikFG8KgCPQMpAQus9tPkrBzEmiNzReDEwwW5WR/9i+6fSWrnZzw1xJKJKQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper <amc96@srcf.net>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "George
 Dunlap" <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 1/2] github: add workflow to run Coverity scans
Thread-Topic: [PATCH 1/2] github: add workflow to run Coverity scans
Thread-Index: AQHYJL8wuvXnHhxuC0qfnAoHQI92b6yZOqQAgAABpYCAAAjHAA==
Date: Fri, 18 Feb 2022 12:58:52 +0000
Message-ID: <a35a8960-0e27-1669-b4a1-b8f59f148759@citrix.com>
References: <20220218120042.32102-1-roger.pau@citrix.com>
 <20220218120042.32102-2-roger.pau@citrix.com>
 <0eeb8f5f-d049-8a8e-9e65-d1966c21a781@srcf.net>
 <Yg+Qr3+nnTMv7eVN@Air-de-Roger>
In-Reply-To: <Yg+Qr3+nnTMv7eVN@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14d059f4-3a05-4d1b-a4a7-08d9f2de6a57
x-ms-traffictypediagnostic: DM5PR03MB2428:EE_
x-microsoft-antispam-prvs: <DM5PR03MB24289B1B2DDA1AA0C9F5B0C3BA379@DM5PR03MB2428.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qffWzitUAWxy6C6xJxHWv8wrTyZO/h8aZE8uEsv3Yg9IVy2GAL8gRyTsn+RJIbNSdyO1W/1CeGF5FNZ0A3a+Aqb590P+Xou1NSCHrTxUPY+0/v+/QWQszP+krpnhK3076cpNrKNptwrX/OG3pQn0pG0afgEgwc+EbdgkpeIDlgli9D8YcLrGLqGAzqf1SgyauNKE3QC3tRXvrqVT9A5DntKgxPa5M2Qfaqxv46VAk/nacnURraWsfFSRy0YYo3q8epE1bo9yO+JvkP5qLQJIE+tjisR+PBB1SRN2OhwPYBNSq4C66yvOMAlmKe5zVcUIEhwsQEQsNa9iwAiP1pYabmtbtmLcrrgMfpF7pn1Hm5FcwXXd7QTOVEShfLOMg2DBkCgHSBcCK5LAoIMKFAnVj1vCua6LTRapny5N3jpBwof1LiaKgogF5j6p0Gta6yPjt3kckhClCMLZKj8q59FqfIhHrcbp7U7cjbliKG1rFBOndNKtOn4utxWJFjoG74XCGvLnEmgz61R4B2KS/M21pDtfQMOOwHwMoxc/6cQHOhfGSjOw4iIwF3gCi9lEBU7lzg4QGkgvFVAo/4w3QHgULtSQfB6tGnRbyVhThtkSf7O8Y+L9lBb98VeXeoeeFCKQdFmH9WzH0ID+SlP7I7CcwbH0W2hDW3XOSwH7T0FuLwrmEBiZXenHP55/aP8JbFFoHw8TESp5vb/XpZw3dEjydWh4Uz2bXi0MnHN7SsWkPkq/0/AfqO402q/htTsuQNcFCWKZtalEYCraLmp2LDznyg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(91956017)(76116006)(8676002)(66476007)(122000001)(66946007)(66556008)(38100700002)(8936002)(64756008)(110136005)(6512007)(4326008)(54906003)(6506007)(316002)(71200400001)(66446008)(6486002)(53546011)(86362001)(508600001)(38070700005)(31696002)(83380400001)(31686004)(2616005)(2906002)(82960400001)(186003)(5660300002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2VPS012ZGVDOUdRRG53cjZaYnZ0SlQvTlp3M1NpeEp5SjZFU1k5V0dxRTF5?=
 =?utf-8?B?blJSWXNzVGVJZ0trb3hRMVhJVWZweWFPc0lybFpITHJNa3QzclhQTGpIOUow?=
 =?utf-8?B?NGJabGRicXl5UXFNUHFuUWNlcjVIcnBab2lsNzErL2JxYkxwL1FTMndsMmRW?=
 =?utf-8?B?N2NUbXh1ZFN1V05PbElRRFpHd2xZTDdyaW15NlIxckFzMG56SjhTQ2FDVjRn?=
 =?utf-8?B?NjdoWkZlaGVxVHZrM0ppQlgyWXl0Ri9pMlZqWXVYcWJGU0FCQjB3Mko0NXNk?=
 =?utf-8?B?RDBnaU5KN1E0ZW9Fd2wrRUowNmtKQWN6SVFBa0IwTG1ETnpsMjdiQ2JtZ01k?=
 =?utf-8?B?SE84QWY4eEFhWVoxaURUYkE3YzllZHdkbE5qc1dxZ2lSTHhtcWJPZUVzR0NO?=
 =?utf-8?B?MTlSbVNMY2F4VWxzOUJTRFF4bXpnYVhUa0MwdDZpTXBsTG96Y2wzZWVwQjFP?=
 =?utf-8?B?aG1qcU5UU21MRTUvZ29WaXViV3RhcnRSZjBJc3Q0aGkxcEx3TTE5Zmc3UEVC?=
 =?utf-8?B?em0rYytlbGhROFlxL2x2QmhJeDVTL3RicHRhK0UvdlZxdkkvbnlFTm9Tck9Q?=
 =?utf-8?B?S3ZnMGttMGhoVjAreFlOd0JwNStaaWhXSS9OSU8yMERuUzQ1NWhxRk11UzdH?=
 =?utf-8?B?WU5waytjcXRGdXZhU3FXemVkeUF5SnZpeDhjdlh3bVYxL1d3VSthcmlGMllG?=
 =?utf-8?B?YUw2bE05YzJyd2FRaGxvZmJTYU1YRDNqeXZINEJaUEJjck5qUmZCakloUkh5?=
 =?utf-8?B?R2IyRlNiSm1EY3JKVW45UG5lRjByeEN4TzZLR1dobmoxb0cvWkYrUnVsRU4v?=
 =?utf-8?B?bGd6VlF0dktWU1lmTTZOc244Zk5xaHRDSW5ibm9zazF4SHdHMHl6cmRkc0xl?=
 =?utf-8?B?Z0N1NmNERWZnSE1ZdU9ZTVVUeUMvdHlWS2dORExBN2J3K1hlNFdVRDlqR3Jw?=
 =?utf-8?B?WGcrVGdiM3VBRlZKK2tsSEE1SGNnbit2QUZGOG9ycUhZWmxtbloxbm9ROTl2?=
 =?utf-8?B?ZktOc0pWUm95Z3BGYmZMMG4ycUdyNTEwYmtLeCs1aHc4Zml4YXFvTXl0Vkpo?=
 =?utf-8?B?RW9jWHZNK0haekJaSUpNUjlNb1FGSTZwYlhLVDlxNTFqRkdsNVZDYk1IckNJ?=
 =?utf-8?B?QjBSYTlKcVZyMjQyTUw0ZS90clhrWTBlckcvT0dna3BDdG14ZXVpZnkzUGtz?=
 =?utf-8?B?Yi9vNmRUZXV4UmQzZnhieWp6bTJwR0xuS1BWZTNLWmd0UVlXR1E3WFprTXRs?=
 =?utf-8?B?eEU2aG9LYkFWUmc1SGtJNmY5ZW13SWdiUkFQdm1nOXl6NjhEOElsZmF0MmE1?=
 =?utf-8?B?TlJvc0pVbmo5QisvbjR5K0lNdzhvT20yNHg5WnNBc25jZitlWC9Ia2FHRkRp?=
 =?utf-8?B?RnNKZHczSnJEMTZYUDJNVW1HUTVnQTRYYTE0VUJ1Z1RkMUZZWGhSNm9SV043?=
 =?utf-8?B?TVVuN041cUVVUmxHYUtnMzBhSW1rV1ZZSWJXc3l0UG96ek1Fa1FveVhOQW1D?=
 =?utf-8?B?S0tBTFV4VDMySWdHRnVWdEhSRUYrS0dLcFFNOUFHbUwwRDZzRHlUaFFuTU9W?=
 =?utf-8?B?MjN3QlNwWktoS0tZY2ZEWGRDcTZvcG1XdXVoYm1MM0MrWS9UV1pQbEFkYWli?=
 =?utf-8?B?SUdTWEovRnRoN2RLY3BpWWpmMVIyaCtUWjUyeU9tRit4ZitkZlZEOFMxUDMv?=
 =?utf-8?B?b3ZJWUpiZjkrUExUelRGSGpaazJlRVJuQ2lydVVhS3pTckRQNTF3dXNaLzlO?=
 =?utf-8?B?VGZtbm5RYTYzM3BXMUhpNktFMXNIbjhFOXRKKzR4bDBkUmpsT1NFZWw0RmFB?=
 =?utf-8?B?bTNnOFAzNGY4R1hmQ3laSit1bWJIcUVrYmsrLy9QRDZoa09OMmRpQWNROFdq?=
 =?utf-8?B?VWtGRHVETlBvZk5kcDJYd1dxR2YvWDZUY3VOdWFOcmd3OFR6cE0rMThtRWV6?=
 =?utf-8?B?VGdWV0VzMStnTzJCNHZmbUhPTGpvMC8xK3B1OVdoNkdZM25aQThVc1ptLzR5?=
 =?utf-8?B?djVjak92bDFvYkRXc1FuYnlocFJ6OHlJeWtDNUpqdFBLeVljcWMwVVZXdmNs?=
 =?utf-8?B?KzVZQXZiMG04V1ArVnd1ODNyZklLbUZpb3hWcHBmUjgvVFJRc0NGM09DUTYx?=
 =?utf-8?B?YkVPMVlRakJYVFVvVFdXQ3FodUo4NHJ0bERzVUJ1N1lxS3N2M0VQTDdmRnFE?=
 =?utf-8?B?RXI1VU9xTTEwRmQrdkFFK2U1TkJ5Q1JvVjNtTjJ4M0FOcDhtUzIyVGNMVVJh?=
 =?utf-8?B?TmwwSmRZK1hWUVhHVi91ZHZIMkRnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDDC61659B3616468FDB1FF6A487D054@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d059f4-3a05-4d1b-a4a7-08d9f2de6a57
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 12:58:52.9488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XDfvtZGDA5FRGA14LXpVOB0054mjGDSCiZc8fXV28VCL+h3fIb2kanBODYZF5KIQSiUWp8HKqtTYukAH0Hz259taU0Uebgp3XW0E+IKbfjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2428
X-OriginatorOrg: citrix.com

T24gMTgvMDIvMjAyMiAxMjoyNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBPbiBGcmksIEZl
YiAxOCwgMjAyMiBhdCAxMjoyMTozNFBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4g
T24gMTgvMDIvMjAyMiAxMjowMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPj4+IEFkZCBhIHdv
cmtmbG93IHRoYXQgcGVyZm9ybXMgYSBidWlsZCBsaWtlIGl0J3MgZG9uZSBieSBvc3N0ZXN0DQo+
Pj4gQ292ZXJpdHkgZmxpZ2h0IGFuZCB1cGxvYWRzIHRoZSByZXN1bHQgdG8gQ292ZXJpdHkgZm9y
IGFuYWx5c2lzLiBUaGUNCj4+PiBidWlsZCBwcm9jZXNzIGlzIGV4YWN0bHkgdGhlIHNhbWUgYXMg
dGhlIG9uZSBjdXJyZW50bHkgdXNlZCBpbg0KPj4+IG9zc3Rlc3QsIGFuZCBpdCdzIGFsc28gcnVu
IGF0IHRoZSBzYW1lIHRpbWUgKGJpLXdlZWtseSkuDQo+Pj4NCj4+PiBUaGlzIGhhcyBvbmUgYmln
IGJlbmVmaXQgb3ZlciB1c2luZyBvc3N0ZXN0OiB3ZSBubyBsb25nZXIgaGF2ZSB0byBjYXJlDQo+
Pj4gYWJvdXQga2VlcGluZyB0aGUgQ292ZXJpdHkgdG9vbHMgdXAgdG8gZGF0ZSBpbiBvc3N0ZXN0
Lg0KPj4+DQo+Pj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPg0KPj4+IC0tLQ0KPj4+ICAuZ2l0aHViL3dvcmtmbG93cy9jb3Zlcml0eS55
bWwgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspDQo+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCAuZ2l0aHVi
L3dvcmtmbG93cy9jb3Zlcml0eS55bWwNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS8uZ2l0aHViL3dv
cmtmbG93cy9jb3Zlcml0eS55bWwgYi8uZ2l0aHViL3dvcmtmbG93cy9jb3Zlcml0eS55bWwNCj4+
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+IGluZGV4IDAwMDAwMDAwMDAuLjEyZmM5Yzc4MmIN
Cj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4gKysrIGIvLmdpdGh1Yi93b3JrZmxvd3MvY292ZXJpdHku
eW1sDQo+Pj4gQEAgLTAsMCArMSwzNSBAQA0KPj4+ICtuYW1lOiBDb3Zlcml0eSBTY2FuDQo+Pj4g
Kw0KPj4+ICsjIFdlIG9ubHkgd2FudCB0byB0ZXN0IG9mZmljaWFsIHJlbGVhc2UgY29kZSwgbm90
IGV2ZXJ5IHB1bGwgcmVxdWVzdC4NCj4+PiArb246DQo+Pj4gKyAgc2NoZWR1bGU6DQo+Pj4gKyAg
ICAtIGNyb246ICcxOCA5ICogKiBXRUQsU1VOJyAjIEJpLXdlZWtseSBhdCA5OjE4IFVUQw0KPj4+
ICsNCj4+PiAram9iczoNCj4+PiArICBjb3Zlcml0eToNCj4+PiArICAgIHJ1bnMtb246IHVidW50
dS1sYXRlc3QNCj4+PiArICAgIHN0ZXBzOg0KPj4+ICsgICAgLSBuYW1lOiBJbnN0YWxsIGJ1aWxk
IGRlcGVuZGVuY2llcw0KPj4+ICsgICAgICBydW46IHwNCj4+PiArICAgICAgICBzdWRvIGFwdC1n
ZXQgaW5zdGFsbCAteSB3Z2V0IGdpdCBiY2MgYmluODYgZ2F3ayBicmlkZ2UtdXRpbHMgXA0KPj4+
ICsgICAgICAgICAgaXByb3V0ZTIgbGliY3VybDQtb3BlbnNzbC1kZXYgYnppcDIgbGlicGNpLWRl
diBidWlsZC1lc3NlbnRpYWwgXA0KPj4+ICsgICAgICAgICAgbWFrZSBnY2MgbGliYzYtZGV2IGxp
YmM2LWRldi1pMzg2IGxpbnV4LWxpYmMtZGV2IHpsaWIxZy1kZXYgXA0KPj4+ICsgICAgICAgICAg
bGlibmN1cnNlczUtZGV2IHBhdGNoIGxpYnZuY3NlcnZlci1kZXYgbGlic3NsLWRldiBsaWJzZGwt
ZGV2IGlhc2wgXA0KPj4+ICsgICAgICAgICAgbGliYnoyLWRldiBlMmZzbGlicy1kZXYgZ2l0LWNv
cmUgdXVpZC1kZXYgb2NhbWwgbGlieDExLWRldiBcDQo+Pj4gKyAgICAgICAgICBvY2FtbC1maW5k
bGliIHh6LXV0aWxzIGdldHRleHQgbGlieWFqbC1kZXYgbGlicGl4bWFuLTEtZGV2IFwNCj4+PiAr
ICAgICAgICAgIGxpYmFpby1kZXYgbGliZmR0LWRldiBjYWJleHRyYWN0IGxpYmdsaWIyLjAtZGV2
IGF1dG9jb25mIGF1dG9tYWtlIFwNCj4+PiArICAgICAgICAgIGxpYnRvb2wgbGliZnVzZS1kZXYg
bGlibHptYS1kZXYgbmluamEtYnVpbGQgXA0KPj4+ICsgICAgICAgICAga3BhcnR4IHB5dGhvbjMt
ZGV2IHB5dGhvbjMtcGlwIGdvbGFuZyBweXRob24tZGV2IGxpYnN5c3RlbWQtZGV2DQo+PiBXZSBk
cm9wcGVkIGdldHRleHQgYXMgYSBkZXBlbmRlbmN5IGEgZmV3IHJlbGVhc2VzIGFnbywgYW5kIHdl
IGRvbid0IG5lZWQNCj4+IHB5dGhvbjMtcGlwIGVpdGhlci7CoCBDYW4gZml4IG9uIGNvbW1pdC4N
Cj4+DQo+Pj4gKyAgICAtIHVzZXM6IGFjdGlvbnMvY2hlY2tvdXRAdjINCj4+IEkgdGhpbmsgd2Ug
d2FudA0KPj4NCj4+IC0gdXNlczogYWN0aW9ucy9jaGVja291dEB2Mg0KPj4gwqAgd2l0aDoNCj4+
IMKgwqDCoCByZWY6IHN0YWdpbmcNCj4gSSd2ZSBhc3N1bWVkIHdlIHdhbnRlZCBtYXN0ZXIgYXMg
dGhhdCBhdCBsZWFzdCBmdW5jdGlvbmFsIHBlciB0aGUNCj4gdGVzdGluZyBkb25lIGluIG9zc3Rl
c3QuIEJ1dCBtYXliZSBpdCdzIGluZGVlZCBiZXR0ZXIgdG8gdXNlIHN0YWdpbmcNCj4gaW4gb3Jk
ZXIgdG8gY2F0Y2ggaXNzdWVzIGJlZm9yZSB0aGV5IHJlYWNoIG1hc3Rlci4NCg0KSUlSQywgT1NT
VGVzdCBoYXMgQ292ZXJpdHkgZm9sbG93aW5nIHNtb2tlLCBidXQgdGhlc2UgZGF5cyB3ZSdyZSBm
YXINCmJldHRlciBhcmUgbm90IGJyZWFraW5nIHRoZSBidWlsZCBub3cgdGhhdCBHaXRsYWIgQ0kg
aXMgaW4gcGxhY2UuDQoNCkJ1dCBpdCBtaWdodCBiZSBwcnVkZW50IHRvIGNoZWNrIHRoYXQgaWYg
dGhlIGJ1aWxkIGZhaWxzLCB3ZSBkb24ndA0Kc3VibWl0IGEgcGFydGlhbCByZXN1bHQgdG8gQ292
ZXJpdHkuDQoNClRoZSBkaWZmZXJlbmNlIGJldHdlZW4gc3RhZ2luZyBhbmQgbWFzdGVyIGlzIHB1
cmVseSBob3cgZWFybHkgd2UgZ2V0IHRoZQ0KcmVwb3J0Lg0KDQp+QW5kcmV3DQo=

