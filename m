Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA716219FD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 18:03:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440329.694501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osS0Z-0004r0-Vf; Tue, 08 Nov 2022 17:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440329.694501; Tue, 08 Nov 2022 17:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osS0Z-0004p8-RN; Tue, 08 Nov 2022 17:03:31 +0000
Received: by outflank-mailman (input) for mailman id 440329;
 Tue, 08 Nov 2022 17:03:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osS0X-0004ie-Sg
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 17:03:29 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42ac570a-5f87-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 18:03:28 +0100 (CET)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Nov 2022 12:03:18 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by BY5PR03MB5268.namprd03.prod.outlook.com (2603:10b6:a03:219::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 17:03:16 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%4]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 17:03:16 +0000
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
X-Inumbo-ID: 42ac570a-5f87-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667927008;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4lI8yLzbzBtd5q3LdiqCldbuthJ0tZu3BbFa2WJb5NA=;
  b=SwHS7t8S03Lfa7Wc+JhjSnLx11aUxGpQH3wBvYa+aNJGTf057YrQrwcG
   fJ9hX8w6zG/04HMwNXP4nf4NdBCGkbcb67Qj1s7Wc5v+mfJtM21VOM+e9
   r5UnyIyKf8mJDyXNCybo7OP0SZujNy9rCK8avEtB5Q2l4G3XcvRGSS0l1
   A=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 84005473
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:djOnfK/BqeT1QrJZoDH0DrUDQH+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2cbWDqBO/mDZDajKIx+O4njpElVuZTTzNAwS1A9rC48E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKgb5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkJy
 eAlBzooTiuMgtrmy/GeT9FFq+caeZyD0IM34hmMzBn/JNN/G9XmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTaNilAsuFTuGIO9ltiiSMlLn0Deu
 mXc+GfRCRAGLt2PjzGC9xpAg8efwXujBd5NT9VU8NY1hmSdzzxULicHC3eqjuuDpUO8VNBQf
 hl8Fi0G6PJaGFaQZtvgWxy1plaUsxhaXMBfe8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLRxitqeED02U8Li8pCm3fyMSKAcqaSYaQCMf7tLkoYV1iQjAJv58FIalg9uzHiv/q
 w1mtwA7jrQXyMsUjaOy+Amdhyr2/sSUCAko+g/QQ2SpqBtjY5KobJCp7l6d6utcKIGeTR+Ku
 31sd9Wi0d3ixKqlzESlKNjh1pnwjxpZGFUwWWJSIqQ=
IronPort-HdrOrdr: A9a23:ba/cLqspn1JVU9MYL7gVnt4Q7skC1YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPqftXrdyRGVxeZZnMffKlzbamfDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjJzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIP/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfpWG0hYczAgNkGmpDr1L8Yqq
 iJn/7mBbU115rlRBD2nfIq4Xin7N9h0Q669bbSuwqfnSWwfkNHNyMGv/MWTvKR0TtfgPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59bs5TOObFuF4O5gLZvi3+9Kq1wah7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm10xR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XXJ0vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLmzNV1wg2XwqUmGLEfQI5tllulEU5XHNcrWGDzGTkwymM29pPhaCtHHWp
 +ISeBrP8M=
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="84005473"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIfQvIy52shSpMKjBbay1BXTkZxkZVVdPBJerj9LS8zxugkLFzAzZi77nS6rQLxZACvLK2oprdgRty0liW2kdiuPApx7ugoNhcHxauOkSCJGwEY0bFiiyzbgpDgUC5PoHgWxUyVroWK8hMvr2iAEL+CRLEOsIqIkCUU227xEJAVb0iBIQGkNyjlFl7fqI3VP5ZAnFLtgAcz0VtW/zcTIGJlwLUARt+qz5+oe80AMAGVsX62DQGjVq73gIkV9D35bEsx4nPohZWnE10UfCFqn2YMDg9J79yMrlfbVEYxL9HytiXYdQNqztmKFRSXTBjdesQ9yn5rBLPeQW6YI8CVTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lI8yLzbzBtd5q3LdiqCldbuthJ0tZu3BbFa2WJb5NA=;
 b=c9Rx8MlCPYBvsivXp8wyJ5HiyLozMyHr4qV9t1Tah4tIlZycezLPbggi14Tq/YiqqD2S38rOpAEaO9hpTPIA9nf7rHCqgzbdePPhs1NKGy+bpge/lLflmp98yKAISsxU97Gq3OhBrTippBvAvamOeg65p+MXWF6GUMPaZ4+vaO5VoNhUqqGcZWbT3qdtaa1GE4fDKRwINcaFEKEhIYNr/9Vj/8qewTxfAhP4O6Ek64KhyB96l0k4em950vHB/J4NxsmYc7e5tKfKPuzehgj6mYNRJhgl6wFvjPlB9qHAEUW88+op2n6PplsMJkTORWJrhcywaHvDY62MQv6GATugNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lI8yLzbzBtd5q3LdiqCldbuthJ0tZu3BbFa2WJb5NA=;
 b=dX+xMAoAb//hj/scMbQsIrfw2uuMpUSz/qsyPJb3frjMvKc5M2WMZgN742sh8HTEnDCdqzTDrC6ZYkTwQTYUllWe219AS700dX0TVECfmUVXE4saXa+XNLbFdNw43TAOqncN0XhMZN2bIAchZNAqQABBd92K72P7yOkf98PBa+s=
