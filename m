Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422D84811AB
	for <lists+xen-devel@lfdr.de>; Wed, 29 Dec 2021 11:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252335.433348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2WBj-0005Kh-Oj; Wed, 29 Dec 2021 10:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252335.433348; Wed, 29 Dec 2021 10:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2WBj-0005IH-Kz; Wed, 29 Dec 2021 10:28:07 +0000
Received: by outflank-mailman (input) for mailman id 252335;
 Wed, 29 Dec 2021 10:28:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukf9=RO=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n2WBh-0005IB-Oa
 for xen-devel@lists.xenproject.org; Wed, 29 Dec 2021 10:28:06 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffe34fda-6891-11ec-bb0b-79c175774b5d;
 Wed, 29 Dec 2021 11:28:03 +0100 (CET)
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
X-Inumbo-ID: ffe34fda-6891-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640773683;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Eo9y1X/YY0BcVoJeuljiLhgdK0/kMwATBI8p7O6qwQw=;
  b=a9ymcU961SDBTRd682Zd/vFxs1EqlEet2VwM/9qhfn4QSFRiz+XZs/k4
   ZRymuTeki8lxA7ZPXIpzyB8K72ib76u+QPpkHW+WHkDAeD29OBqRbferi
   7yaU+la5SkSMX9bfo98/ukea+Hewh6RhB4tuRtD2j4SYm1CU1MUHQpRXY
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qmX8Rmd7GvKeMyiLgHd2IEGG983qIiBoIJ9Ltd6TO0FmSlj2jfpvpCCe8jw2ns6CUoIDAv10Ap
 UbU86Jv0yHbYQdh2pZyWmxJ9RLIhfcnICPl8ftId8kvxzLwgn9CZePrKejwJ8AwUU5voLwGYAp
 nHuWa6Fs5lV1Pc4io+Qp7Zb5M1d9MHLRvlqHwshGOFtsxi+Qtgqas2+UROEWE+KeRf4y6LkYzo
 D5UeSks2luItnlTSKLPVZVo5UMBWbPf5X992S1KffMGjPGgX/UdXb5Xq9XQZzBG8Qsqah0Wfxh
 WKhZKgdLJIvOloq6e24RLFxG
X-SBRS: 5.1
X-MesageID: 61346873
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VhSdt6p/cT3oZ4xMLwe9ITRYwPBeBmLGYhIvgKrLsJaIsI4StFCzt
 garIBnUa/2PYDD0LY12YYni8EMGsJKEy9ZgSwQ9qCkzQSwSoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2Ncx24LoW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncOhQyQoP5KVo8peDBVYHXp7BYxPw5aSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4XRqqAN
 5VCAdZpRCvSOg99N3ozM8gRhcDy237nTS0EtHvA8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9Qv1WZgfEbCk+/lwqECIy3YITgYRSEGwrPe+kEGzHdRSN
 yQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4TPwwywCM9fPvzUXGCmgKFTt5SdUdnZpjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoCtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D5gbQ4xawZRGp8crVnl
 CJb8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeB82a5hVImCyO
 BO7VeZtCHl7ZiTCgUhfOdzZNijX5fK4SYSNug78MLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWPnOKrNVNdA9SdhDWx/ne8qRqSwJKGSI/cEkJAP7N27IxPYtjmqVejODT+
 X+hHERfzTLCabfvcG1ms1hvN+HiW4hRt3U+MXB+NFqkwSF7M42u8L0eZ908erx+rL5vyvt9T
 v8kfcScA6sQFmSbqmpFNZSt/pZ/cBmLhB6VO3b3ajYIYJM9FRfC/cXpf1Wz+XBWXDa3r8Y3v
 5apyhjfHcgYXw1nAcuPMKCvwlq9sGIzguV3W0eUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ9t77HfF/E0xWG3jgwYy3bSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXjGMwarB7dnLiXU1MVDrPQQlLpQuA/wU
 UOT4NhKf76OPZq9QlIWIQMkaMWF1O0VxWaOvahkfh2i6X8l5qeDXGVTIwKI2X5UI7ZCOY84x
 fss5ZwN4Aulhxt2atuLg0i4LYhXwqDsh0n/iqwnPQ==
