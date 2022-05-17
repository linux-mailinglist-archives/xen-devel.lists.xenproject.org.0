Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2D952A2C7
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 15:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330806.554199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqwyF-00079x-0X; Tue, 17 May 2022 13:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330806.554199; Tue, 17 May 2022 13:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqwyE-00077s-Tf; Tue, 17 May 2022 13:10:38 +0000
Received: by outflank-mailman (input) for mailman id 330806;
 Tue, 17 May 2022 13:10:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=juf1=VZ=citrix.com=prvs=1294c2b73=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nqwyD-00077k-Fr
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 13:10:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb89a2c0-d5e2-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 15:10:35 +0200 (CEST)
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2022 09:10:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5639.namprd03.prod.outlook.com (2603:10b6:5:2c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 13:10:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 13:10:27 +0000
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
X-Inumbo-ID: bb89a2c0-d5e2-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652793035;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eCxM8VEeRLSTlOrps4UsKuiPVOCRAxFgQJr/oYzyezM=;
  b=PHDQOiPRMdnhXxSQ8kWzn56lCE3RR+aBKb8fpIq/1iVbEXMSGZLpNEYd
   phBQpEvb1OhyCRYfR645/xxHEZDyw6GwLgtP4BtfOxuT3Rq0+A3/Db2fG
   B3IPSBl4DYkAEX89geDcoGJ8IppVFGo83+wvHmuWVB0sVHhuo5ecWeWr7
   8=;
X-IronPort-RemoteIP: 104.47.55.170
X-IronPort-MID: 71483780
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cyBQjaqxNSLe3NxHto0YHqPUxf5eBmK/ZBIvgKrLsJaIsI4StFCzt
 garIBnVb/6JYWrzcot+aY6xpkwF7ZHTy9cyHVdpry1gESMb9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvQ4
 Iyq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBP5/0v802XwBhPX9FPIhM+q6YLFqmrpnGp6HGWyOEL/RGKmgTZNdd0MAnRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFgXFp2Zgm8fX2P
 qL1bRJGahjabgIJEVAQEJ8kx8+jh2Xlci0eo1WQzUYyyzeKkFwqj+i1WDbTUsKWdMlStRa4n
 FnHxn/iWR0QOcaY+wPQpxpAgceKx0sXQrk6EKCz/7hkiVuYy2gXFTUfT179qv684mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+c38h2Xw6zYpQOQHHEZTyVpYcYj8sQxQFQCy
 VKI2djpCDpHuaeQD3ma89+8tiiuMCIYKWsDYy4sTgYf5dTn5oYpgXrnTMtnEaOzps34H3f32
 T/ihBY5g7IfnMsazZKR9FrMgy+vjpXRRwtz7QLSNkqn5A5kYI+uZ6Sz9EPWq/1HKe6xUV2pr
 HUC3c+E44gmD56XkzeWaP4QB7zv7PGAWBXQj1dgEJgm8zWF4GO4cMZb5zQWGatyGsMNeDusa
 kmDvwpUvcVXJCHzMvcxZJ+tAcM3y6SmDc7iSv3fcttJZN52aROD+yZtI0WX2ggBjXQRrE32A
 r/DGe7EMJrQIf4PIOaeLwvF7YIW+w==
IronPort-HdrOrdr: A9a23:kHOjnqlFd6HdVMb5w5HXU+MrFdPpDfIL3DAbv31ZSRFFG/Fw9v
 re5sjzsCWetN9/YhwdcO67Scy9qAznhPhICOUqTNSftXDdyQyVxeJZnPDfKl/balDDH4dmvM
 9dmpRFeb/N5DBB7foSizPWLz9P+rW6GYmT9J/jJx8Ed3ASV0jP1W1E4m/yKDwTeOA/P/sE/e
 GniPZ6mw==
X-IronPort-AV: E=Sophos;i="5.91,232,1647316800"; 
   d="scan'208";a="71483780"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUbLTlOWPniCMavA9s+R37I4KUQGtsLSmRauEmLn0JREZIXjh7jPHSIy6DsCl3cYXML6fUAx1+vI+450TWHP0s9iUoEIzMqZdJ4FtX4Tao/n7A9lQFZZetZYQfWZRBLMSWdTgpM4EBBL4odFrxIiV23RjWp4ChtX4N4ZuQknb6AQs44+3B3RtVzSjMVXEwSw/LLazRVTco68aoTrOaMoZttNUX6Eh1+u1RLYQnd0WQRkHMjbVgWo4C4DQmQBatPuTzQCL7NaklccYYEakBd7dc+ADCyDeRAHa7loKAFgSr61MvRpgiETznEtgk9kplG22Aaqe+2RDUgP2DOgtppFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCxM8VEeRLSTlOrps4UsKuiPVOCRAxFgQJr/oYzyezM=;
 b=Ms/Wzb01BkEIxzBk8Msyh93u3YGlzmXbuKNFS+ZLMbRzbIf0y03+FC43HTtUtCdJvjd3H02LqrR5sX0Ze31KtQl3G9EQRwN3PYEzsP/SMrl5wAAoYSukvUrBSmwkDrvOIXgtz7sFYIVmYYMbH63RZ0xEMwOnjgXqrNzMo4MByHkWggefWyde2lnq6nmjQM6w21lvYiqa7OLn6ql0BYlifFfwGpmNZNBhWMi9Q/+7MXoQK87JyHve8GCezPgZ7OlOiPZIJ3YuyeDMxQ3gR4Qgvao3SpLrsIsjTMHShaosRXFwbiVNI2HOPn52yCfL1tpF8YmDHyy+CCCaZaFBJZ8NBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCxM8VEeRLSTlOrps4UsKuiPVOCRAxFgQJr/oYzyezM=;
 b=bfjgqQzkWztrIwAhKexxTZRwt7thhkEK8UL0m06udUba6R9Tvp9Zj8AV7b510UmRPW8mHbyquD9vQtMGOVBTWn+0Jdt6OmUBH4Bwz/T3rEba1IWlBs3q0YZ4371g2FhjBpkWMxbnQ23HgftlQYc9AmHR6VELp5SUmIKAeT1slrk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "wei.chen@arm.com"
	<wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George
 Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: [REGRESSION] Re: [PATCH v8 6/7] arm/dom0less: assign dom0less
 guests to cpupools
Thread-Topic: [REGRESSION] Re: [PATCH v8 6/7] arm/dom0less: assign dom0less
 guests to cpupools
Thread-Index: AQHYYUDliIUtXuVlFEquWiHjLJV14a0jGe8AgAACgQA=
Date: Tue, 17 May 2022 13:10:27 +0000
Message-ID: <55a2bb89-da5b-27d0-2f7d-bcdacb19300a@citrix.com>
References: <20220506120012.32326-1-luca.fancellu@arm.com>
 <20220506120012.32326-7-luca.fancellu@arm.com>
 <e434527b-5804-324c-3619-51a552802d2f@citrix.com>
In-Reply-To: <e434527b-5804-324c-3619-51a552802d2f@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 302cf00c-fad2-4946-c5dd-08da38069c6d
x-ms-traffictypediagnostic: DS7PR03MB5639:EE_
x-microsoft-antispam-prvs:
 <DS7PR03MB56392002312E5A17DD062596BACE9@DS7PR03MB5639.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5mzvENElwISGSQA6ZbGz79ZslxYsEqBTnahkCdqGdwbDGds5GLeO4cOAFeP8mKJk+JDYUpKE+5KCh/luCv3wXqFJU5N+W9p0eO4rQXvepUNGnkcqFpgFSIcfDVo1lLlkILUHcbRAB+6+lBozKN398W6lx/b8PR1VJS+3rGrA7MkEfocQI3/84kBfg+/5Uw59a33O/IL3rITYvlCMPjgJsklhvqemz0QznqnVScDrPH8fG0AX2Xojpkxy4LkGrtCSjT9xKXZval52KlfHVRA7KigW4MQNuQr3sFNLkHhsCOCjGWUtLsvVCNAvuoskaUxZin8/lyXSnb3VRM/KcSJYGHJSa2SuENobYOa3ljoeBsm+TsPhM9XZn0Vn1weCyENKurobF76mgQus48RCczRCoD/beDPdAU8bE/0P+rjbk4K6xtU70I6wZa+zlYWtjm/UpF0L1dDWYcypRFMpv2NQcJk8BGdHnjMht9mB64DdabcRdNkK7jIQQfLrt8qUCzU8c8atLmejRWDWyjtnq4xQltaDxUS/g3Dl0W+dNqaImaSo/0UpVVqndFkaMoUSLDKiWJtwXReFjCMiR4DyrmUU8Er6yWLR+G4TFshb1aatmVOCHX27HHqunz5XYuDkMToTi9cxkuDj9GOy5TfIMsy7IIrdQCzTrsW/V4Nl8BiXYVdQbchiVwfoyweN89fYQ9lqzt6pBejfRvD5RZiNgO0Gk7lA1vv7mAja/upeo3SF/Q9ql4BvKWe13mlPI31YKZQnO5v+iMw3uZOuLWJR7nneTqYqLDVhI3FwIGirqxdhyt0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(38100700002)(2906002)(122000001)(86362001)(6512007)(83380400001)(82960400001)(186003)(31686004)(316002)(110136005)(54906003)(36756003)(71200400001)(6486002)(91956017)(4744005)(4326008)(7416002)(5660300002)(508600001)(76116006)(8676002)(64756008)(66446008)(66476007)(66556008)(8936002)(66946007)(26005)(53546011)(6506007)(2616005)(31696002)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2NOOVlPajJ3UEJaNklWNGJKaHNSNHlneURsVUJrN1VCOGVCS2xhK2JQQ05J?=
 =?utf-8?B?WVo4bFkrZEJuQnhWVlhRYzhEYUZUY1I5Z3Z5Q1BUTjNSaW96ZVQ4cTVacUds?=
 =?utf-8?B?MkdxZkE5Vm9kQmtORnF5eHRTS1hWRDZXKzhKYytzS21SL0VOdTZib25aaXIw?=
 =?utf-8?B?QTVrTVZCRTF2R3ZaWXp4VnRWS1A1UlRNNTAzNTJFNVBxcm9zK3pveVZ3a2x5?=
 =?utf-8?B?MElHZ2hyQVVMYmxHVFlpVk5sKzZOWTJHaW13bUd1ZFhFeCt3Ymsyck5ncThr?=
 =?utf-8?B?RDhJbk5DOEtuYTJpbWpzYStFQUlvOEpzcngzYTJaTUFGQllDMmVqeVVTTTJm?=
 =?utf-8?B?N0xKYXpuQURzRVFBbkF0U2tpelBWUWF1ekJDVEdKMHhtMG1pckROTmZ6Z1Bn?=
 =?utf-8?B?ek1LTFFSTk9sZzhhT0ZDbkZLOGovT1JTL0w4RFhPbXN4TkUvY1BSSDErNnRi?=
 =?utf-8?B?TkE1cHRMdUQ3YUFEZ215TElQK2RRM1hzT2c5VmtHdWRHV2hyeXlPeTV3Tk9h?=
 =?utf-8?B?cjRkN2NEcU5CT2d6K3VOUlh5eW1ZTnBVNkQrallvMllEbkp0bnJpOElMa25q?=
 =?utf-8?B?bGxWc1FqK0pDMFN1dmpRcEtVV1pMa2RtcjQzRWNJY0VtWUx3Y2NmUnBQZnFO?=
 =?utf-8?B?eXd3V3dQV3k1MjR5bkxpeHBTQk4wUmFSWTQrbWhpUDJrOWlIUStncmpSYmY5?=
 =?utf-8?B?MVFtSjJrWTFqbzlxWm1sYm1oTCtRcll3VFNmZ0M1R0lLaDFQZW9NMHo2YjNQ?=
 =?utf-8?B?S2VnVGxDZGNiUXJzaWpwZWpPOXpwOExVWWVKRHFsbjZVdmJFdDc4YWx2QTU3?=
 =?utf-8?B?bEVmbE5nWFdYTHBiMXR1VGFCdTUvWFBNRG5wVG0wTkZwRm51WU9RdG5HM0Iz?=
 =?utf-8?B?SDNENGlOMXFMTG9rbUNCL2hIbXgrc3VkWlhZdUlTYnlvckJVWERFeERCSzVw?=
 =?utf-8?B?d0xpSHRwY3B5bStMbjBCaUJ0ZldxRm0yeGVpY0NIWmUrYWVPeVJjWkpnejIw?=
 =?utf-8?B?dkNUQXJGbFU4TkVyWm5Fb1U1ak1PYURpQ24xTVRvUW5Fd3lxWlJOTFpmLzQv?=
 =?utf-8?B?VjY2YW1MRXZSMldsVnU4RTZUN1BDcDUyVG5QNnZWRm5FbEpVejJTSTdQaWlY?=
 =?utf-8?B?NDdNamUvNk5jVmtkeTZtOGtCWm50Z0Jkd2J0dnhGS2FVTTJLblgzT1ptNTFF?=
 =?utf-8?B?bXVKSXVrMTVsV1d6V2xqNVczVVgyM2ZiRWs0bUVOZS8xcjBlWGVrYTZ3ZTRR?=
 =?utf-8?B?N1IwRWs1TDcyS0tDTFlhUS9DckJ5U001Tzl5V0dsYmUzNTc0SjVaNnlrU1p1?=
 =?utf-8?B?Y2VWaDRMYzlsdWZwb053Y1k5UlBQeDNCVlgrcmFQczRNS3lhdFpER2ZYSzQv?=
 =?utf-8?B?b0pNWDlncjE3Z1poTkdUMzV3ZjlNNFVDVU9HQ2l1Zko0NHhzWXBjT2wvL2pZ?=
 =?utf-8?B?NXpqNHk2RmVoZW93MElBcXFqUGZwcXQyS0FlVFpXMlEzc1RETmwxUTdjdHlt?=
 =?utf-8?B?YkV6Q0o5V3Znc1BvemJOU3pjdkNFQjdvdVA0RGdVWkttcTJKTDFYeFovRTcw?=
 =?utf-8?B?eGZGRUp1Qnd6RzJHejFnZDF4VXYvS2lFbXl4UjJpOUx1TGxDdlI3OEMxQ2Zr?=
 =?utf-8?B?S2FzMXdHaWJDcDEyWVpqakZ0SjY5VFF2YTNXaUhnNDhOT0N6WTVVYjltVlNF?=
 =?utf-8?B?Z2ZpTXpCaGVUQlhhTkZ6bCs5TCtKaDZGdjlZcjU5cjVGRDVkSEFxbUtrcWx1?=
 =?utf-8?B?YUxNMTc1V1FhK3VUbjNZVlBRZWxmaFc5MTdremNzczRRMk9kT282Z1p1aUV3?=
 =?utf-8?B?eGxDK29MdXNnODY0T1pEZmYrRTcyK2d6WXk2THc0cUhwUTRNcDUxVHFQYWEx?=
 =?utf-8?B?VGt6Y2d2NWw3VjlQeERHMHZESVE3cmdjQ1ZEeXMzK3BVa1pUSlBqOG96dHpX?=
 =?utf-8?B?UDl1OU1qb2poVDY0d2N1ZkRVTlVYVG1IUGE3TlU1MWE4MDZwc2JtOGRaMm9r?=
 =?utf-8?B?c2NQamRvRlZBS0FTemxsR1FpZ0FLS0ZxSmVjR2JQem43TW9jSGRBSGczS0lJ?=
 =?utf-8?B?cm5FNGYvc2srd21vV1lITzYycW5XTlYxQUlSTmJxazVEME0vcEtEVDZ0ZEFJ?=
 =?utf-8?B?eGtjbDZHUkxWRktpenFKU1NMcjBJYmF2RE5adTJ2TSsvZWx2Y0kySWdSVHJk?=
 =?utf-8?B?dUd5amZUTEx1b3pIUThrM1g0cW1RcjdpaFZrMWh2UHlnR2dyT2VJMDFySjky?=
 =?utf-8?B?VzdETUpsa1dQa3BVZ1FTdDhVOXdhdG5zam16b0I4UW5BU3Y5MzN3TUlIUm9X?=
 =?utf-8?B?U2srNUxZeFZ5a1dhKytzMFkyY0NCL0xHQTVpajFBUTV2c21sZktEcmdPazRW?=
 =?utf-8?Q?J2Bj1umKLEwoiU0Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A83569E050253468B227906A17F7F1F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 302cf00c-fad2-4946-c5dd-08da38069c6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 13:10:27.1589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LxaoMIvHTUfQ5ueKlE4seH/GIGJpphxBgn5EWU3OQdydX8C1kwH0wvuktH3yZ+oVPj5CognXyYd77na7SI0MnMZHKzPElo3jPVF4duZYKqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5639

T24gMTcvMDUvMjAyMiAxNDowMSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDYvMDUvMjAy
MiAxMzowMCwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IEludHJvZHVjZSBkb21haW4tY3B1cG9v
bCBwcm9wZXJ0eSBvZiBhIHhlbixkb21haW4gZGV2aWNlIHRyZWUgbm9kZSwNCj4+IHRoYXQgc3Bl
Y2lmaWVzIHRoZSBjcHVwb29sIGRldmljZSB0cmVlIGhhbmRsZSBvZiBhIHhlbixjcHVwb29sIG5v
ZGUNCj4+IHRoYXQgaWRlbnRpZmllcyBhIGNwdXBvb2wgY3JlYXRlZCBhdCBib290IHRpbWUgd2hl
cmUgdGhlIGd1ZXN0IHdpbGwNCj4+IGJlIGFzc2lnbmVkIG9uIGNyZWF0aW9uLg0KPj4NCj4+IEFk
ZCBtZW1iZXIgdG8gdGhlIHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIHB1YmxpYyBpbnRlcmZhY2Ug
c28gdGhlDQo+PiBYRU5fRE9NQ1RMX0lOVEVSRkFDRV9WRVJTSU9OIHZlcnNpb24gaXMgYnVtcGVk
Lg0KPj4NCj4+IEFkZCBwdWJsaWMgZnVuY3Rpb24gdG8gcmV0cmlldmUgYSBwb29sIGlkIGZyb20g
dGhlIGRldmljZSB0cmVlDQo+PiBjcHVwb29sIG5vZGUuDQo+Pg0KPj4gVXBkYXRlIGRvY3VtZW50
YXRpb24gYWJvdXQgdGhlIHByb3BlcnR5Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFu
Y2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFRoaXMgaGFzIGJyb2tlbiB0aGUg
T2NhbWwgYmluZGluZ3MsIGFuZCBpcyBjb25jZXB0dWFsbHkgd3JvbmcuDQoNCkFuZCBpdCBsZXRz
IHRoZSB0b29sc3RhY2sgcGFzcyBpbiBDUFVQT09MSURfTk9ORSBhdCB3aGljaCBwb2ludCBYZW4g
d2lsbA0KZmFsbCBvdmVyIGEgTlVMTCBwb2ludGVyLg0KDQp+QW5kcmV3DQo=