From: Edwin Torok <edvin.torok@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>, Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17 v3 14/15] tools/ocaml/xenstored/syslog_stubs.c:
 avoid potential NULL dereference
Thread-Topic: [PATCH for-4.17 v3 14/15] tools/ocaml/xenstored/syslog_stubs.c:
 avoid potential NULL dereference
Thread-Index: AQHY84hVR008RTfgG0S7ZZaDJ+Tj1641MUyAgAAPkoA=
Date: Tue, 8 Nov 2022 17:03:16 +0000
Message-ID: <4F656868-47D4-4D96-BB5C-6CA22C7020CC@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <5da5b63bd6a0f8d0f6ad0281773eefb32de8164d.1667920496.git.edvin.torok@citrix.com>
 <658b1dba-d0e8-286b-837e-a49f791f6ebf@xen.org>
In-Reply-To: <658b1dba-d0e8-286b-837e-a49f791f6ebf@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|BY5PR03MB5268:EE_
x-ms-office365-filtering-correlation-id: ba10af33-ff0b-4f75-356f-08dac1ab20ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0or6viyO3Y1SkPQ8LXlkxENfS2Rx1BV0r0qgbJezwzS3AQ9zwUrmNPVwZKNdXrfJFMlzfcpNIolxeNwG0/3S+MhdPyTYvl/6Pm+2w9hazpDEiOHGJfvxxMoY3nrQc2WBVmtcjqE1uOG58U26I2qUNAlI47jQ3quMIKZ/Aqv0MSVo2UyGu7oEoRao6fF2Babi7uvaSQIiy+d2Fi6SlPKljSmnpA/AU/miCuUHMA3bdV5vj5gmIJER79+tJCeVXdtrHfarnf/pJVqvLL2JziKPJ3jnQUdmRHXo4Rv8gOi2X61XnFbQhUe9ORKVIwsr42zaYSDXss9P0NXeW2JBvul6RunAy/KdvrNJQTo9aLykdeJqSp+my5ej9acRKDigvhCT57LgYEUVLDY3rmap/yozrM7/v56ZzHocSENljG381ETIbch9yhEUiPRTIrvDMAJHATnNQBZ6tsn+aff0cuLbRFu94tgmFtNh5gTH6I9uD+xrtNswBQfDHgUORNYv7LSRH9e5AzF9vYfylmoqKk2VC9nYe0VrPKyyifZuXnjMpZyynB3dYOp4jzcKbetod/6nG/jUNSQEDx+VHnbn6OxrKCzJccxkaCVfqcGBpxtNx9IqbnGy+8t/vKKHe/JozieRufJWvCkiVMr4LpIIbmtEabg3ph8KuanHu8eYZ/gOsqIEt15p5rTnrNDRASXyDhrkfluElw+5I3N6B/ZoT5DkgOAMQ0vaX2x6XxvesyMwNbpdXSTUjGcs14iJZ3OlHM4V0sZ9TDWOgqbGRjAjIskf7FO8IX76S03P8xJxH6Z1QWU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199015)(2906002)(66476007)(4326008)(66446008)(64756008)(76116006)(36756003)(8676002)(91956017)(41300700001)(2616005)(8936002)(6486002)(33656002)(6916009)(5660300002)(71200400001)(316002)(54906003)(66556008)(83380400001)(86362001)(478600001)(107886003)(186003)(26005)(6512007)(66946007)(122000001)(6506007)(53546011)(82960400001)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGxWTHNhb1kxVzNjSlhzaEFJSWNYWXlCMEpYNWl1Ukc1Ym9DUWp4V2lnWXdB?=
 =?utf-8?B?UkIvY0dEZXQxYlJQYmlGaXdxMGZLMkZWQ005QkZlMWp5dngyeDUvdTVXQWxC?=
 =?utf-8?B?T3BFWVR6c1dlQjVtemFIYzZQNG1Hbm5QUnVFazRUYXlWS2NubmRnUEFZcE9t?=
 =?utf-8?B?Mjh0djBTeU56YXVZSzZ6VUNwNUhha0RmUzZwdVJyM2lxVXlzdSt6b3JaOVdH?=
 =?utf-8?B?TGk1S0RJNE1Ia1MxckV2SUFuTThuSFkzc29LQjNNK1ZuS2d6aTIyc01SRFh4?=
 =?utf-8?B?WXV3L2kwTllqZDFTMDZsVVI4ZWF2ZTVxalZXUnpjaHhWejBaM3NMZ1d2cFdK?=
 =?utf-8?B?dDRtQkhDRzBxRnRneEN2Ykp4TlFGUitLajZMWFBaZ3E4M1p3NHZLYkJhWURj?=
 =?utf-8?B?N1ZWYkpoY1BJR1o2UXhaY2tRb1ZwMjhQMmhFMjhxQ3N2bnRZNTJEOHVRdklt?=
 =?utf-8?B?NUM3VEpVUzY1MVkvb25VRkpWeXh3SUZxVUxGWUs3VnQ4clNZbzF6MEZSK1Qy?=
 =?utf-8?B?R1NYbC9MNlBQcFVKUjJzUytNbnd6UUVaUk9PZ0hNU295UXJvUWlLNVlBbkdE?=
 =?utf-8?B?aUd2TjgxM2lqSm9hbVFMekZoOXJmN2NmdENiWTV5aDBsMHlRUEhQaEY1cHpj?=
 =?utf-8?B?ZWRCLzNQMkEvSWpTOGNRcFp5ekEwM0l4YTM0N09wV0lKcUdON01lcndCM2k1?=
 =?utf-8?B?SUZiOHNwUDd1MFAxN093TEl5Z2luY2pxc0xiaGxPZTJpdG5ubkgxYmt2Y2c1?=
 =?utf-8?B?SFNtMWhXUkdCU2JaQ2pUYnRBSVVNTlJ1RWxBWCtBL0wxaEMyUWRkZFF0WkJT?=
 =?utf-8?B?clUyWXFaR2FFVitTS3U3WmlITndkWFg0NzBGazMwdEZlN0xnOXg5U1JjNDRl?=
 =?utf-8?B?d2pVYTlPdmFQNm5lbjNRRWNoQXIzMzNXNFZiQTdvQzFEVVVGdW9LWW1aV2Ry?=
 =?utf-8?B?MnBnblhPdU5zSHBIT1I0Q1JQMnNDRHhpVVVSUFptczBIRWJIYUZWSnhta25D?=
 =?utf-8?B?d3dOaE1XZ1RZMWhJVkpTWE1kaU1hRmJpbE5EcGtBRkVhVWN5bUVUc25STlh5?=
 =?utf-8?B?bENhUk1GZHlWVXlSSWpGWUh0N3ZFb2FoMGxpaFZKYUtzSDZYeVpXUU9kSVFL?=
 =?utf-8?B?clhVc0RNRzJ1VzlSK1NnMFhXUFUyYkl4TFVMaHVwWWF6VWpPVWlJRFhoaVNw?=
 =?utf-8?B?RVJWM2s0eHZhR2JKNTQxWGU0WXRVd2x2ZGZDUkJWMk5HOWVxTU44cWN3anpO?=
 =?utf-8?B?WGNMTVhKR2luNWZRb1EyMnIxS0ZJR1lzcFhaR3c5VkNUMmxndnhyc3RlTnlC?=
 =?utf-8?B?TFJZaFQzcmhyaDdjZEtwZGVYUVRSN3llbGF6RllQWElZS2hjR0ZWeFVFRE5h?=
 =?utf-8?B?RTlLdG0vS05ZVHRKdzZ5SXgxanFMbHNnMSt2QVY0MUdGM2wxSklhK3VidTdh?=
 =?utf-8?B?U1M4QUswYlcxQkdRSjZ0d3RDdkgxRndOVVo4ZWxoMFdFb3U4L2d5eE1CNXo0?=
 =?utf-8?B?dXdoekZZWjRYUGdkY0Y4cGUwQnpieFZaZ0VKRklSTjZLMnY2aUNQbVVaR1g5?=
 =?utf-8?B?cmoyMXJiMEZTU1A3RzBBaWNPN2ZGUDQ1dStiRmNwUStEZ2UySWRmRGU2TDVz?=
 =?utf-8?B?b2NmbjMvVHRyQjRweG80SDBaVXZKYUdLaSt5dGlaZzk0QjFhTzJoaWNUMkRH?=
 =?utf-8?B?ZnJDNXFka3BUN2prQUIrMkR5a2xxOFh6VXJvRElRUDhUVEJBblpEekJpV3dJ?=
 =?utf-8?B?UkVqeUhuVURyRFJuTUlxbTl6LzJ2eDd0aldRWTkwaFBSYjRRUHJOYVc0WXRK?=
 =?utf-8?B?KzBCa0ZFOWhWM3lweEVuWjJTUVEybEpJTC92Q0pRNDE3MjFpV1dJY2JtWmFL?=
 =?utf-8?B?c045cVFQUFlwRWdGNjFMb2xDSUxUWjFQSjZ1TDB4RGgvWnlrVWV0RGxGWnho?=
 =?utf-8?B?RW44TEUyQ0xvbXNNTnFyVFl4OFJZRFBsVUFGbWxySFlwOHhpTzdvVUdFNU1p?=
 =?utf-8?B?TEM2Y1NBN3I3VEtweTVOdXVNSzY2K3N1R0h5VmZiSVg3WURDVWMvUzhxYnhu?=
 =?utf-8?B?ZS9LOVgycFdOVmJQazdTTHlDL2JsemxCY0RrOFNXRzd3aHk2SFE0d3M0d210?=
 =?utf-8?B?dER1SmNlUzFpRC9SckhxNTBzV1NxeXMxbC84Tm9JazcxbmtQeHFkQ1ZMVlJm?=
 =?utf-8?B?MlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CCAB830AE900D4CA7432DFC934906A4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba10af33-ff0b-4f75-356f-08dac1ab20ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 17:03:16.2240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y2KCJFJL+13eZgW4p2jtBcCKpMSmsRabT2FleEwkeJESoOVQhhLRuxWzjPqfddg6Wh455oNjLEC0v/EwcfqjPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5268

