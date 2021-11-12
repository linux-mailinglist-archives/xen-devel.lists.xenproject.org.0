Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4C944E667
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 13:32:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225207.388924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlVil-0000I6-S4; Fri, 12 Nov 2021 12:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225207.388924; Fri, 12 Nov 2021 12:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlVil-0000G3-P0; Fri, 12 Nov 2021 12:31:55 +0000
Received: by outflank-mailman (input) for mailman id 225207;
 Fri, 12 Nov 2021 12:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdsq=P7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mlVij-0000FZ-T1
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 12:31:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81feb1b8-43b4-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 13:31:51 +0100 (CET)
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
X-Inumbo-ID: 81feb1b8-43b4-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636720311;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dCZfEqbc2YHyF9wj+IELmqkQ2d+cUtIizCWpTcT0JMk=;
  b=VIb5HZw5m1H8GSUD4Y3C56sr2S8zR9ElxFkoKmw5AwPwBSMZ5pxdaX+h
   FczxAnW/Zc1FE6PAeyLR+DFohEC7yG30gYPDDUmiK5ozdzph0A8/ThKyc
   rmLT+2MUCz3sOlAnSm0057mbtMb1CIxTc7DDRW2qzGGfcQLZBicQLanha
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4Aypb1YW5flZtVGod7rwUzWJdFGtnIGIkQ+ij/ALkaVq0Jf+CUVkglpFTOmAYAuQAN0q9tENne
 8q6CSCOkU9Q8TwJizF3hJb4d6Va2AAMJqCZBUltq68qRamCxys1Okr8yendw/NXsx9VCzb9JUI
 GgHbHOlEBAFGyjvd34oPksTU2+LHL+eM19I+0t1uPH+eOXh8VGdbEghb+7TwYjQaTbGhCH+bNJ
 MRKFGARFhY7YFbCkNsYYzO4sibuNktzHUUh/uRKr2xyPswTo/5YjdLy/12oSB+nt44Hk7A1Ab+
 12EyeAqHO4l7r4ZbG88vqDcW
X-SBRS: 5.1
X-MesageID: 57704368
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZjCb263Ak1VLF8Txh/bD5TJ2kn2cJEfYwER7XKvMYLTBsI5bpzRWy
 2oWWG/XOvyPazT8eIpyO4iy8xkD75XVz9VrTFFrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wrRh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhoctM8
 vJRk8WKQzwiE7OXpMVCUAMDDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIAHhGtr2JAm8fD2W
 +whax1TTCn5ZkNKAgkdUNEHveyRvyyqG9FfgA3M/vdmi4TJ9yRy3absNpzJe9WMbcRTgkuc4
 GnB+gzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4LfYH0iaR7PPu6T2SK3Zfch8ea8Z9q5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoStQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtQezARVodt/xory9U
 J4swZX2AAcmV8HlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkybJhZJ2WyO
 x6O42u9AaO/2lPwMMebhKrrW6wXIVXIT4y5Bpg4kPISCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGLq9NOdg5TciBgbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3TApy6QL+wD5t5s1whOikgYQSh13Q5ON7956YDbZonO7Ig8bU7n/JzS
 vAEfeSGA+hOFWubq2hMM8GlodwwbgmviCKPIzGhPGo1cal/SlGb4dTjZAbuqnUDV3Llqcskr
 rS8/QrHWp5fFR96BcPbZav3nVO8tHQQgsxoWE7MLoUBcUng6tEyeSfwkuU2M4cHLhCanmmW0
 AOfABE5o+jRotBqrImV1P7c94rwSrlwBEtXGWXf/I2aDyiC8zrx25JEXcaJYSvZCDH+9pK9a
 LgH1Pr7KvAGwgpH6tIuD7ZxwKsizNLzvLsGnB98FXDGYln3WLNtJn6KgZtGuqFXn+ILvAK3X
 gSE+8VAOKXPM8TgSQZDKA0gZ+WF9PcVhjiNsqhlfBSkvHd6rOidTEFfHxiQkygMfrJ6PbQsz
 folpMNLuRe0jQAnM4regy1Zn4hWwqfsj0nzWkkmPbLW
