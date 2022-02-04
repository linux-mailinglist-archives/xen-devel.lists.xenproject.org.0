Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CDB4A99B0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 14:07:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265521.458910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFyIp-00047L-Kq; Fri, 04 Feb 2022 13:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265521.458910; Fri, 04 Feb 2022 13:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFyIp-00044b-HJ; Fri, 04 Feb 2022 13:07:03 +0000
Received: by outflank-mailman (input) for mailman id 265521;
 Fri, 04 Feb 2022 13:07:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=46ws=ST=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFyIo-00044B-27
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 13:07:02 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55d3e20a-85bb-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 14:07:00 +0100 (CET)
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
X-Inumbo-ID: 55d3e20a-85bb-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643980020;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+C5cSq8N7oe15qd5RRjtgqgE04Te6M/xJdkEuolfKx8=;
  b=Cyf98hEkk9GTVpKtwOQ5H+ILw8lHG2rJJ2bLhKnjd68+1HOilb07GbyC
   af8A1Pj4J+IdZDlrkGJnVNprWHD2FVY2mlsI8icoBLRn0jzTUa6N0z6I9
   BhZrFqdW7Lui1eyGtD6mGDKFXpAR2rWIeyzLt8YQ0NRqBlz6ZuYfu3T5n
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BoWmmKysbnN0hcYtlNd95B2+l2rBu7gPQyVp6tPjS0YFYXr5NKmVDfmgBrufyZYPChpBT76I8r
 G8UIA6cBjtxYZUjrqm30ZBaCUpZ1ol11aodpzIFm4mIMiuClq2dSBtC4Dlla8o0S0AsTuKEoWQ
 +bJmYjJLrlAJiULrt4HtZy6Eu/nlGiaM8LSaQKQZufvM9Te7j7GiT5eOhVfQo8dzDt+YzDD/Hy
 0XMz2XY6nOvG0HMivEr1vOs+4RnUqlwceFR5NzXS5wTNC31ejpoOwh62FaWt8LxaN9lBO5iBey
 LxrI9bIlF/XXSxCkpvCT6MWg
X-SBRS: 5.1
X-MesageID: 63903829
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xdCkwKpngB8rce3uOrVNcnpRgtteBmI6YxIvgKrLsJaIsI4StFCzt
 garIBmEPv2DYDCmed8jbIq39R4G7MfWx95jQFBlpSs9FX5EpZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24DlW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaWLTAAkLqf1o7RecSNRGSVXbKxA0ZaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4VTK6FN
 5BIAdZpRBntTDBPZFEwM4M3zeqslmDkKRJxtk3A8MLb5ECMlVcsgdABKuH9YtWXQe1Fk0Deo
 XjJl0zQGA0XMeu62DWM83+yruLXlCa9U4UXfJWy++R2mlSVyioWAQcPSFqgifCjjwi1XNc3A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52ml0KPU/gLfHWkCQT5pYcYj8sQxQFQC6
 FiNmN/4AC11h5ecQ3md67S8oCu7PG4eKmpqTS0OQBYB4tLjiJoulR+JRdFmeIaSitD2Ajj2z
 yq9hS4ynagIjcUL2qO4+njKmzup4JPOS2Yd5BjTX2+jxhN0YsiifYPAwX/f4PVbJYCVVG69r
 WMEkMiT6uMJJZyVnSnLS+IIdJmy/OqMOjDYhV9pHrEi+i6r9nrleppfiAySP28wbJxCI2WwJ
 haO50UBv/e/IUdGc4dOWIe2BtQg9JOwVvbfX/rQR4tPZLFYIVrvED5VWWac2GXkkU4JmK45O
 IuGfcvEMUv2GZiL3xLtGb5DjOZDKjQWgDqKGMull0jPPa+2OSbNIYrpJmdieQzQAEmshAzOu
 +hSOMKRo/m0eL2vO3KHmWL/wL1jEJTaOXwUg5EPHgJgClA/cI3ENxM36el6E2CCt/8N/tokB
 lnnBidlJKPX3BUr0zmiZHF5c6/IVp1it389NiFEFQ/2hyNzOtvxsfZEKMBfkVwbGApLl6Uco
 x4tIJ3oPxiyYm6fp2R1gWfV8OSOiyhHdSrRZnH4MVDTjrZrRhDT+8+MQ+cc3HJmM8ZDjuNn+
 +fI/lqCGfIrHl0+ZO6LOKPH5w7g5hA1xbMtN3Yk1/EOIS0ABqAxcHev5hL2SulRQSj+Ksyyj
 FfLWEpI+LWW/ufYMrDh3Mi5kmtgKMMndmJyFGjH97emcy7c+2uo24hbV+iUOzvaUQvJFG+KP
 425Ftnwb68KmkhkqY15H+o5xK4y/YK39bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQKa6+UPM7FEUIKIFZ3ZOq0yvxJyCLZ6u44IRum6XYvrqaHS0hbIzKFlDdZcOluKIogz
 Op44JwW5gWzhwAEKNGDiiwIpW2AImZZC/cst40AAZ+tgQ0ukwkQbZvZAy7wwZeOd9QTbRV6f
 m7K3PLP3u0OyFDDfnw/EWn28dBc3Zle6gpXyFIiJkiSnoaXjPEAwxAMoy88SR5Yz0sb3rsra
 HRrLUB8OY6H4yxs2JpYR2mpFgxMWE+Z90j2xwdbnWHVVRD1BGnELWl7MueR5kEJtWlbe2EDr
 r2fzW/kVxfsfd3wgXRuCRI09aS7QIwj7BDGleCmA9+BTsszbjfSi6OzYXYF9kn8CsQriUyb/
 eRn8Y6cs0Eg2fL8d0HjN7Sn6A==
