Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFA6365BE6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 17:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113843.216911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYrzH-0007Xk-Nx; Tue, 20 Apr 2021 15:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113843.216911; Tue, 20 Apr 2021 15:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYrzH-0007XL-Kb; Tue, 20 Apr 2021 15:08:27 +0000
Received: by outflank-mailman (input) for mailman id 113843;
 Tue, 20 Apr 2021 15:08:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYrzH-0007XG-2V
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 15:08:27 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc7dbfcc-58e9-46c9-9959-e382b076f695;
 Tue, 20 Apr 2021 15:08:26 +0000 (UTC)
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
X-Inumbo-ID: cc7dbfcc-58e9-46c9-9959-e382b076f695
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618931305;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=DWmjTWwbevLenDAZ7kHD0mmxdVvzjALlKLnp9ycLDhc=;
  b=PnUg2efAal9i/mVwG5xKbeh3RxT6JXD+hZQKajfETXQRb2mSOq656aLD
   aAuW9M5txBz57e6+IJQXvwdHnaWJanvw7Pby2ej8hQzJRoPV9XwzcG5CG
   ovwj0pYEFDgArxUCAolAQsNeyTHlnQ70fYjrmU+zG7sasCvysb2w+EMpw
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HO5XOFWmIQG29Y4kHw9L7hAYso7iots7tog2MZvF8fgjzVA0yDJFabhvIIHnQxGIiurNOuXrL5
 2KJcKOupkKKQlT6SXAgn4QyX0Y25fshYj8/0/ZffdVLeBkVM0pSfxIzY4HH7crrEzcsIuHN7os
 /p6piFW8mX8BmIxokM4dU5I1dHejlGCRHlv4x0HxDnKR1S/ZojPfwe4qnME8c3bc1eOFXjOaw7
 NXSl9bpWXwL0AtXkrG/Pf8pJnTjvu3f4lO9vKPJ95yGaPr4JmYYIV9LYmGQhZYZhgh5IU7LUPs
 OfU=