DQoNCj4gT24gOCBOb3YgMjAyMiwgYXQgMTY6MDcsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwOC8xMS8yMDIyIDE1OjM0LCBFZHdpbiBUw7Zy
w7ZrIHdyb3RlOg0KPj4gSWYgd2UgYXJlIG91dCBvZiBtZW1vcnkgdGhlbiBzdHJkdXAgbWF5IHJl
dHVybiBOVUxMLCBhbmQgcGFzc2luZyBOVUxMIHRvDQo+PiBzeXNsb2cgbWF5IGNhdXNlIGEgY3Jh
c2guDQo+PiBBdm9pZCB0aGlzIGJ5IHVzaW5nIGBjYW1sX3N0YXRfc3RyZHVwYCB3aGljaCB3aWxs
IHJhaXNlIGFuIE9DYW1sIG91dCBvZg0KPj4gbWVtb3J5IGV4Y2VwdGlvbiBpbnN0ZWFkLg0KPj4g
VGhpcyB0aGVuIG5lZWRzIHRvIGJlIHBhaXJlZCB3aXRoIGNhbWxfc3RhdF9mcmVlLg0KPj4gU2ln
bmVkLW9mZi1ieTogRWR3aW4gVMO2csO2ayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4NCj4+IC0t
LQ0KPj4gUmVhc29uIGZvciBpbmNsdXNpb24gaW4gNC4xNzoNCj4+IC0gZml4ZXMgYSBidWcgaW4g
b3V0IG9mIG1lbW9yeSBzaXR1YXRpb25zDQo+PiBDaGFuZ2VzIHNpbmNlIHYyOg0KPj4gLSBuZXcg
aW4gdjMNCj4+IC0tLQ0KPj4gIHRvb2xzL29jYW1sL3hlbnN0b3JlZC9zeXNsb2dfc3R1YnMuYyB8
IDcgKysrKystLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N5c2xvZ19zdHVi
cy5jIGIvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N5c2xvZ19zdHVicy5jDQo+PiBpbmRleCA0ZTVl
NDliNTU3Li40YWQ4NWM4ZWI1IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvb2NhbWwveGVuc3RvcmVk
L3N5c2xvZ19zdHVicy5jDQo+PiArKysgYi90b29scy9vY2FtbC94ZW5zdG9yZWQvc3lzbG9nX3N0
dWJzLmMNCj4+IEBAIC0xNCw2ICsxNCw3IEBADQo+PiAgICAjaW5jbHVkZSA8c3lzbG9nLmg+DQo+
PiAgI2luY2x1ZGUgPHN0cmluZy5oPg0KPj4gKyNpbmNsdWRlIDxjYW1sL2ZhaWwuaD4NCj4+ICAj
aW5jbHVkZSA8Y2FtbC9tbHZhbHVlcy5oPg0KPj4gICNpbmNsdWRlIDxjYW1sL21lbW9yeS5oPg0K
Pj4gICNpbmNsdWRlIDxjYW1sL2FsbG9jLmg+DQo+PiBAQCAtMzUsMTQgKzM2LDE2IEBAIHN0YXRp
YyBpbnQgX19zeXNsb2dfZmFjaWxpdHlfdGFibGVbXSA9IHsNCj4+ICB2YWx1ZSBzdHViX3N5c2xv
Zyh2YWx1ZSBmYWNpbGl0eSwgdmFsdWUgbGV2ZWwsIHZhbHVlIG1zZykNCj4+ICB7DQo+PiAgICAg
IENBTUxwYXJhbTMoZmFjaWxpdHksIGxldmVsLCBtc2cpOw0KPj4gLSAgICBjb25zdCBjaGFyICpj
X21zZyA9IHN0cmR1cChTdHJpbmdfdmFsKG1zZykpOw0KPj4gKyAgICBjaGFyICpjX21zZyA9IHN0
cmR1cChTdHJpbmdfdmFsKG1zZykpOw0KPiANCj4gVGhpcyBjaGFuZ2Ugc2VlbXMgdG8gYmUgdW5y
ZWxhdGVkIHdpdGggdGhlIGdvYWwgb2YgdGhlIGNvbW1pdC4gSU1ITywgdGhpcyBzaG91bGQgYmUg
ZG9uZSBpbiBhIHNlcGFyYXRlIHBhdGNoLg0KPiANCj4gVGhlIG1pbmltdW0gd291bGQgYmUgdG8g
bWVudGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNClRoYXQgaXMgdG8gYXZvaWQgZnJlZWlu
ZyAnY29uc3QgY2hhcionICh0aGVyZSBpcyBhIHR5cGVjYXN0IGJlbG93KS4NCkknbGwgbWVudGlv
biBpdC4NCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

