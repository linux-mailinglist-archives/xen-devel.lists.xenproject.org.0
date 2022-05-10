Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E71521BEF
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 16:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325716.548406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQk8-0003pm-WD; Tue, 10 May 2022 14:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325716.548406; Tue, 10 May 2022 14:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQk8-0003nB-T6; Tue, 10 May 2022 14:21:40 +0000
Received: by outflank-mailman (input) for mailman id 325716;
 Tue, 10 May 2022 14:21:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2lKQ=VS=citrix.com=prvs=12295f6c1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1noQk7-0003mR-BO
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 14:21:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fcfa91e-d06c-11ec-a406-831a346695d4;
 Tue, 10 May 2022 16:21:37 +0200 (CEST)
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 May 2022 10:21:34 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN7PR03MB3890.namprd03.prod.outlook.com (2603:10b6:408:21::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Tue, 10 May
 2022 14:21:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 14:21:31 +0000
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
X-Inumbo-ID: 7fcfa91e-d06c-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652192497;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dcQ9oHjMEvTxEoarpbDOixReM0JF1JKmsGKP20YXIvE=;
  b=Ev2tI1B9GK/a6p92EjNE+0OrUOtgtN323yLT8Na0OL1xv5wiDqBRbf1A
   uEHlnuhZ0hYzTImdXAM6YOFsRWL9rfwKiiIBrNMkpdXvx1gcJ/wxRIaMw
   BLEFRivO/8FkMXY0ZoN7Y7ZNOblquNeTtO9FY0Qx8fxXzNaib+2PDiaE/
   U=;
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 70371536
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Pt3+KKnd68em36t69mmXlnzo5gyaJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXD2uGM66PYTDzfYt1PIuxo00OvpaDyNAyGlZu/C1gECMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWlvV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYWVYOHYv3l+khQjJWFDNaOo5o+rbXPi3q2SCT5xWun3rE5dxLVRlzGLJCv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXuJkBhGpYasNmRJ4yY
 +IwbzZ1YQuGSBpIIloNU7o1nfuyh2m5eDpdwL6QjfVvuDeKkVcvuFTrGOb7K+KVfphapUCnv
 2Lq+EvHMh8na9PKnFJp9Vrp3IcjhxjTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 2QW8Cczqak59GSwU8LwGRa/pRasvAMYWtdWO/037keK0KW8yx2CGmEOQzpFadonnMw7Xzon0
 hmOhdyBLSNrmK2YTzSa7Lj8kN+pES0cLGtHYDBeSwIAuoHnuNtq1k+JSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNTNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:MscN/K2yLwhL2v11LF8ppgqjBetxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hcAV7QZnidhILOFvAs0WKC+UysJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQjuVvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEw9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyTpAJb4RGYFqjgpF5N1H22xa1+
 UkZC1Qefib3kmhO11dZyGdgjUIngxes0MKgmXo/EcL6faJOA7STfAxxL6xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMMjgZJq3PoiFXluYd499ePBmfIaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATxRlCvgEl7d1amm1F+IM2SpFC6e
 iBOqN0lKtWRstTaa5mHu8OTca+F2SISxPRN2CZJ0jhCcg8Sjnwgo+y5K9w6PCheZQOwpd3kJ
 PdUElAvWp3YE7qAd3m5uw9zvkMehTIYd3A8LAv23EigMyMeFPCC1zxdHk+1829vv4YHsrXH/
 6uJZM+OY6XEVfT
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208";a="70371536"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGUkbEwpq5dbU2s1zekJAFpwDt5x8gtuxlqSShC9LFE41iRAOwIycTv8iwtmcnSyoR6GMG5b/jANIju6oYBvcHy/KZ6bq7vZTWJ2FWoZQJf3cGRKgENMkuzMx/Jg0EQH8xM1h2R7lSrdP91DT6Ee0B86EqY1khpY13Gif+Fcx4MjSKhhlF5QV2k25rsViA843zCKLUMa0O+71d83dghwvBgiS0H1X+8DZ8mru4mFBH8X6ZKiGEFNq/nY7tbt2MFjD9rpuhusc2mWvBACh/HjkMnBEAtDMDrdXXDLqwC2/SzaN2yMy3khsN5mCfvFHpaf7lIqCLa3U+CktbQM4ti2JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcQ9oHjMEvTxEoarpbDOixReM0JF1JKmsGKP20YXIvE=;
 b=AghOEDIRN6KOrdIRue05WqKnQwq8+Wi8/PvjNZiHrKbTxMMsjXUCcNu5mg2a9TLT2I8U3MyUJCiBOHluCmB4crJ3GSC9mGtyXHyibeDoL2aSe+OYyQb88IT+dWCAJ/vrOw/3H5F8pfQl3yff8ZZlWw4V2Gc+u2b3AQ0VW7w8S9i35C+1RHzu51j92Rg0nzMaralUqeMqQhQ9wlC9IAIC6SK4CznxULUHZiSpaF3xblWbt4PMDHadvveekyu6iE1vvy0et+9I+A/5t5X0SD1MTukbHd8kEZJ5gjbCaxwdnV2liC//vfJVk6nNY6M5qtmbWXXmirM6ixwbgr8Ha1gEow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcQ9oHjMEvTxEoarpbDOixReM0JF1JKmsGKP20YXIvE=;
 b=nAPdAzFhUOFBeX6y/y9jU/ZwzDsMXIGFwPnFVuGncLejczv06yHsEBSRz/Dqx4JDi7Ro4SdrFyT6V4sPEBoBvpQOZmn++UOG6C5GEz6nSGJ5r8SdZD5i0FmUh0XvPnsbYfKZwtprEfDO0JwpXUIjfzpDi7m0+SMosANIb2BWpaY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] docs: fix path to code in migration doc