IronPort-HdrOrdr: A9a23:qg0Pl64YaJvxe1dngAPXwVuBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdhrNhQYtKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkANDSSNykLsS+Z2njBLz9I+rDum8rE9ISurQYfcegpUdAa0+4QMHfrLqQcfng+OXNWLu
 v62iIRzADQB0j/I/7LSkXsGIP41qr2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwr+G4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTotOwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbsLuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0DkfuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjDkV1FUsZmRt0kIb1O7qhBogL3T79EWpgE586Ig/r1cop9an6hNDaWt5I
 z/Q+xVff91P5YrhJlGdZI8qP2MeyXwqCL3QRCvyGvcZdU60lL22tTKCeYOlayXkKJh9upFpH
 2GaiIBiVIP
X-IronPort-AV: E=Sophos;i="5.87,229,1631592000"; 
   d="scan'208";a="57704368"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0bxrlm/LXTiaO2tkOVaqb4GQJ2V51zruUZ6Nzx3J9Um3/+XjHbVDtMGQR25cCBhjI7GJr2ETNwfFZTPsl1XOWCN9eQuAxCuuiaPrv4mmyKzOT+tqVb0PIIuLS8V/u5TXzd14gI78XpXVkP+qte81j9YnRbltnezyOQLA4SbP00Gtl1EnJb/ZgbMTDC/tvKItA18NLWLcncreveAM3eedkt1jS4Xu/RKYcyolrFcfokTZziutViTXd0SG3G0bZ9uMw9ik5i9b8s43LpmxEWBHqr6Os/vzDPqGMWcR9ErnI4VLxNdcaV1BOYFKRwrnf+4V1Fpt+cEvlPQXYtWosibPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLFsgkR3hTbEhCgYT+0xS4sheliiYxEVcrQz+SXUYTM=;
 b=Iui4nh2ybQ9r8b31LaGqENr5trhrtpQUSXJxr1KmnKS41/pBKrkDxByZLOo4ufa/IWcn5xvcOMEddL1BCw+MvNoQY/lb+yhMOg8qbO+prGLTvuDczBiYN7+ABGn9DjsiypLXyw4l6oraIU69tZlhfCx9u0ttE6tWUuSEBDO9BpWRLPIhORBYPrm8CRskMAQAbIbvJFQ6V1wixxXV3tvmKiBDM2uDU+JJsFc7Gtp0xHPM5Pr+3emTAtxqYaaGDX9kpgqzy+3etBLEbafvdJpoPp4/ZgL8kbvFpwWwTxJcm6wr6xdvDVC6rIkdCQYax13hyUL1RBwASf+s1VliPg+Cig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLFsgkR3hTbEhCgYT+0xS4sheliiYxEVcrQz+SXUYTM=;
 b=kEVwzJznpLfpfT4MCg98+AJlsocF+HvS4kXDgVuG6Iqd4phlyW9cmaQoTbtYNGT2k1WStC5/cFCbG/1uwRXIrZZXtiat/wx8SFWMtWCxbwv9+2S+xntOrSGt4JBHxcD1aeCqfn1Yta13/nDDlTtzyFY4t7uLs5THwhLCDtPjbzw=
Date: Fri, 12 Nov 2021 13:31:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Kevin
 Tian" <kevin.tian@intel.com>