IronPort-HdrOrdr: A9a23:Swpzeaq2cDY0JeXgDdVYqOUaV5uzL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13jDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2u
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LrEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GS1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusq8q+SWnqL0wxg1Mfg+BFBh8Ib1W7qwk5y4CoOgFt7TFEJxBy/r1bop8CnKhNPKWsqd
 60dpiAr4s+PfP+W5gNcNvpcfHHelAlfii8Ql56AW6XXZ3vaEi946Ie3t0OlZSXkdozvdwPpK
 g=
X-IronPort-AV: E=Sophos;i="5.88,342,1635220800"; 
   d="scan'208";a="63903829"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8BzuojzgjPvIp/D4aBHR42tQ4W1Y/UW4dR56vluyE13fawkhUsMSDwZxaQV0lG22agyrObV4Rxsy5Qy5RcRNp2IX2ST7HjFwvKkxerg/cko2nKUemkBXbQyXlpm81vosP0OgjpRhQV+IH/F1fYzod+sfLmIaDphb0pfttqwZkKkT3I/D1TWOVusFlAPJ+XiTZwzyWlytXuPj6YBm//sXbEbCPBOJMuUXgUmyVOOjcB4SmDDCq+dUahsygw7PKzaNP6uXKJskbWUVODeS3yO17ALyO4By6+MTW6q33QS5wwLvjOPqXiIzg2GXG1mvdPHewFMW54PJbRMBkj/Z2iM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOsj3/lO0yyIvHSXvMIiEAHT+mxFIqipm9UcgUnPejE=;
 b=SXG1Fk2HWumXBK7oCzWvrDInjERi8GONMvINIXZPfUg6F74g7qyiihjn+G79OMbOCgGee+hNfiEVwZ3HZc9bPUBEwQMDwntiUbeM96NZLYqpCIUy+mRckRgQ5pVr/o0RoE8ZipGVlcp3hFpp/uKuoxzkClUUB/7yzWU98ybaANFdH3BiESwk/fFnC7WK2Z5QyK5Wb1xMwRS6XTyLzJZ5a2+oouvykunpL9Mw0u1YgVHNaErqISqjETRc+Yfsj9PlERpd69nksce/ypd3Gdu8YPtNRfPBCsQ5BPyrZP8TJitQA5CzOCt6ZCBB30V6LYiQF9s4HYiXUH6IhWAzqIkWyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOsj3/lO0yyIvHSXvMIiEAHT+mxFIqipm9UcgUnPejE=;
 b=VdvICTBJ7S07Go9In1q/ulxGypynYh/1rzxYkeya8JsH3AWISh8NNRrfWxqhk5mQ08MzY2uBTsLdgk/4LMJ2dUSjVuPn6igD1jWgur5aQ28BPhR5z1sMjb3ZLtULwULrFdNYweInbpFHKkXb35KxdoTuXZeeEVOFJ9lKStfayEg=