X-SBRS: 5.2
X-MesageID: 41996109
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:SkuwXahyExw99v6QIhld/55wj3BQX09w3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+YsFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmuZ
 tIW5NVTOf9BV0St6vHySGzGdo43Z2j+Kenme/Rwx5WPHtXQotn6Bp0DRveN0VwShVPC5ZRLu
 vg2uNsoT28dXMLKvmqH3VtZZmPm/TntrLDJSQHCRku9RWUgVqTg9DHOjWRwxt2aUIo/Z4M6m
 7A+jaJhZmLk/b+8RPE0n+W0pI+oqqb9vJmJOihzvcYMS/tjAHAXvUsZ5SnsCouqO+irHYG+e
 O82isIBMh453PPcmzdm3KEsWiB7B8U53Dv0lOei3f4yPaJPA4SMdZLho5Sb3Limi8dlex8y6
 5C0ia4sJdaHHr77UPAzuXITB1jmw6Ip2Mjm4co/hhieLYZAYUhz7A3zQdwKtMtDSj64IcoHK
 1FF8fH/stbdluccjTwonRv6MbEZAV8Ij62Bmw5/uCF2Tlfm350i2ECwtYEo3sG/JUhD7FZ+u
 X/NLhynr0mdL5WUYtNQMM6BeenAG3ERhzBdEiIJ078Ka0BM3XR77n6/asy/+PvXJAT1pM9lN
 DgXTpjxC4PUnOrLffL8IxA8xjLTmn4dy/q0Nti659wvaC5S6HsNSGFVVAyg8qtq/gSGaTgKr
 SOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+W1/mmLOPFqTa8sjgNNrDLrvkFjgpHknlBG
 EYYTT1LMJcqkSiWnryhgnNS2rgE3aPua5YIez/xaw+2YINPopDvkw+klKi/PyGLjVEr+gxZ0
 txILTul6uhvmmo9WPU72FkUyAtTXp90fHFaTdntAUKO0T7ffIooNOEY11f23OBO1tiVc/MCR
 VeoF524KqzKJSVyUkZepWaG1Pfq0FWiGOBTp8alKHG2NzsfYkgCI06HIZrEx/QKhBzkQF2iW
 tKZQMeXHXDHjf2hajNtu1TOMjvM/1HxCaiO4p9tG/Wv0T0n7BSelIrGxqVFfOxrSlrbTxOnV
 F1+7IYm9O76EmSAFp6pv85Pl1KYHmQG5RcAm2+Fcpps7j2ZQB9SnqLjzSGixc1PnHn7VkWm3
 aJF1zrRdjbRlVaoXxWyaDs7Rd9cXicZVt5bjRgvZR6DnmugAc67cabIq6y2XCWcF0M36UUNy
 zEeyIbJmpVtqaK/Q/QnDaJDnM9wJoyeuTbEbQ4arnWnnegMpeBm61DH/ha+v9eRZnTm/5OVe
 KUYAmOKjzkT+svxgyOv34gfDBut2NMq4Kc5DT1qGyjmHIvC/vbJ1prA7kdPtGH9mDhA/KFyo
 9wg945tfa5W1+BIeKu2OXSdXpOOxnTqWm5Q6UzpZdYsbk7ubFzE5PYOAG4o01vzVE7NoP5hU
 keSKN07PTdIYdpZdUVYD8c8VwzltiDRXFb+DDeE6s7ZxUqgHDaNd/SvOaNprorH0GbpAz/fV
 OY6DZQ+v/ZXy2Fkb4WYphAUlh+eQw58jBl+ujHaojbTAOtfOtH9EChMnC8fKRGIZL1bYk4v1
 J/+ZWQg+STdyDkwwjesjtwP7JW/w+cMLOPKRPJHfQN7sezNluNiLa7+cK/jD/4Tj2gdkQT7L
 c1B3A4f4BEkTktjIo+zyi0ROj2uyse4ipj3Q0=
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="41996109"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1DjIaNQDKu9ok3lglDWjuj/WpFaQZ4W/vQVS3ZZ9bdt2w/WPpv9CSIoNpqTA4lCWDOVciYJkemO01FGYjwG5X6+322drh0Ogx3+zghTeEFW9Q9dWRcIdLb0oAGsREbgxSnmQoCtS/ZAfeJ47MD3zMfEIP7+0Wd+PtfLSA7F6tMXC9QAYNC/1JgTlJGaWe4PabuIdReNFVc3tXOokVra8u9lcOcpZcbsJ+VjRPslclrBzv1eCVNFikmxLGVJd8qAuXHt8lhhkr4hnfuGm7tpZs8EBUJuwD+5U9AGl3HelL4pmJpt/g0hymJS6S+bsBQRfs2nyrTmEmUsyImQT81OKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emQiayagX5yYHoDuRCF7Vu/STi3G6Ui+9OhOy3leMwo=;
 b=YH4GhicczYyHRE/WopTJKP0Q/hIuN9eQ1LQOIPWBfD/TNeeRxZbYLhYLjfFrHo8sdQfodbtcWTaqpGuEnrSFWoqDYmRivNZxXacE81dm/szNXcXQRJwWbjQJkV/j7lUpc9pIMZyvB/klgQgmGjew4q7AJnfQ8AvI2mkdEJZ4B1pHKEYu4eTa4OvcxS35hIQrUrnkkTVir4JajJP2cqj/MNrAn8IPs7Cr/ttYSXTGRTcwuDoFvx9uu4DOAADD7sPpM5wR3XRkd1T9bn3qqZfX1ahESeq8HaNybA8N2TRYCaqkKUbg9GPWgUzGXUe4XL4x6C/ZT0cbebiccHhrdUCMNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emQiayagX5yYHoDuRCF7Vu/STi3G6Ui+9OhOy3leMwo=;
 b=SQYTcI+QefH8oAzeAWPbPfXGwvE3lkIfJGxCDUzOB1iqLHP50pEAnouiyMSyzYJiGpDLqMNBl4yUmfpL1LsESkoQ2fhIKiKrxqeCGX9JTCFdu2gVp8Q5Szdg1ls65Ch1l+lGQnuMqIcQtVJlmr3Hu51apRjOIfRQWcW+xzHocYs=
Date: Tue, 20 Apr 2021 17:08:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v2] VT-d: Don't assume register-based invalidation is
 always supported