IronPort-HdrOrdr: A9a23:Z/6B6a8JQ07z/0OKY0huk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.88,245,1635220800"; 
   d="scan'208";a="61346873"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkuRlT3Oe7G3BBKu3hZUZG61W8C3JCTW7cLh1GPAbmy6sHnsRz25l99gOQe9Q13JO5XdS1kJ+XjK8C2znku4Ngd+jsAGw+0VQuGBLfXT45iGpFjgaQJKADyX7a0oDrWS1P6nT4X/PItPjhvT8RFftC0nms4suj0r1/aa0cR7Fm//RsgZPLKFgyjw4TZKL+ytAUSnJYUHoEN2MlNZ2u5hAnA7rFMGghCfOHOQ3wzAG89TsetgA9anFPGUHwM0FEeC+JH+XgnXtqw6UJpTUBi3ZOuKJywOiZnvMwEYJyCxgT891GC7nyRNXVT5fmbIx0U4ubkkSBGb1SXO6J/7Sgy1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eo9y1X/YY0BcVoJeuljiLhgdK0/kMwATBI8p7O6qwQw=;
 b=WtGjk6CIq0V8kVyj2IfpPjoAuHy0XpFKXyz0HkYqOT349GYXKxxenutKBKBEIPlmuxd+n65yMrGYYo1WO5UD9uxik3qxRbmmGXAPRQJf59cHBdd6TTyQW7VHDfi+2tpvNj52CGm8AzXc2ZLaSXIyIAP+6R5phrXC4Phl73mkmAbGT4ZOAN8ROh2aRr3JpNA3Qq/UiryeGkdVQPzNu2cvgRbazoE3Qmqeo8UR7rF0zp1YDjy/BayHHCNknfKpqK35VlC83na7Z4ArGU1wIX+v0QNPvdbErmjp+LU6B1pvVjYvlAjlWxpt98XQxVs2tsGzwh5MsFv1678RRvzu1o89Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eo9y1X/YY0BcVoJeuljiLhgdK0/kMwATBI8p7O6qwQw=;
 b=TJIEEGNgqEpY2bWKxQPQIS+SDIcYU2qw6Iufj6S4I5lndFIqqMYJEs90eJpFoZslsmu6t5Gjf6FVyx9FLW/bhX04H2q62zpRWi6HKRiZquk05optH6YkjlN3Gm3FGvdM1noQCIkfhgEv7LzRjHlVlpTGN1yfUsRJXqEToAz4SuM=
Date: Wed, 29 Dec 2021 11:27:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: G.R. <firemeteor@users.sourceforge.net>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
Message-ID: <Ycw4Jna5J2iQJyeM@Air-de-Roger>
References: <CAKhsbWZkSoM-N=HXfb_OeSGLqYMdtcxRph+=_vqp6tjHgikYVQ@mail.gmail.com>
 <YcInKtCNgA9v0k+c@Air-de-Roger>
 <CAKhsbWZMRMfrsWDcZLSS7q4ciR0UbyGE2sO-tN1dr+9juuEfsQ@mail.gmail.com>
 <YcWuCgYWestnlDSH@Air-de-Roger>
 <CAKhsbWZ4Xyy_7Xp4F3YWNsrBXdh4AkiQx4__7qUTd4AJiu-6bg@mail.gmail.com>
 <CAKhsbWarxwi_n3NAr81op_apyN69itUrv7f1k1ZJ6=gXuFXtGA@mail.gmail.com>
 <YcoOUw/u3SqTxWKm@Air-de-Roger>
 <CAKhsbWY5=vENgwgq3NV44KSZQgpOPY=33CMSZo=jweAcRDjBwg@mail.gmail.com>
 <YcwdJn/Y0yncuJ/e@Air-de-Roger>
 <CAKhsbWaKvMtN0v57kRuwSGnTECb8JnabhgXeO1VTyLiJa4yngg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKhsbWaKvMtN0v57kRuwSGnTECb8JnabhgXeO1VTyLiJa4yngg@mail.gmail.com>