Thread-Topic: [XEN PATCH] docs: fix path to code in migration doc
Thread-Index: AQHYZHcRr9TbxpP3i0SxnIwSV1knLK0YKY0A
Date: Tue, 10 May 2022 14:21:31 +0000
Message-ID: <8c92b56a-bd7b-b91a-5a18-1865ab5b5e98@citrix.com>
References: <20220510140506.64930-1-anthony.perard@citrix.com>
In-Reply-To: <20220510140506.64930-1-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0999524-235f-4b18-b022-08da32906123
x-ms-traffictypediagnostic: BN7PR03MB3890:EE_
x-microsoft-antispam-prvs:
 <BN7PR03MB38908D80CFA45971E7C74F42BAC99@BN7PR03MB3890.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vt1KfUbI/wBXhEKH3R2XB+7e+UwlFt+CbU2BSGYfrneLi0ASYdmEVEfdSzGpDHZLP+Daq1h8/vp/NDjWZOVE/aE6cV2sUSzgKncmn01/HiOyhdDHEYcyKkfpZFubUOAtAGKc98+pt4oWA1jNQWoIDm+bb1DdEvuYhRrgcQkNi7fmK9z5rAH66Ho+hY9Ujg0C8gfzpiCo1V4iTgofoxuaeCyeviOeDk1/B6Ivp5bRjjpfts0KWFfhGPl8dd3piPg0xl+6C44auVMpXgff0RIgyeO1cdlH7Y3tgLOwyqW0GjZhfcOlqan1rDyu72i/pN8xkt5HfHAdi1I+O3iBMDEzxG3igzHtHh6uczTwUH/1pUlBj7yetCXH89lnu9ZWmGyGyZNzO9Mvu+TidkJ8wJZR3Znb8EeRknTdIQbBII/b+uEmSWJKJBtA7T/gpGwBsx+J3VAB6j/dw20Bebv6Qr0QJW2CuDil3iJR4X4aHyCGGBUGKq5ppZ+z6Qst3WoYqdWUKGjOn3ClCe4X/5UjxYZwuR4IXa+ZoaOvlHFo6lWOJ1Ipm3zNIMGICGFEII03rs9rcFdfMdgu1yqQarDyhXJF1+ftzD1YCaCE6vTqPlggiKezgfnHS7FEu62siSpyx7CJpx72alZJYHHfj959J98hYR47gnHgSwjbyhsSx/C7a0HctLs6GyAgJ+mmCj3amf+8vrOKpgteKrQd84htlqZGqMe3vwINE8jITzCRrgihumemfXTE4tbgyxtYq0Y5jGnqmZxFwrUFYjXY4Q20H2r4rw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(31686004)(2906002)(508600001)(6486002)(6512007)(82960400001)(26005)(31696002)(5660300002)(558084003)(36756003)(53546011)(86362001)(8936002)(2616005)(6506007)(71200400001)(186003)(91956017)(8676002)(4326008)(54906003)(38070700005)(38100700002)(110136005)(66946007)(76116006)(64756008)(66476007)(66446008)(66556008)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UlVjdS82L0ZDU0U0NU1jeUZ0R1lMSlljNzhBcnhpaVlNZTNydm9GR3dFVTZ1?=
 =?utf-8?B?T2tpaWF0SHhmaG8xS1Uva29LMkM4Y2Q1cERHcFA1ZFdHQWhWYUxkVm03cENL?=
 =?utf-8?B?dTVTenl0cHNZdExLT0E3YlhFS0Iwc0lYNjVMcTJFMmJXOFpEcEFraWk1Y2d6?=
 =?utf-8?B?N1FsbWhMNmljY2t5UjVPUzlNTWNFbGRIdmZieXJtVEx0b09uTW5pSzJXaDNr?=
 =?utf-8?B?M1NzUmFtcGxoZVdlV0tvTS9EUlN6N1Z0RTQvaUwrSHhFVmRZRy9vOU40TzEz?=
 =?utf-8?B?bk91RWx2YjNlVmM2NGpMRElwdXJiSVdtSllzczlLZW9OaVZITVJTd1VqZ1RT?=
 =?utf-8?B?LzgzRHd2YnEwaXBlT0tVRnZKeXM4blJpeHcweGVCc1NXeXNjajRQbkNRRE5s?=
 =?utf-8?B?RTlObThIQXhoNXF5VXd5dklrQUdaRFM4dW50cEh4TnZKaWZmL2ZYcjkzYUQ5?=
 =?utf-8?B?TTl4MmFKcGhMenFUWlNBS3B1c1N2cVNCbVpWZnJrbHVicERsYnZUTDBOOUdi?=
 =?utf-8?B?T3hTaWt0MlEvUEMzSm9xZ2ZYUnJ4b1Mrc2kxOUREb2FnSitvTGhWMS9rN05l?=
 =?utf-8?B?YUlJcXZrdnBmNTBXeG9kQm1NVGlpOFVZN1YrLzRpeWxFWFZoemR2bCtEc3N6?=
 =?utf-8?B?YWdvWXNUUU01ZGRXeG9Dc2FLeFZyUzNuZTlDVTVzTnRqREFSS2VPa25UUGl6?=
 =?utf-8?B?SkxyeEFLbjN1ZnBtQzBSb1UxQTZLTm92YzlLZUJLWUtjR0dMZmUyTFhYc0FG?=
 =?utf-8?B?TlcrdHlRazlmcWdBRkpsckJ1SURsTmJjcUVRTjkvemJTa0hTQmk1eU1RcVp3?=
 =?utf-8?B?eTIxMzhwQy9adnJEU0djWEIxdVhwTWsydjlCd1U5Mi9PN2lBV2VQNnZ5a1Vq?=
 =?utf-8?B?dVByY3lGVWw4S0s5NWdtZ05uUmtjZ1ZiTmg1TkYwTXN5ODNpMi8vU2h0TFlx?=
 =?utf-8?B?MG1sd0RiMTNYenFJQmxHZzNBRDhsZzdtV2pkeXJCNTNzSWFOSVRmTUFpdmZ5?=
 =?utf-8?B?YU82d1Ayb2tUYmxXbFhybjc5bzhxS2NRM2U0aFJQZ3hoUEVqajlpVHAySkps?=
 =?utf-8?B?dG5jUkFJakpFamY1ME0xL3hLUTBsSzdDS3YyWnZxaVViTFJ6TUxTQVJiWlhF?=
 =?utf-8?B?QXNQL0RWaWxlTUdUWWttZ0o3ZWltVzNxRGhoaFQ4QmppczdxSEtnYTlsaGIx?=
 =?utf-8?B?U0VYM3JUVzg0NER4TjBqcWI0QTM3L0FyZzIzbmhXSFQwb0RuamdvbjVLUGE1?=
 =?utf-8?B?WjV0ZTZKdnJ0cGVqQ2tVUnlkbmZiQmE0Tk00cEh6M0krY29KcndVeWt1MkhU?=
 =?utf-8?B?OFkrYkt3d3RpdlhYSmh0U3hHbkpPbHhwK3BLdkZGbXRaWnFwaHF0MTNiTS9H?=
 =?utf-8?B?cXg5WlkzK2puay9EUFh0WUJWNWFwRVF1OUJtQkZMQnYzZlJKWXJSMWMrR2Er?=
 =?utf-8?B?c1E2QXA1ZzBzc0t3clhxVVFNZ0xudkwyRURLK0xJMVMxRDVCOFFoR21Fa3pw?=
 =?utf-8?B?d2lBSDNZejE0YTlRMGg0TDFpYlQzTk1kNk9JSFc2L3RPeHUzelZ4d3V3RHFo?=
 =?utf-8?B?TnQyY0RKdlVwaFl6N1Nvcy9aQis5elBSOXg3WitUS3pxa1ZGTU5nSXB2M0NB?=
 =?utf-8?B?OGtId3cwMVpNNjY4Ly9lazZJSm5iOWt4NDRsRUNhLzRWS2dIWkMrWUhVZzhI?=
 =?utf-8?B?WldUWkVZVWdBczdYMGRxSmd2eW1xVU1vWmNLdFVEWVp3U0tGQXI1ZFR1cG12?=
 =?utf-8?B?dmpqWDhnSXVKaUcyTTd2THBJdjZENW9jSSsyMUtlKzVJZkl1UjNaN2dVRUlK?=
 =?utf-8?B?V2FpZGdUaUovLzhDZ2NsU3d6dGdmZjBlVW5NRkR6cHYzTHpnczdzSHN1WEZK?=
 =?utf-8?B?bDZkcWFSUU5ZakZscEFiM0V5TG5SYVVsVXRWcytidWRaeEhYSC9vZm16SVhy?=
 =?utf-8?B?K3piMmJvTVBYeWlIcWduUUg5bTBPelVXQlc0aVdPV0s1SFdsb3plWDZ4MEZj?=
 =?utf-8?B?cDQ4Z2hiOGNNdUUzV1hWeFRRVTdXdlB3azNCemtHTnZwTDBhamxsbHkwZUp4?=
 =?utf-8?B?UzgyWEU5WTFCMWswalJlMGRzS3JCT01JbzlPUWU5Z0RtTldrdm90a1dJS0JN?=
 =?utf-8?B?TnFvbEtjSEF6REYxZVFjblNkUzFZcXpEYkVoTVltRExlT0Fyc3VWLzZDdnp1?=
 =?utf-8?B?NGJMQ2oyL3M2Nm4rWlFLUmxCOEwrenBsdTI2TEw5NFl4OTc3TndlVnc2L0hu?=
 =?utf-8?B?L1FwNW1FbVhWNlZIck4xMk5iMExhN1RYTVFnMmVyS2JCUEhyUG1aSEFwYjlP?=
 =?utf-8?B?WGFGRGF1VjFlaG1mWXA2bS81RkRJZks2RDNKdkprUlJhNDRQUTZpdytJbDFC?=
 =?utf-8?Q?a2XwyntC72FTOCoo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D32915CADC62F440A3B575E49233C299@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0999524-235f-4b18-b022-08da32906123
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 14:21:31.2286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w19b4FyBlEWQg1c0DkkAiKqXeiIsvDJSAKrOwKHQgwjeIvoXGhE2kP1h3tZ1Jesl/aretJ/HUwPTYZjvzVB6D1tmYj62iF7wb+atHVhG+sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3890

T24gMTAvMDUvMjAyMiAxNTowNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IFNpZ25lZC1vZmYt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KDQpBY2tlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg==

