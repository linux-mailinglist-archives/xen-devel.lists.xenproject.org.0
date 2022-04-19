Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538545070B9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 16:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308204.523819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngoyc-0005ek-8N; Tue, 19 Apr 2022 14:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308204.523819; Tue, 19 Apr 2022 14:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngoyc-0005by-4I; Tue, 19 Apr 2022 14:37:10 +0000
Received: by outflank-mailman (input) for mailman id 308204;
 Tue, 19 Apr 2022 14:37:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mThm=U5=citrix.com=prvs=101c57682=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ngoyb-0005bs-5c
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 14:37:09 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c8b6995-bfee-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 16:37:02 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 10:37:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5153.namprd03.prod.outlook.com (2603:10b6:a03:22c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 19 Apr
 2022 14:37:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 14:37:02 +0000
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
X-Inumbo-ID: 2c8b6995-bfee-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650379027;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=t2VtGFmwRPmuqTfnbDl0Am+3sZbzCgD4fvum6MSiFWI=;
  b=iPbFq30/pDMJBR5W2SIi4XLzFLsMPlt4gjwcJCrIByfjIH9iZcGuJaZh
   YnI7yYiDoGJoo+IbwE6l6irUUXE9nIlDPSjjWNwjHGV8hA6GqRDUTkacz
   WiuAO8QrbUPPbFSVK/wDD790all3+oTWG6wNI6DTIi6Qbm5WegKyvv8Qq
   I=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 69432854
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:E8QKBavyminSV4S50LzMegGZP+fnVJtfMUV32f8akzHdYApBsoF/q
 tZmKW3XOPzeMTDxKth2Ptmw9RsHvcOExoRrTgQ4/HthEisQ+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1/U6
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi94O6TDhLRMeiVeEmZGIY532JzgLiKG5Jn7I03uKxMAwt1IJWRvZ8g9xbwyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4EGmmts7ixNNa+2i
 84xQDxjdhnfJTZIPU8aEskWl+a0nHjvNTZfrTp5oIJpsjSIllwsjNABNvKOf/+IGelLw3qkm
 T3XwnbAWS0+NNiQnG/tHnWEw7WncTnAcIAdDrqj7dZxnUaegGcUDXU+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaGtBMBX9tbE8Uh9RqAjKHT5m6xBHUATzNHQMwrsokxXzNC/
 kSSg9rjCDhrsbuUYXGQ7LGZqXW1Iyd9BXAGTT8JS00C+daLiIozgwPCSNBuVrG0itnuMT71y
 jGO6iM5gt0uYdUj0qy6+RXCnGiqr52QFAotvF2LAiSi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02zaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:eXvXOqpFIYelBmAvTHPEak0aV5tyLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcYtKLzOWwldAS7sSorcKogeQVhEWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZe6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInNy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0WVjcVaKv+/VQIO0aWSAWUR4Z
 7xStAbToJOAkbqDySISN3WqlDdOXgVmiffIBSj8AbeSITCNU4H4ox69MNkm1LimjQdVJsX6t
 M140uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pXVFZ9l/1owKpuKuZIIMs60vFULM
 B+SMXHoPpGe1KTaH7U+mFp3dy3R3w2WhOLWFILtMCZ2yVf2CkR9TpT+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBRjMLGWRK1L6E7xvAQOHl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P1njDMWftac7hSwlgF/NKQgF5vsul6SR4IeMNYYDGRfzO2wGgo+nv+gVBNHdVr
 K6JI9WasWTWFfTJQ==
X-IronPort-AV: E=Sophos;i="5.90,272,1643691600"; 
   d="scan'208";a="69432854"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oj1xJS4eUBQx2Xy4sSOmMDC1YRppBa2nPgxg1T/OlnkDUkcsM1g0C0yrXGl4DoD81ElZ1pljayBRHNR16VZiPjeftbGCGfwibhJbTJ+3ofP5L3Mg9m2WHUnsMS+MjWKYxjRQlowNN7Ys0YrX+673ed+2RB5dZUho2bH3oDnoi6fAUV9B1OPuFk0F03EgNcafVZh61zc1DOafstGNOOg+UCC4O7pXje9ZQnjKary+KL0f/UQh6mBgvRCpxQPxSQjcPC1ugcXeqmLEdnMl5c9b7T2RfyE2n+PbZFUniHcUGm+iqP1SaV2V3nrlwMsxCSbQO12l4YgIb6BuBtvTHPXSMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2VtGFmwRPmuqTfnbDl0Am+3sZbzCgD4fvum6MSiFWI=;
 b=ceGyzipaiVHu4ozS5r0uOFbSWOFZSl9RxJH+LFRt+wHFqeVQ9Lpa5+D903LLK4y0cARaXH59jdedlYn/Ghuo0SSF00MBqzU1xxmT8hJ3OI+xHnJrq3Oo+eorQidPeFISfMuYkN03PS/tbH8hIdxpz1g55FZVKyDrItc0zR03Wj1FFsW1kGuB3vdcATIVwwOal0S5Cgzk8aqs/6erik3E1M4cUQTEgY1RRZl7WQzDmYohuUDDzDE9EsMsVTXpCKkpURCCVZ1ObX2mXSGmIlVDydhzRYliBfpAw/GyFbKTSm39OhSWKpDVJy1CYEOpPUVN3tl1iNL7O1fWslUpjFRMZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2VtGFmwRPmuqTfnbDl0Am+3sZbzCgD4fvum6MSiFWI=;
 b=dMOBGr1yR4oL0e0hTszfyv9eBhAYdCMF+vqmJRyVo8mlaRNGgY7Zxuj6ZEFr3jS8NPPrkRQaxjbx0sBZsEkTW8CT33kEyOwbRZ740A8ugc8CDTY5Q6fuKEyUzRGWDpvDY9Q3XwXhn5rtHJp+F0XoUw6M08rGc87CoJmjpbLSvkg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Cheyenne Wills <cheyenne.wills@gmail.com>
Subject: Re: [PATCH v3 1/3] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
Thread-Topic: [PATCH v3 1/3] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
Thread-Index: AQHYU/TJb6Q1Q9CJy0G0bOkg81j9/qz3TfKA
Date: Tue, 19 Apr 2022 14:37:02 +0000
Message-ID: <ceb80e3b-d8a5-de29-5041-ffa1ad071ed8@citrix.com>
References: <20220419135254.21729-1-jgross@suse.com>
 <20220419135254.21729-2-jgross@suse.com>
In-Reply-To: <20220419135254.21729-2-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e98d8f03-7598-480e-7077-08da2212115f
x-ms-traffictypediagnostic: BY5PR03MB5153:EE_
x-microsoft-antispam-prvs:
 <BY5PR03MB5153C31418B8D83AD1E576BEBAF29@BY5PR03MB5153.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 TmuqaJ7nHyp50DBWWf1wUB5KWw+mrFvN5ziMCV0l02IBuYP6tmiIerMNPLsHKHhIdl4bR+c5e6pX+8HXcbOz/B8RwWNUp2U5V9BIMQXzEVNHfOO96k0stQ68fYNGUNesxO9GQ4DsRPMMZAfMFN9S9NyITLVgIXHwj8UI0BSPaxEje3pBhSrThtzYnuptPnGzF6XP1bUYWHHzQocjbeDvc9SjqfxRzc7GdvJZtHTFtD1dMXW+GfeK2K3O66ChTjjcFjcgO5f4QgLJUwtrcsaOxmeJQ8gUsi/fMj+eGbEHkqZYZXe8Kez9gegV/lh+F2/fUPxl7ytxsjPUKj0pEnCz67zJayDgHKW1frJFIqvDsbTywSLpZjyv8Eheeb9hckzDOS23lVaREW4OQ8eGrD9OgwCcTvrLjIY1c1zB9DvFeidZngMWoAangNp/TpURk3k7BRNGnX8SDasOWKfq4M0wI9p1Ob5nQoF6uoQ0mXuEcXYPTQC88LGesJ/CoTWtlO8a8lgzwGWynZT/aKVpgM2Mdm77yvw/D0u9S7kbwk9TTp/sn7CB6MMFQAYKO2FpeXBjZSFwoPA+JFmjqZngARpT6MYdKKvfjSqNih/ZcSluFgxfoXdxBJDRPNi08pGGiwdjDFwxBXyyFRPKeFgMglsdAFQRCVc41kbR+t24yA0YZVSt9ZfDu+6KX5mZYxZqKr/0JHzxvjrB2Hxh+Cut+sJQVdAvEimSUgBSKM3Omery/jIup+uEkQBcLOvJwtjINmy44RkvLz/WnVIWtL2C44WB7w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(110136005)(6486002)(54906003)(8676002)(122000001)(508600001)(83380400001)(66556008)(71200400001)(8936002)(91956017)(66946007)(31696002)(76116006)(31686004)(64756008)(66446008)(66476007)(316002)(186003)(53546011)(82960400001)(4326008)(36756003)(2616005)(26005)(2906002)(6506007)(5660300002)(6512007)(38100700002)(38070700005)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?enRBQXF5emxSaGc1YklJZ1M2YkJkdEhkWGw2dlA1Qjh3Z1BoQ09RSy9nU1hu?=
 =?utf-8?B?Q0szTTBGVi9jcnFXbDVmS3NtT1hzWUdaR1pVMGV5WStLc1RRUFBNYk91aysz?=
 =?utf-8?B?ZzRMallvNkduYTlQNFBXUWFvZUN3YnNLUzR5V0pRbnVrcThvbk5ZTlZYYW9n?=
 =?utf-8?B?OERmYkZaY3NmaU53ZzN3aFR3N1hEcFpNMGh3amZ6c0xkS3V3TytUWjM0VmFV?=
 =?utf-8?B?ZC9wdGRXZWp6ODBUOFlnb1ZCZmVHR2MxbkJUeU9RZnRzWkp1SDMzenpnMlRa?=
 =?utf-8?B?Y2wrYnp1bjFNNWFRYXkrbVRVSy85c0JJamNybk5JYm1tSGxOSUorMVZKeUZQ?=
 =?utf-8?B?cjhHY0F2WDFzYkoza3c5NjVXVThNcDRnUjFSS0E5Vk5RK1R3TFZ0b0ZkdzBu?=
 =?utf-8?B?NDRhRHRMNUdlZWRpRmFIeGpZTE1LeGZjQUQxTThLald5WjZYK0xCQ3pJeG5E?=
 =?utf-8?B?YnpqeFV3d21mTmhUS25ZdEZtRGpNREdpL0NnOEluanllWDgwYXkwRWlGTTFS?=
 =?utf-8?B?emdhbUN1ZktyV0pvMk9saGRyN3VtRHN3dzZSZTlIQy9GSS9lZkxaSGVUdEli?=
 =?utf-8?B?M2Z1WngvOEhqSkxYVHorc1R2eVpOcGxsT3hFSVJMSTk0RUozSkY4ZVp0ZUhn?=
 =?utf-8?B?OFdOOU9jTEZ4VEMvSnlvYU1PS2RoLzhERytvb3BiSk00Wmt2QmFRQjNBVi9V?=
 =?utf-8?B?ckFIVFhvYU00UzlKUGluVFVFZTFQZ3FKYVpXYnppeklTdjIwNFEweUVNZXJl?=
 =?utf-8?B?OEJoMnNIQ0REa3QvREhwMWYyNXRzTE1wdDVoZWFtTDB6bzFyVDBUN1hib3JM?=
 =?utf-8?B?V3A0c0crdFNOc2FtcnNNaVR0WVpjeVJUblpUa3MwbFdUUG1GNC8wczJxeEV2?=
 =?utf-8?B?bXYvYWVpNHYzOVZYKzh1cGd5VjMyYlptYXduaEZWclpTOGZKN3RyajFMWk5C?=
 =?utf-8?B?b0g0cFh3dW9qek5HSmNzWlg3Mmt0VXYyb3RVVTVHU2N6RUNSNEdNOFRNNHpG?=
 =?utf-8?B?L0t0MllVeHdTQXpqZkVsM3NFQUNtRXBlUFNGdlZhSU5qa05zRSs4Tk80UUlK?=
 =?utf-8?B?V3dGL1NLV3Q0MmdFU0ljLzA0bzAzMEdNNEJjaEVXU2lERVIySUFPYUVLR25h?=
 =?utf-8?B?ajY0NEo2VElkSVl4M0dzd0t5SmVRS1NtdWJrRnZ4bXJ3Sjk5UVNjcnJ4UU1V?=
 =?utf-8?B?UTUvR2JzRnZ1Um5TVVJya3YrU0tlZlcyY0RmK0l4T2tqT1QwelpRY2Jvdm5P?=
 =?utf-8?B?VTNEaWwwWG5sbFhPeWp1VVlRelh0cmxidlcyUmZRd0x1NE9jVXZTeDdDUDBR?=
 =?utf-8?B?YUZUOTV6VmU2UHZVM0ZsNW1pb1MyREV5Y1IwV0dLbUd6bUZrZE52bGJBT2lC?=
 =?utf-8?B?MDc0Wlg4TkppUTFTMlFzbWtOOXpOd1Npb2JhNDVrZW5VR3JOY1UyWVFDT3Fu?=
 =?utf-8?B?eDBETkM0c0JwcWV5a1VENStLY3J3UEhOTXRlVG11dktKUnRzUkYvOWpZcGE0?=
 =?utf-8?B?dXprRldmdC9OWGh3NGpqcStWaXdEYjNEQzNGZ2xOZ1VNeU55bTZnK2hVU1E1?=
 =?utf-8?B?ek1zSGZpNmkveU5RRGVDV3Y2WmFacVdFTUQ3a1BvVXltUit1VFVpQTJkcTZ4?=
 =?utf-8?B?aFBOVEpPcjJDNG1sNHJCM2VBSkFrL1JxSXZXQnlFRElISmRXdEZyZUNpT3lS?=
 =?utf-8?B?Y0hZWXpXOVNhd1NkdHp0MFhnU3dJQm9rdzhyZURxUnduYVkyRm9ndmN2SG0y?=
 =?utf-8?B?Zzgzck84aE1sdml5VWs0aEZvdElnVEtnRUU4TDNFZ29nczc1OFBsbkJ1UFIr?=
 =?utf-8?B?NVJMUTNFcHBqbDFPWXBjVUZRYUQ4d3Y4T1ZXTTVndlh1SWRkblE4d2t1SlBU?=
 =?utf-8?B?MmllTzFGVUV0U0wvalhFdXNrZmM1Y0E3YURURGFuWWUzNmlMM21zbXVJY05v?=
 =?utf-8?B?RkNibEZSb3JlTkhFRHZWVjhCRExwSG1FY3Z5OS8vSElVeitSRU9lbEhjRE53?=
 =?utf-8?B?aEhBTFFDcnpuVmRoejVTSnUzamd5YlhUTUxESG8yOXJycTl6UnpjNDk0MTlC?=
 =?utf-8?B?UVIyOXVDbVdhRFAxSXYwbFZsYmpnZGRkR0dMcmExTW9QOERQa29kcXMxYVI2?=
 =?utf-8?B?cU1ORVdBY3lDQUJGY0pXMjQzVWJpYkhhdUhTd3B0Rzd5UTZiaGczS0I4ZDJB?=
 =?utf-8?B?NkJSK2l6WEFYREZOa2NDVFA1Y01PSitzQzhFVkdWNHFqUnlwOC9DUWFnMnhn?=
 =?utf-8?B?MkhlRThUMWVkUmprR1c4RDQ0dlpBbXJFdC96MUMvVWF3N3ZTR3ZKeThGWnZv?=
 =?utf-8?B?WVBXbHd4L3VpTlZHd3h6NnN1VXBMTnhyN0o5bVFPR1ppUHdONFgvQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE17A259CDED4B41AD383CB3DAA6A854@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e98d8f03-7598-480e-7077-08da2212115f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 14:37:02.1163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Obd1PsJJfhxfZ4boekNMue0MXT77DMRuLIWaGqrvlaHvEvU+DDWUdvOCCHlmv2oSYfzbqG+HtqAu1U1Gr/tofurZ0JsoAZbTWZtYWOk+wM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5153

T24gMTkvMDQvMjAyMiAxNDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gQSBoeXBlcnZpc29y
IGJ1aWx0IHdpdGhvdXQgQ09ORklHX0dEQlNYIHdpbGwgY3Jhc2ggaW4gY2FzZSB0aGUNCj4gWEVO
X0RPTUNUTF9nZGJzeF9ndWVzdG1lbWlvIGRvbWN0bCBpcyBiZWluZyBjYWxsZWQsIGFzIHRoZSBj
YWxsIHdpbGwNCj4gZW5kIHVwIGluIGlvbW11X2RvX2RvbWN0bCgpIHdpdGggZCA9PSBOVUxMOg0K
Pg0KPiAoWEVOKSBDUFU6ICAgIDYNCj4gKFhFTikgUklQOiAgICBlMDA4Ols8ZmZmZjgyZDA0MDI2
OTk4ND5dIGlvbW11X2RvX2RvbWN0bCsweDQvMHgzMA0KPiAoWEVOKSBSRkxBR1M6IDAwMDAwMDAw
MDAwMTAyMDIgICBDT05URVhUOiBoeXBlcnZpc29yIChkMHYwKQ0KPiAoWEVOKSByYXg6IDAwMDAw
MDAwMDAwMDAzZTggICByYng6IGZmZmY4MzA4NTYyNzdlZjggICByY3g6IGZmZmY4MzA4NTYyNzdm
ZmYNCj4gLi4uDQo+IChYRU4pIFhlbiBjYWxsIHRyYWNlOg0KPiAoWEVOKSAgICBbPGZmZmY4MmQw
NDAyNjk5ODQ+XSBSIGlvbW11X2RvX2RvbWN0bCsweDQvMHgzMA0KPiAoWEVOKSAgICBbPGZmZmY4
MmQwNDAzNWNkNWY+XSBTIGFyY2hfZG9fZG9tY3RsKzB4N2YvMHgyMzMwDQo+IChYRU4pICAgIFs8
ZmZmZjgyZDA0MDIzOWU0Nj5dIFMgZG9fZG9tY3RsKzB4ZTU2LzB4MTkzMA0KPiAoWEVOKSAgICBb
PGZmZmY4MmQwNDAyMzhmZjA+XSBTIGRvX2RvbWN0bCswLzB4MTkzMA0KPiAoWEVOKSAgICBbPGZm
ZmY4MmQwNDAyZjhjNTk+XSBTIHB2X2h5cGVyY2FsbCsweDk5LzB4MTEwDQo+IChYRU4pICAgIFs8
ZmZmZjgyZDA0MDJmNTE2MT5dIFMgYXJjaC94ODYvcHYvZG9tYWluLmMjX3RvZ2dsZV9ndWVzdF9w
dCsweDExLzB4OTANCj4gKFhFTikgICAgWzxmZmZmODJkMDQwMzY2Mjg4Pl0gUyBsc3Rhcl9lbnRl
cisweDEyOC8weDEzMA0KPiAoWEVOKQ0KPiAoWEVOKSBQYWdldGFibGUgd2FsayBmcm9tIDAwMDAw
MDAwMDAwMDAxNDQ6DQo+IChYRU4pICBMNFsweDAwMF0gPSAwMDAwMDAwMDAwMDAwMDAwIGZmZmZm
ZmZmZmZmZmZmZmYNCj4gKFhFTikNCj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKg0KPiAoWEVOKSBQYW5pYyBvbiBDUFUgNjoNCj4gKFhFTikgRkFUQUwgUEFH
RSBGQVVMVA0KPiAoWEVOKSBbZXJyb3JfY29kZT0wMDAwXQ0KPiAoWEVOKSBGYXVsdGluZyBsaW5l
YXIgYWRkcmVzczogMDAwMDAwMDAwMDAwMDE0NA0KPg0KPiBGaXggdGhpcyBpc3N1ZSBieSBtYWtp
bmcgc3VyZSB0aGUgZG9tYWluIHBvaW50ZXIgaGFzIGEgc2FuZSB2YWx1ZS4NCj4NCj4gUmVwb3J0
ZWQtYnk6IENoZXllbm5lIFdpbGxzIDxjaGV5ZW5uZS53aWxsc0BnbWFpbC5jb20+DQo+IEZpeGVz
OiBlNzI2YTgyY2EwZGMgKCJ4ZW46IG1ha2UgZ2Ric3ggc3VwcG9ydCBjb25maWd1cmFibGUiKQ0K
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNClRoYW5r
cywgYnV0IEkgd2FzIGhvcGluZyBmb3IgYSBiaXQgb2YgZGlzY3Vzc2lvbiBvbiB0aGUgdXNlIG9m
IERPTUlEX0lETEUuDQoNCkl0IHVzZWQgdG8gYmUgcGVybWl0dGVkIHRvIHBhc3MgRE9NSURfSURM
RSB0byBkYmdfcndfbWVtKCkgdG8gYWNjZXNzIFhlbg0KbWVtb3J5LCB3aGljaCBpcyB3aHkgdGhl
IFhFTl9ET01DVExfZ2Ric3hfZ3Vlc3RtZW1pbyBzcGVjaWFsIGNhc2UgZXhpc3RlZC4NCg0KSXQg
dHVybnMgb3V0IHRoYXQgaXQgd2FzIGFsc28gZTcyNmE4MmNhMGRjIHdoaWNoIGRyb3BwZWQgdGhl
IGFiaWxpdHkgdG8NCnVzZSBET01JRF9JRExFLCBtZWFuaW5nIHRoYXQgdGhpcyBmaXggaXMgYSBt
aXNzaW5nIGh1bmsgZnJvbSB0aGUNCm9yaWdpbmFsIGNoYW5nZSB0b28uDQoNClRoaXMgaXMgcmVs
ZXZhbnQgYmFja3BvcnQgaW5mb3JtYXRpb24sIGFuZCB3b3VsZCBoYXZlIGNyZWF0ZWQNCmNvbXBs
ZXhpdGllcyBpZiB0aGV5IGhhZG4ndCBiZWVuIHRoZSBzYW1lIGNoYW5nZXNldC4NCg0KU28sIG5v
dyBhYm91dDoNCg0KIkl0IHVzZWQgdG8gYmUgcGVybWl0dGVkIHRvIHBhc3MgRE9NSURfSURMRSB0
byBkYmdfcndfbWVtKCksIHdoaWNoIGlzDQp3aHkgdGhlIHNwZWNpYWwgY2FzZSBleGNsdWRpbmcg
ZG9taWQgY2hlY2tzIGV4aXN0cy7CoCBOb3cgdGhhdCBpdCBpcyBvbmx5DQpwZXJtaXR0ZWQgdG8g
cGFzcyBwcm9wZXIgZG9taWRzLCByZW1vdmUgdGhlIHNwZWNpYWwgY2FzZSwgdGh1cyBtYWtpbmcN
CidkJyBhbHdheXMgdmFsaWQuIg0KDQo/DQoNCkNhbiBiZSBmaXhlZCBvbiBjb21taXQsIHNvIFJl
dmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyDQo8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gZm9y
IGV2ZXJ5dGhpbmcgZWxzZS4NCg0KfkFuZHJldw0K