X-ClientProxiedBy: MR1P264CA0135.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 815aa27f-fe76-4017-75f3-08d9cab5e17a
X-MS-TrafficTypeDiagnostic: DM6PR03MB4218:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB421806D7E31720900AC2CEAA8F449@DM6PR03MB4218.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /fYxNcHJfKKRqYx0pRZOjXx7OkjLuqIg+cq1Xoe3FYmTotliZnoBYtUEpObN88hddcwr/Avf1K8krA7+7URHg2g2HaBnI8MziTc8EKf0Xb8uwabaJxLYQwCTclV50dpXmsYRvLo2sAy1RUHX6F/dEmnUBY0jtoRrdLCnAniRtQxLZcw1LBB9UDOCGQBiI7wU+3OjcrEe40eZcVdo7UA+vxskkPuNodknJp5DFO4i4JCee+aIlLKTBWetmF8Drb/obPUgn9CvwoQwVzuLXqcwAE8uGBeSWiSH3czquNVPiYKPt+KsuKdLw33rIcM9u3+vY81rgkX1es/CbF2lyOcGEmoX/H1a+cAfX1qQ7cWg55BzlMOz1S4xYidEQT4LbH5FztsNk1IQ60J1PFd/kTuw9lR09jDXK8pNA4j8bJVoZb3m9ERQxnVFSlfTMnrEohWv138krDPKcmYl8N3as9YYuBmpSkXNRuh28EC1LBdUhDc1Z4wUBXz9ZPzPD/oNPCid3Gqz9cNkrMo10VxaF8Zyqk7NsI5PbGolMiNZxp7FnZE7FencKyBCwiBcJVC6XF4ypz20pQYqGfHuCDh4JfW+tPHKgRVPp0Y7w/uO/E82S0mrs72hohPZ2k/rn4MqLpCpzkRiw4R1xAEmCQxARmg1uA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6916009)(6512007)(6666004)(9686003)(2906002)(66476007)(82960400001)(38100700002)(83380400001)(86362001)(316002)(5660300002)(85182001)(6486002)(4744005)(4326008)(508600001)(26005)(186003)(8676002)(33716001)(6506007)(8936002)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlZkcjBmM2Q4RWc0OFdnQzk4SzVISkVjYjJDTlhjamluU25NK2RBaE5YcUJQ?=
 =?utf-8?B?a3pPK1p2S1N4MllaZmVpZ1JQQVI1SGl6SzFwVjhzY1krV1QzWkQvSUNmQ2c2?=
 =?utf-8?B?R01FWnA3UFVMSDV3LzVRRklaNkpaNFJUckZ5QU5LdUVmNnV1NHl3aDFnVEQw?=
 =?utf-8?B?VzdHUys1bUp5NlpGblRrMEd2NFc0MUsrU2QrWVRnMzNvSXphTVJtOE1lN2s2?=
 =?utf-8?B?OTF6UFZkY0RYM0hGY0grZmFNbzNqSlRpVkNZT0RRWUhBcVVxbTdjdXRSRldn?=
 =?utf-8?B?ZWhqRXgzd3h3MVpieW10LzVSMWNRY2owcXkxQVhIbGp3cFBVTkZ3VzNTeExr?=
 =?utf-8?B?TVZKZGd2OWRHck9vbVFYekY0RW0rK0Q4RlN3cjA2YlpZUC80UDNyWGpiMDRi?=
 =?utf-8?B?Sk5iYzE0UHZmWkJvM1c4MWEvbEhQeVR5SHdmTXRscHhEWktmQlJjbTJxbWh0?=
 =?utf-8?B?QThFSU1ES3RudHJ5RzRMd08rcWJFbElEdzJWSWxDM3BQLzV4cFczL21JOWdF?=
 =?utf-8?B?cmRxQlZKTndUcFJqTDBqTnpWcThSTlJxTlYxdG1XbTNwaWYzZDd1Y3lMM05p?=
 =?utf-8?B?T0oycFRUTTlEL1l1YXUzZ0FzNUV1U2gybEpsVzVhK1k3NHVOTmtSQlNHVXJa?=
 =?utf-8?B?Z1RhbkxCUUZBU1VXSzBMcUN2Wm1WdnZDc093bm1qenNNRERjMlROZjZsRnhN?=
 =?utf-8?B?bG9vRXA2a0ZYNjY1Tkc2RUN1U1lIOTZNN1d4QTJCb3pXQnptZWZwZDVuWWp2?=
 =?utf-8?B?NU5GQ3NrM3Y5NEllTkFXekYyVjJ0a2lZOWM3dFFuSTVxZTBLUHRhUklmMXZr?=
 =?utf-8?B?ZmVUTCttZlpMZmVjV0hsc0srYXJhdHVsYmFySXNsaWt1UDFLRzAvYmJ4ZUJv?=
 =?utf-8?B?d2d5NWJNYnFkMXBKNmpETFh5ekFwWVVTQm92WjJ1NVZSRElSbTRmdjlsWmYx?=
 =?utf-8?B?RENKakUrYWgybCtRcXRuWWdaaU9ESXMvSVQ5ZE1EOUkxTlQ2R0lkVnN0OUtm?=
 =?utf-8?B?RnduTHJ2YXhac2RIaU1sU1JvZ3hTaUhGVFA3N1RIOVhQalVRTU5vUUVrbFpO?=
 =?utf-8?B?ZU16ZVFjaklQaXRiNkhCYlBXdHJkUTNGc0pQMTd4ZFFQOG5sU3VpbU4xVjJn?=
 =?utf-8?B?ZlYxMTBnOXFuVUZzSis3UFYrc1BXK3lCblgxTUNKYlVES25PTHNpZXoyemhJ?=
 =?utf-8?B?TDZUb3hwUlVKZGFaSTZaVTNYdW9wcVp6amF3WTVTQzRwQjNNWnFmU1FCaUNJ?=
 =?utf-8?B?NXphbFNQK2pza1U5THhpUFduWXBZZ2ptd2ZpUmhFM3d6UUFsMUhndVBra1dY?=
 =?utf-8?B?RVhEaVRSRElmL3JDOGx5RkhBWHZqT0V6YU11YWI3alRkbHdhZUtsdmtETWlG?=
 =?utf-8?B?ZXM0MEdiV1pqU2ZYQ1VGMTY4VGtGWUlkaXVWSXFyRUJScEg0TFdrQTZBTnFW?=
 =?utf-8?B?bWczWk9ZdHI0TUE5YTA3R3h0MC9hTnF0UDRDVU9CY2hCaEd6dEI2elVSTk0y?=
 =?utf-8?B?RVJTRjdkekV1YVhFc2lKZFZxMEx6WFdNZTRielEvblpUZkpleWdZMktUdVNL?=
 =?utf-8?B?RnMxQ1lnQlJSZkg5TDg5bUxGWXl6aXE4cC9kRkxuWi8rRVpPc1cya0JHOVRH?=
 =?utf-8?B?K000b3lVdFBaY0xpNjV2dVZ4Q2FzRmo5WEpVQVhLV1FibzdJM2ZwVjljWVVk?=
 =?utf-8?B?YnA3QUJROGY5YTk3Z21xZGdON1M0RzJxeDdRc2ovTDhtc3FKeUlnWWdDdnM3?=
 =?utf-8?B?anJPMXNiZkJ5WWg0WHhIazN2aFJ6MllrNnd4MDMwYmdxVFVZL3UxZHFGOXkv?=
 =?utf-8?B?OStnM3RLb0lQTXJsS1pRek80cDk2cG81SzVqb0xoaDBvbGxVeGNTZGxobGdO?=
 =?utf-8?B?NnlxVUcyLzcxVXZUK1A1MFEyRytEWWcySUorWGpvRlhIQ1V4OHArL1E0bmhv?=
 =?utf-8?B?MHk2cHJVK2xpbExQSU9odExwaFpjOGxsTmNXSGpSanZ4RXYyVjUwd0Z5cy9k?=
 =?utf-8?B?R285d2RPS0Ftc0FMUFJMZFh4dEpyZVNzWmFZdW5UZGpCcXRYK1RzL3RqNWk4?=
 =?utf-8?B?d3J4L3U3eFg1R2FFdmFGV25PTVJ3d1p4aVVRS1ZmV3dJeW03TlZuWW9lTTJW?=
 =?utf-8?B?Y2RpU0ZHVGtMU1JyMjQraUJSZHlZZVBZOFBWbUhuVDZjcTNndXIwL1lSbUVG?=
 =?utf-8?Q?TrrEoEvvKkkjkx03LhPgUCU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 815aa27f-fe76-4017-75f3-08d9cab5e17a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 10:27:57.3081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNLIx16nCtBugY2Xl3mw0vwwL66tYwUv4JU4DHx48V6s31IxRhlLO+Ej/DSGCBldeKv0lMOi54+J7XJ6C93Hqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4218
X-OriginatorOrg: citrix.com

On Wed, Dec 29, 2021 at 05:13:00PM +0800, G.R. wrote:
> >
> > I think this is hitting a KASSERT, could you paste the text printed as
> > part of the panic (not just he backtrace)?
> >
> > Sorry this is taking a bit of time to solve.
> >
> > Thanks!
> >
> Sorry that I didn't make it clear in the first place.
> It is the same cross boundary assertion.

I see. After looking at the code it seems like sglist will coalesce
contiguous physical ranges without taking page boundaries into
account, which is not suitable for our purpose here. I guess I will
either have to modify sglist, or switch to using bus_dma. The main
problem with using bus_dma is that it will require bigger changes to
netfront I think.

Thanks, Roger.