Date: Fri, 4 Feb 2022 14:06:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Message-ID: <Yf0k6aoKK5G3iad1@Air-de-Roger>
References: <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
 <2cf022f8-b000-11b7-c6b9-90a56bc6e2ea@epam.com>
 <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
 <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
 <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
 <Yf0KcVD8W05A4fbB@Air-de-Roger>
 <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
 <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
X-ClientProxiedBy: LO2P265CA0115.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::31) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34ac3d3e-c06b-4107-a340-08d9e7df378a
X-MS-TrafficTypeDiagnostic: BYAPR03MB4376:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB43769062334CA87F8DF581C68F299@BYAPR03MB4376.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HPTHrgyRoJif3/t5zCPPuqIRq7Zx93SSH6D7ge473mXoD45YatJiI025B10vkUdxiEX5uw9MWmuT1gbLEvcLxs3QiAVkr7SLPBw6X6C1YQJbMv2BoMBoyge05pdsZ+qaZSk6OC76ltdtfXpDiI+VJevVrp1rLwoHWX0z/l3WBRSRFi5I48cGUfHJW4jIc3Ys5RX+ui8G7+FMvSj+8eSPhVyQo35iRUgyNGJhKbJ1R07bEeT2Vw222BYa4FfZrCHbZYTEyEvCt8QhZCrDKAPubDK37QI/wV9QKEhetGb3/SpcQlcUm8I2Q7GvW/tasazrzmYT3ItxQa8xjGLgYRml7L/mrv08uWi81SQFBBstnN32wxjX8BJcoZYAP62gfpILHHUIQQmogv350o1yKLbB6otTpCBbdk4snjg28ATthSsgIYisSpukshXs5pTThFI35aifomBdy8cX4pNpMALI7i7ljQ+wBoeWlEsu3tf21LvLcwr6q0uqk0edMH0RC5e55oZfWhDxU6V6YQh9naJwzRVKtKlfA0zacBQ3vdX8+f1L8PhkLVtqh0rWtonqUgS9y3nZrZXnQWQaakTLiVPxJCAsVQxoxaAlZa25D4Enyob+tM1Rke2Z+9cwP0eZNtTIuEt2tmMmGj7mMgFntzYlBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(53546011)(66946007)(508600001)(8936002)(33716001)(38100700002)(82960400001)(85182001)(5660300002)(6486002)(6916009)(66476007)(316002)(54906003)(86362001)(83380400001)(26005)(2906002)(186003)(7416002)(9686003)(6666004)(66556008)(6506007)(6512007)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MytjbkljTjZkbmIxd3B3RGF6amFNLyt6R1ZyNDBEMW9KVDZPMzhHZERJMENL?=
 =?utf-8?B?UitQdkhKRW9WMWhySXJxQjhweVRvM2JxVnViVDhSSFJRYllNMHhrUGVBb25H?=
 =?utf-8?B?Q0h4QXhkbmdWWWt1YmNIdXBTd3MvSDZVTHdyUG04Tkw0dHZmWnNnTEtUeUZK?=
 =?utf-8?B?QmUzZzN1Sndjc0dlUXJoeXFFYzBtOUd1dmlMY2d6d3BsejdnTzJRdTQ5bHl2?=
 =?utf-8?B?MzFqQ0pkN3pudkZSODQ3eFdwT3RCOWZQR2V1VE5Qb2lLN2hNZUEyaDdnKzhJ?=
 =?utf-8?B?b2h1M2lqTFliRmgzSERCc1BBNDV4Mm1SYU1WK0dkUUVRWHNZbEZVZjQ0QnNJ?=
 =?utf-8?B?bDQreGFmNjhsL3orVklRV3FnTThLSVpRekNWS3RnbnpYeDcxZGEzYXozaW9w?=
 =?utf-8?B?VzU2R2Q5RkxzSHZjS3E1Wi9oWGVXWXpBMTMzS1FYeEtFZTFjSTdRMmQxU05y?=
 =?utf-8?B?WkE3bGlDMDFFSnJiTW5BdUpZSVZJd1ptZVRGN25iQUxHUDk0djQ3RWJqOTdG?=
 =?utf-8?B?L2dBSUhiUnZpUk1lc2RSVjdvZ1l4dzk3VEpXeGpUMXhGc0hSdW85ZFRkYlZ0?=
 =?utf-8?B?dXZBSjFtdXQ0WUU3SUdPTU9CWmJJcXNKeHFGZXpQZWZhdGNKNjBUbU04K0JQ?=
 =?utf-8?B?cFZlcW9Mc0E3Z2RMdHNYMmUzSzVSdlhOU0FTd3BaWXVyR1dVdGpXajhReFZv?=
 =?utf-8?B?Q08xcEhrSVRtZ25jc2J0VmNkbElZOHVSMzRhT2ZIV2cyU2R6RWcrcTFWZ2hi?=
 =?utf-8?B?ZEkyeHdJOUFKYWQzUDl6OEIveW9VZmMvVVMzejd6QmViK2pFV3hPcEx6TTlG?=
 =?utf-8?B?M25jSktOTkZWVm5TSWRLOXVacytrS095cS9rcEphQXU5YkRQN0JVSklQeTBQ?=
 =?utf-8?B?TkJWZnp0N3R5ZmZBZGxUVEhsQllFNHBNcThLOEhMRnNLd04ya20wL3dldHhu?=
 =?utf-8?B?WDFYYVNpdnozTkZ0Y2ZhRVlqV2w2Z0JGbnBQM3p3b1lrcG1tRElxcDBqS1Q0?=
 =?utf-8?B?L1RGb2RnVFdtMGlUbVN2WWRPUlgyQWxndTRoT3hYNDZVNVd1V0hFVW83OFBt?=
 =?utf-8?B?c3FOK1NXK2ZVa0RJNzRDald3UXBPNXh3RXJOT2U1Z0xYTVdDK05nbDJYUFBW?=
 =?utf-8?B?NlpVaVVjYUIvTW5MRUtWclZNTFlQSEM1TS9OYmdmdXRXWlkrY3F2MUI5aXZY?=
 =?utf-8?B?SldURjJFUXpSWWloTDliMzV6cFFhME5KV1dXcURVY0VCNHNOcVdEUFJOb1Nl?=
 =?utf-8?B?Um1ZY003K0l4bHdOV3FOdmxYQzl4ZUk2MjJ4aUM5ZmtMc1NvSnA2enRUU0Ft?=
 =?utf-8?B?RVhFQ1lVckRoc1diYy9qeWNUWGl0dGRiYlIrY1M3VjM2Mkx5YWVRRnluenVB?=
 =?utf-8?B?Szk3U2sxaG5vajBKRU9LK3RTUW1jL05LMExoSHVhRUFWRVhDNTUxTnR1Z0Jw?=
 =?utf-8?B?WGFRZlhreFp5QnVzeW4yZlNVZ2dmcERUMUx6Qm4rZm5XVW5oT3p2NFZGM2lF?=
 =?utf-8?B?bE4vTkJUdzVSYWwwSDgvUjRYMVQvL25sZndjQlRoSUVxeUErVjl5dERqblNW?=
 =?utf-8?B?UGRUaEhmdGM5Nkw4VnBrUS8wdi9BeWlnY1kzZjlmWmwzSC9QL2RsSm85M2xp?=
 =?utf-8?B?K1Jib0dxcUFFaFZ1RUFDVmo5dWxEZHdZREVsTUdLQnJQdXcwVHFvRVZyQVVw?=
 =?utf-8?B?dnF6LzFGT3NZb1ZzRklFaTRVSVhWOGxqTnlKNVdGNG5aKzEwTXE0VVpoZHUr?=
 =?utf-8?B?S1pTMTE5R2d2VEdrZTVyQXFzMFRwQUpsMFU0OFlvTVFsMndwaDdnVXloWVlY?=
 =?utf-8?B?c3U2MzMzdUU4SkRJdFVMTUcrcVJjTHBhUGdlWTBVNmZGUTZuOTBTRkUxd3Aw?=
 =?utf-8?B?WElnc1ZjNUdhUTZxMFRjWjFVbmsxcFIzdGtxazd4VVVLZ0ZkNnVzc25uNGNj?=
 =?utf-8?B?cDlHbU1uemdiR2FPeGNSMVlRR2UyaXBYMndBaXg4ejU5UXVUVGpBSE1sd29r?=
 =?utf-8?B?aHVpTW5ud0k3Y1cvNUNXUUt1WXNPZG8ram4yckdQVFVyRXRQbFc4K3JWZUxv?=
 =?utf-8?B?dVRVK2t1aUtSRElTMjlteFBtZ1ZaamhMeGU1U0cvbEZiMnFnSUN1dTZuQ1Fm?=
 =?utf-8?B?ME1ZMDBzdXNMUUEya2FnRnVQRkpEbGxvMi9ZODY0ZUdZNGZUOXBtSWVXRU13?=
 =?utf-8?Q?z53AuoMbKVj4DP9hulWdpZo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ac3d3e-c06b-4107-a340-08d9e7df378a
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 13:06:54.7066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvoL9PaCW3P43GM/bKIVdu6rvGaYJcBLJAg3JiPoH4U3CpG9zCC9wN45hsZ9d/b6wqcWsunsolbpOtJdC1UBkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4376
X-OriginatorOrg: citrix.com