Message-ID: <YH7uX7RqqIS4zdBt@Air-de-Roger>
References: <20200401200606.48752-1-chao.gao@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200401200606.48752-1-chao.gao@intel.com>
X-ClientProxiedBy: MRXP264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dbc3927-ab3b-421d-ed3d-08d9040e236c
X-MS-TrafficTypeDiagnostic: DM5PR03MB3370:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB33704C61FF1ECD770CBCAC248F489@DM5PR03MB3370.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cCBnqQ9biZHqiFLgYobHIQAVNK/xth+iqrcwYnlGNX8e2TjOlY0qpm/ohjvGqNHXffgZ9AC9SPq5Noizxw9m+wT+1FfBrR4xbYMmSy/7rZmV6tKGCt7UECvKTr61W1j6QkQpPyHnVviMf/hJ/fkklhAaMzERZ9ppLa3xuLp0Mj2k5WzWaARljT6rPD61ejLf8wt9tdg6/8B/7i0bddR2pd8/CWYwrUnSdf9lmF7P7r2uMFcKsruWmJdzUSgZKpG2ORv/ITgfjjP50d5k9TnSQQDTeu8tjqZXjAvvydKn3SUrJjN/eCc5FHubPkNRtTbUsYU097OwhuWS+LPzMoR/gqVB5i+x6atMe4Ro74lKAniZhhBiwKqh0A2b5iaCf1z/zjqZ9CsQR/IrJVRerIxnFWKyGZpNuD95e9KCM3XKmTff+Kl1ebD+YMFvllyopZC9JuHEF7urXp3aHn3cUXohuGAaHN0rkoFXt2F8UcE3DbAaacTPbyUXrjfnMkScnEqS/63J7lTSx6vZGzCsHmPGH39Eh73D0sgo6JGrxnM/6RU2rP8uOIRsHh1xDxG4AOAbBB4BIx9dzoqmqpiC2kywvielTAdqqIzMrM1/xx62/RI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(6496006)(85182001)(316002)(83380400001)(4326008)(38100700002)(6486002)(26005)(478600001)(66946007)(2906002)(5660300002)(8936002)(4744005)(33716001)(86362001)(956004)(6916009)(8676002)(66476007)(54906003)(186003)(66556008)(16526019)(9686003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R2FFZ3FQbkdrZVUvdk83Ly9QYXFPdWpHZ2xOM0JxREhBRUhnL0RrYW84c0dG?=
 =?utf-8?B?NUZoYUlEcFNkT0xRUFRVUmJvS2NTT3NEWDJuUW9KYlBQZHZFSVlGU0c5OTND?=
 =?utf-8?B?WGVUS0F5ZWg2OGF4VVdjdFVOQSt4MnJVTmRaV3dBcktza0llWmdnYlhKVW91?=
 =?utf-8?B?Q25sZ3puQ3dLWk1kbUpsUWw4RWNpd01tZGJiNUpha29xZzRzNnpTamdBZm5k?=
 =?utf-8?B?RXZjR3l1czM4VzhtOVpGdFNMYjhiYUhXdFJOTVZ5OWJwTlM3Z3M0WW5SS3BT?=
 =?utf-8?B?Y3IvdXJmdGxWQkJOcGdBbm9UUXk1Y2VMS0d3dEtHblRKQlFPbkV5cWZFZy85?=
 =?utf-8?B?ek9JQnh0Ulp5ZzExUk5PZFhxSXV0Qk9NeWJsVzlKNllrL2hsUHNRdnlMZUxy?=
 =?utf-8?B?NDJkSi9IQWR1SmFJVWIzeDBLUWlzbXB4azhxMGs0K1dnTDB1Wm9DbWZiSEN6?=
 =?utf-8?B?VUhZRmZlUmpCM1duWVBLY3ZUenFGYXRjZ2J2TmErenU1eUZLcWF0MG55bUZl?=
 =?utf-8?B?b0xmVHE5MURYcnlzT09rVURVSEUxTFR2ODkyc3RZSHNXTDI1a2NvOGd5bGJJ?=
 =?utf-8?B?akhmcG1NVUcyVHFFQktsemJ3MU80RzRGVmtON2Nyay9Kek5GSEMxdG9ET3I0?=
 =?utf-8?B?Y1JndHBxeHpjRkZWK2hyRnZOR2Zkc08zOVMzQVg4SkZyTWVyQ2R0SkpKbXdj?=
 =?utf-8?B?ajBWK001VTgyRCt0WFhPakd0NmJGbTZiYmpTeVpuQjJsaXg3cFZPSWJQdmIy?=
 =?utf-8?B?QVcvcHlrR0txZnRPcXBUYzZ3QUpDNlpzL0pOWkN6aGc5TEJFVWVVd2hob2VL?=
 =?utf-8?B?WUpVR3RmTkRQZ3plVENNZ05EOUNSNVdTSE1MdTlVa2NxRGdZOG5adUF0amF0?=
 =?utf-8?B?WklxdnhaMk4zSUVFU0w1cjNLYWs5NnRLK3N5NmZQaFo0c01iUnc0clhydENX?=
 =?utf-8?B?WmhZQkIwZFVVQjhEV05tZHVlSk5STmNNZ2lQb0ttUjNNeWplZmNMd3lCNGhR?=
 =?utf-8?B?d3VBckJYUmpSK0hJcDR1cVc3ZGFUUjlra2RXdmZndVJOZkYrc3FxZmFEMzIy?=
 =?utf-8?B?MUdoVnZMM1ZYbUU0WUNEZG9pb3VCU0xvRWFUdit1bmZPdC9zWEYzK1hCc2Jy?=
 =?utf-8?B?UitYUG5tV0R6d3ZGcWR1eHAxakduZU5JQkdqb05GTlJTck1HNjZYS1RLZHdv?=
 =?utf-8?B?ejQvblpQb3BVdTREdEtKZ2JFVkliMzE5WGJNckYwZks2QVlzNVQxUm9vYU93?=
 =?utf-8?B?eUtSYy9OMTJ0NnhuZC9kZDEwSTgrQTA3UEh1MG1ZY1kzaVhaeHdtK0pJU29K?=
 =?utf-8?B?MndyeUxYcVltM2RVV1VNUXRvSnZ3TXRPS3FwajNlVGlGd3BHd2lIVVJuWW5T?=
 =?utf-8?B?WDFmeUhxaEl5bkRDb0FtNjRqQ3hPQVVaenJ3ZUhCYWZXWnU2dFYwWFowR0tH?=
 =?utf-8?B?eWR4dVgyMzZvSjRNTUd6bnVpc1oyUXNkUmF1MjN3WWttNVZnYVhiSWhFTXFF?=
 =?utf-8?B?VHROZjRnMk9LKzJkZEl5RkhwQ3V3T0FnRGMySlJJQldaWEZDR2hLd0ltTnBv?=
 =?utf-8?B?VG5HRGYwVzNzL1p2VTY3K0JnQnNZS3FXSllsSHhaeldmQlgvOEU4czB5Zkd0?=
 =?utf-8?B?VG52dmdIdGRTSndLaTEyQmNidlhHZVRtWFRORkJVNG5jOWNWbkVBOXVtcnox?=
 =?utf-8?B?Uk9XR2RXb21FVk9ycFZ5WTJkVEtxMHJTNzUxZTVsR21tR0JhK3pHc3N6VWNQ?=
 =?utf-8?Q?JYSth4hMKJgFiMN8UFwEntOgH4d0w2oWmMyJQV6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dbc3927-ab3b-421d-ed3d-08d9040e236c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 15:08:22.1921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wp2ZyiRBpiMaSIoa3RITnKg+sJhP/VtkjeD3nPqRKD4+sXMkwf5yTZo+rMtPewPQ5H+NSCteYlZREiiBALh6vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3370
X-OriginatorOrg: citrix.com

On Thu, Apr 02, 2020 at 04:06:06AM +0800, Chao Gao wrote:
> --- a/xen/drivers/passthrough/vtd/qinval.c
> +++ b/xen/drivers/passthrough/vtd/qinval.c
> @@ -442,6 +442,23 @@ int enable_qinval(struct vtd_iommu *iommu)
>      return 0;
>  }
>  
> +static int vtd_flush_context_noop(struct vtd_iommu *iommu, uint16_t did,
> +                                  uint16_t source_id, uint8_t function_mask,
> +                                  uint64_t type, bool flush_non_present_entry)
> +{
> +    dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: Cannot flush CONTEXT.\n");
> +    return -EIO;
> +}
> +
> +static int vtd_flush_iotlb_noop(struct vtd_iommu *iommu, uint16_t did,
> +                                uint64_t addr, unsigned int size_order,
> +                                uint64_t type, bool flush_non_present_entry,
> +                                bool flush_dev_iotlb)
> +{
> +    dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: Cannot flush IOTLB.\n");
> +    return -EIO;
> +}

I think I would add an ASSERT_UNREACHABLE() to both noop handlers
above, as I would expect trying to use them without the proper mode
being configured would point to an error elsewhere?

Thanks, Roger.