Subject: Re: [PATCH 2/6] VT-d: split domid map cleanup check into a function
Message-ID: <YY5eqQykvDD8CVmT@Air-de-Roger>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <57c32156-369c-a92a-ecc0-fc4b890eb05c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57c32156-369c-a92a-ecc0-fc4b890eb05c@suse.com>
X-ClientProxiedBy: MR1P264CA0046.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6c85e4e-66c2-4664-70bc-08d9a5d862ce
X-MS-TrafficTypeDiagnostic: DM5PR03MB3147:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR03MB31477740F12F416313B8FA3D8F959@DM5PR03MB3147.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:425;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 83f2V3TGlUOXCwZ3GK7Inx4IZq3A7tN6H3SFvE6GHbKBDP245fw2OBBeIVXpa6yAYs0qjMlkm+HvxJN+p67uWqd3PI5gjeRlpv/KcelgjiuT24l8eTIfK9MAUBv1ukgGAnMMAwU5Zff5vOcEN1jg9o50Jn4rO1KWrATTS7Oo8V4IzZkYaBeE9UePD8HcsFGFb2bH6waDmrltU0Z7bwsJkTZ8GrkHi9TQBXMWY2SwA540JeMmo22NZTUFHAJrQRiiQWU5D79cJu78n6cKdctmQicytFwej8StQLlZYSmKzNfrki8P/5QQNFmIK4MgonfwCPMFRxIVmaRWrtbKYG/DEG20Pr94X1fonOqErzLNsuxZeCG626tX7+sDoiezA2dQ5hr79tsvFxeljNKa6XI2MIyvDFOcNRonQPsnuEUM73uKpI+iV5VOIe0oL3TGbaUIMaDp5nAqZ7hOZgDX4wqKQQlOd+NcKHcw7kz1sKGaXEIo4nw+bUcSRuYtJg9EkRf1qNr9hbzW7IL3VXMk+8fXRI+DaGUaASPRLEU4iqAnWGbeUQougkY4QSZC8+CFWu+R3P7TFtOAR2IToznKgKS+lQTEmUY9KFJjyT7g1Giw12jo16CMVqPw0MrRQ5b/SSGgjK6ruLthvElxW7ldBu8b3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(508600001)(2906002)(85182001)(5660300002)(33716001)(316002)(9686003)(6916009)(8936002)(8676002)(38100700002)(66946007)(558084003)(956004)(54906003)(6486002)(66556008)(66476007)(186003)(26005)(6496006)(82960400001)(86362001)(4326008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nyt4eTM4VERiWTd1QWpEMTZwTlhKZFA5ZXNLVTdKWmN3a2t4RzVlRkdpYW9V?=
 =?utf-8?B?MWFJSzV1bzlJRkg3V0Rqd2s0NkN6aFJVNUk5d0d6VDNHRUNGNFREYTJuMVpN?=
 =?utf-8?B?MlZLYi8xeDhyS0ltM3RZY2hyYmsvMDVxN0wyMWxJOEhZZ3daQ1orRlNremtm?=
 =?utf-8?B?QXphUSs3T1dpQytxTzVoWXFFSExORnhpNFVKcTN1V2xkamI4YjRNTGVHK3J0?=
 =?utf-8?B?aUNIWndtVTN3MitUbWpKZ2syVzZOc0FDMVpYNTVOWnZhUm1kSGdRSTlRNXdo?=
 =?utf-8?B?ZDI0eng5NXgrTitjQkhCdW96WnRmaVJHY1ArRkM1TkRqUmN0elNtNEQxSEpU?=
 =?utf-8?B?WHBwY1llRDl4ZnlYYTVZNGo1dVlDT3NrZm5yM3AxWTVnTHdmdU5MT3BUYVF0?=
 =?utf-8?B?clVLekVBWVZlbThGZ1JUVjNZT1IwNVVNKzhvTGVuRTRQMkY4UnBqd2F4ay9D?=
 =?utf-8?B?Q2NEemp0b2VUTFZ0QWFCRGl4endRMSsyYWg2Q05JWUJrS3dERzhMcnVJWjZo?=
 =?utf-8?B?c1ZoVVI0eTdrRXdua1paZDJtNUREUkdCVXhRbHFPS1RSckZ5MjRrQzkySmI1?=
 =?utf-8?B?alo1ajJHZTQxU25Ja0NWSnpWUGYvWHhoTW8vUEdUK3VlQTBUMDhSd2I1eTZo?=
 =?utf-8?B?LzYxYjVNenhrSm9WVUVnM1FEUGJZR2Y0VmUzbDM5T3poVk5pZXZjd3J5M01X?=
 =?utf-8?B?ZVE0Rm9MbUxlWkNZRTNZNkVuRHdZZjM5RSs4T3Z3RU1kNVJEZmlvcXNhUWpZ?=
 =?utf-8?B?N0tzYWpBTHA2YzRZcGZrcEZCbTVsUG9Ma2tLY01hQTFrd2lkM3pKTWZtSFBY?=
 =?utf-8?B?aERPSzJHTzNocW1BejFIYjdOSUg0ajFXN3pmWTZKVC9DL2dhcnNhQ05UVkY5?=
 =?utf-8?B?S1FRaUtrOHFqYjRxdDFKanl3V3I5Y3VkTzBxV0pqM0Zac0dzbVFDRFlSNi9q?=
 =?utf-8?B?ZHFoZ1M4TkRNYnl4M3BUQVB4Q2MxYjFlYkFTcVNWWWI4Sk5GSVJqNkxxK1Vt?=
 =?utf-8?B?QzUra1prZTBDeDlrYUZMdmZ3dGVleXd5cFlQVkZyemk0TUhiV2tJWjd4OElr?=
 =?utf-8?B?YzgyWXdJZFJPbU53RzRud0g4S3puMElhRWQ0ajNFM1FHQzQvY2VhNXEwWENp?=
 =?utf-8?B?RjBLWjNkM1JoR29hL0ZISVB1T05ZYThpYlkzcEhRYkNILzdWV2M2Mi9JeU1s?=
 =?utf-8?B?OHhDdTFPWjY2YlZ4ZXF3djdyQk5tLzZFT08zUnhmQmNHa0N0MXdzUXZGQ1Vp?=
 =?utf-8?B?aDVMbVhrV0pEVUNramdDYTRLSU5OaWJUampNT0dRNkZGNCtqNHdvUG83T2dX?=
 =?utf-8?B?SnpaTzR1Q2d2RVhhSzNOTFNSTDgzdDdoTlRGL3hOTG9qMHZ4MS9SR1Nrc3hS?=
 =?utf-8?B?VG50TU1udjNUTnIxRWptM1B5ZFkvakxGUmJhcHdrR1JrMEZrTFFwUDVHSGRz?=
 =?utf-8?B?Mk95Q3ZYRVliZC8rZ2NNbmszVmllekJBOUtMMEJFTjhDR1REMm9WQXAxak1w?=
 =?utf-8?B?aHl6MkM3dlZnc0NKdWxqaXhheWFraWFJRGhnVm8vNzhCUVNCdVE5K1F0UWZB?=
 =?utf-8?B?Z3VGWTN2M2RlMkpYeVdRRHFuNEZlZEZRNkh0NzFxVm05WlovZTZnNE55MXJq?=
 =?utf-8?B?ZjNYKzRlWEZ0Z0hjUTZWditpYS90OGhRcWxsY1hheEV6MzZsMHIrTXZzQUZV?=
 =?utf-8?B?YmxaaVBwNDh6bXRoZTBYK3JZWm1ES0o2MXJBYU16VjZEbTgzSlpsN0JsOU1N?=
 =?utf-8?B?azJXZExqMWZGeTd0eFNaMVM1bWh4U2Uxb05sNDJBQ1c4MmFVcFlPT1g2Vm9i?=
 =?utf-8?B?K3FFMFpoK0hLSDE2bEcySFR0bXQ2WUpRNDRsbFlSWTkwR2p1NU1GMkV5TEtr?=
 =?utf-8?B?SDVKQldWem1xY2JORGRRaUYyeTVWa1RTSDhRRmU2MkpITkluYWJJdVJVK0tL?=
 =?utf-8?B?OHhqNEJlWE96ZFFpcWVWRi80ZVh4RWZmUTdWUjViSVhONG5STEpjaGl6anV2?=
 =?utf-8?B?QTRvRGJRNnhzT2J6RFpUeEl3aEtMUERZVWZPN1BKUXRxSVdBS3NJUi9yOXBY?=
 =?utf-8?B?RHJMVlRPV0ROMjR2Ukt0a0JtV2YrWjlteS9VZFVqZDEyVEVldVF3RU5OSDh6?=
 =?utf-8?B?WXExU3l4SkowamtESWFEdzQxTklhS0ZHOU53TG1hOHdXK2REdm1wd2RoT0ph?=
 =?utf-8?Q?VN5y1mINDGX2zeOYHycV4do=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c85e4e-66c2-4664-70bc-08d9a5d862ce
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 12:31:43.9637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfEuB26RvpPkWBCLvGHdKuIfsD1IKLmeM0661c3HDeVCGirjvIAbkvNc3CCdxzF7AFbPAz5flKU8kBVP5b8UUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3147
X-OriginatorOrg: citrix.com

On Fri, Nov 12, 2021 at 10:48:19AM +0100, Jan Beulich wrote:
> This logic will want invoking from elsewhere.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Might be worth to explicitly note this is a non functional change.

Thanks, Roger.