On Fri, Feb 04, 2022 at 12:53:20PM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 04.02.22 14:47, Jan Beulich wrote:
> > On 04.02.2022 13:37, Oleksandr Andrushchenko wrote:
> >>
> >> On 04.02.22 13:37, Jan Beulich wrote:
> >>> On 04.02.2022 12:13, Roger Pau Monné wrote:
> >>>> On Fri, Feb 04, 2022 at 11:49:18AM +0100, Jan Beulich wrote:
> >>>>> On 04.02.2022 11:12, Oleksandr Andrushchenko wrote:
> >>>>>> On 04.02.22 11:15, Jan Beulich wrote:
> >>>>>>> On 04.02.2022 09:58, Oleksandr Andrushchenko wrote:
> >>>>>>>> On 04.02.22 09:52, Jan Beulich wrote:
> >>>>>>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> >>>>>>>>>> @@ -285,6 +286,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>>>>>>>>                      continue;
> >>>>>>>>>>              }
> >>>>>>>>>>      
> >>>>>>>>>> +        spin_lock(&tmp->vpci_lock);
> >>>>>>>>>> +        if ( !tmp->vpci )
> >>>>>>>>>> +        {
> >>>>>>>>>> +            spin_unlock(&tmp->vpci_lock);
> >>>>>>>>>> +            continue;
> >>>>>>>>>> +        }
> >>>>>>>>>>              for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
> >>>>>>>>>>              {
> >>>>>>>>>>                  const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
> >>>>>>>>>> @@ -303,12 +310,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>>>>>>>>                  rc = rangeset_remove_range(mem, start, end);
> >>>>>>>>>>                  if ( rc )
> >>>>>>>>>>                  {
> >>>>>>>>>> +                spin_unlock(&tmp->vpci_lock);
> >>>>>>>>>>                      printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
> >>>>>>>>>>                             start, end, rc);
> >>>>>>>>>>                      rangeset_destroy(mem);
> >>>>>>>>>>                      return rc;
> >>>>>>>>>>                  }
> >>>>>>>>>>              }
> >>>>>>>>>> +        spin_unlock(&tmp->vpci_lock);
> >>>>>>>>>>          }
> >>>>>>>>> At the first glance this simply looks like another unjustified (in the
> >>>>>>>>> description) change, as you're not converting anything here but you
> >>>>>>>>> actually add locking (and I realize this was there before, so I'm sorry
> >>>>>>>>> for not pointing this out earlier).
> >>>>>>>> Well, I thought that the description already has "...the lock can be
> >>>>>>>> used (and in a few cases is used right away) to check whether vpci
> >>>>>>>> is present" and this is enough for such uses as here.
> >>>>>>>>>      But then I wonder whether you
> >>>>>>>>> actually tested this, since I can't help getting the impression that
> >>>>>>>>> you're introducing a live-lock: The function is called from cmd_write()
> >>>>>>>>> and rom_write(), which in turn are called out of vpci_write(). Yet that
> >>>>>>>>> function already holds the lock, and the lock is not (currently)
> >>>>>>>>> recursive. (For the 3rd caller of the function - init_bars() - otoh
> >>>>>>>>> the locking looks to be entirely unnecessary.)
> >>>>>>>> Well, you are correct: if tmp != pdev then it is correct to acquire
> >>>>>>>> the lock. But if tmp == pdev and rom_only == true
> >>>>>>>> then we'll deadlock.
> >>>>>>>>
> >>>>>>>> It seems we need to have the locking conditional, e.g. only lock
> >>>>>>>> if tmp != pdev
> >>>>>>> Which will address the live-lock, but introduce ABBA deadlock potential
> >>>>>>> between the two locks.
> >>>>>> I am not sure I can suggest a better solution here
> >>>>>> @Roger, @Jan, could you please help here?
> >>>>> Well, first of all I'd like to mention that while it may have been okay to
> >>>>> not hold pcidevs_lock here for Dom0, it surely needs acquiring when dealing
> >>>>> with DomU-s' lists of PCI devices. The requirement really applies to the
> >>>>> other use of for_each_pdev() as well (in vpci_dump_msi()), except that
> >>>>> there it probably wants to be a try-lock.
> >>>>>
> >>>>> Next I'd like to point out that here we have the still pending issue of
> >>>>> how to deal with hidden devices, which Dom0 can access. See my RFC patch
> >>>>> "vPCI: account for hidden devices in modify_bars()". Whatever the solution
> >>>>> here, I think it wants to at least account for the extra need there.
> >>>> Yes, sorry, I should take care of that.
> >>>>
> >>>>> Now it is quite clear that pcidevs_lock isn't going to help with avoiding
> >>>>> the deadlock, as it's imo not an option at all to acquire that lock
> >>>>> everywhere else you access ->vpci (or else the vpci lock itself would be
> >>>>> pointless). But a per-domain auxiliary r/w lock may help: Other paths
> >>>>> would acquire it in read mode, and here you'd acquire it in write mode (in
> >>>>> the former case around the vpci lock, while in the latter case there may
> >>>>> then not be any need to acquire the individual vpci locks at all). FTAOD:
> >>>>> I haven't fully thought through all implications (and hence whether this is
> >>>>> viable in the first place); I expect you will, documenting what you've
> >>>>> found in the resulting patch description. Of course the double lock
> >>>>> acquire/release would then likely want hiding in helper functions.
> >>>> I've been also thinking about this, and whether it's really worth to
> >>>> have a per-device lock rather than a per-domain one that protects all
> >>>> vpci regions of the devices assigned to the domain.
> >>>>
> >>>> The OS is likely to serialize accesses to the PCI config space anyway,
> >>>> and the only place I could see a benefit of having per-device locks is
> >>>> in the handling of MSI-X tables, as the handling of the mask bit is
> >>>> likely very performance sensitive, so adding a per-domain lock there
> >>>> could be a bottleneck.
> >>> Hmm, with method 1 accesses serializing globally is basically
> >>> unavoidable, but with MMCFG I see no reason why OSes may not (move
> >>> to) permit(ting) parallel accesses, with serialization perhaps done
> >>> only at device level. See our own pci_config_lock, which applies to
> >>> only method 1 accesses; we don't look to be serializing MMCFG
> >>> accesses at all.
> >>>
> >>>> We could alternatively do a per-domain rwlock for vpci and special case
> >>>> the MSI-X area to also have a per-device specific lock. At which point
> >>>> it becomes fairly similar to what you propose.
> >> @Jan, @Roger
> >>
> >> 1. d->vpci_lock - rwlock <- this protects vpci
> >> 2. pdev->vpci->msix_tbl_lock - rwlock <- this protects MSI-X tables
> >> or should it better be pdev->msix_tbl_lock as MSI-X tables don't
> >> really depend on vPCI?
> > If so, perhaps indeed better the latter. But as said in reply to Roger,
> > I'm not convinced (yet) that doing away with the per-device lock is a
> > good move. As said there - we're ourselves doing fully parallel MMCFG
> > accesses, so OSes ought to be fine to do so, too.
> But with pdev->vpci_lock we face ABBA...

I think it would be easier to start with a per-domain rwlock that
guarantees pdev->vpci cannot be removed under our feet. This would be
taken in read mode in vpci_{read,write} and in write mode when
removing a device from a domain.

Then there are also other issues regarding vPCI locking that need to
be fixed, but that lock would likely be a start.

Thanks, Roger.

