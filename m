Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7F2439890
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 16:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215902.375317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf0xj-0007ED-Fp; Mon, 25 Oct 2021 14:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215902.375317; Mon, 25 Oct 2021 14:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf0xj-0007C2-Ce; Mon, 25 Oct 2021 14:28:31 +0000
Received: by outflank-mailman (input) for mailman id 215902;
 Mon, 25 Oct 2021 14:28:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G2Ub=PN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mf0xh-0007Bw-S6
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 14:28:29 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d219d1b6-359f-11ec-840f-12813bfff9fa;
 Mon, 25 Oct 2021 14:28:28 +0000 (UTC)
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
X-Inumbo-ID: d219d1b6-359f-11ec-840f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635172108;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=t0tb06zQmmQgPB5TNz1qJRRr0PrmoaCRnjf3rBkAY8Q=;
  b=AOJ/MysYP2SRtkFeU9y187d6jPqGgnPjxQa6/6on+ArTbB9KfHVcFmXY
   /umHJOFvdksgLFT6UitXyVafFqXCi3uNI16OYUdhaVO15e41RV1CZfule
   0BY6ixuxyeXTmsdPWLnq/ZNaY7tge+nJjKx2bgvBBTYYEOUVYrYZ/aznW
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wfQ+yC/Ezc3pZlg3n535ht1Csr2W2Gv/4wmSRRhyMoooG4IHHaF/xWPu1KqEGnnA1GEYK/LwQA
 emZEhFCW2736op3lPQFX24qvjWHzNP5ZGW1gCfTQRO8z44qa8qhZb028+JcmqqArDWytOxBkq7
 luwSI5CcjBK95G8cuwKspjcyQbgiA1Moe4e+6SbKraXJKsKct3kjw+wVoasbZhEO8fuEd0kQLe
 YvfEFhcD72c8BtcdQEoky7cONjQ79OtmkNQdWRPrVc2X8Ox3K5HKX6kJU0wVLeO8Cwa0DmxPQ4
 yyzU7SwT343jMuMyKkJaHKg4
X-SBRS: 5.1
X-MesageID: 56382673
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:77QQnagqNGAw1PQsWjrpk8EZX161SBYKZh0ujC45NGQN5FlHY01je
 htvCDiPOPyDN2PxKt4nbI2w9R4Bu5CHxtJnQAs+rnsxFywb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Yy3IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Tvo7rZgokMJTKid86YzZiDBhBbYZJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t2JseR6iBP
 KL1bxJ2dQ7nbA9hM2wIGb0hzcOwqHvNXmBH/Qf9Sa0fvDGIkV0ZPKLWGNDYYMCQTMNZ2EORv
 Hvb/n/RCwsfcteYzFKt22iwi+r4uDL0UYMfCpW17vdvxlaUwwQ7EhQWSF/9uvi/hU6WUshab
 UcT/0IGpK4+7hbzFoHVUBixoXrCtRkZM/JXF+A58wiLxrDj6gCVHHUfTjVBZdols+c7XTUvk
 FSOmrvBGztrt7GETGOHwb2dpziyJCs9IHcLYGkPSg5ty8nupsQ/gwzCSv5nEbWplZvlFDfo2
 TeIoSMiwbIJgqYj1a+24FTGiDKEvYXSQ0g+4QC/dmC46gJ0Yqa1aoru7kLUhd5HKIuaVVCHs
 GIzh9mF7OsOAJeOkwSAWOwIWrqu4p6tKybAiFRiG50g8TWF+HO5e41UpjZkKy9U3t0sIGGzJ
 hWJ4EUIucEVbCDCgbJLj5yZFc84loftGNrcUOHvSephWIdIS1+s83Q7DaKP5FzFnE8pmKA5H
 J6Ud8ewEHoXYZhaICqKq/Q1iuBzmHhvrY/HbdWilU7/iOvBDJKAYe5daAPmUwwv0E+TTOw5G
 f5kPMyW1w4XbuT6ZiTGmWL4BQFXdSZlbXwaRso+SwJiHuaEMDx5YxMy6el4E2CAo0iyvryQl
 kxRomcClDLCaYTvcG1mkExLZrL1RopYpnkmJyEqNlvA8yF9Otv2tP9FJsNvJ+lPGAlfIRhcF
 altlyKoWawnd9g6025FMcmVQHJKLUzDaf2y09qNP2FkIs8Iq/3h8d74ZAr/nBTi/QLs3fbSV
 4aIj1uBKbJaHlwKJJ+PNJqHkgPg1VBAybkadxaZfbFulLDErdECx9rZ1aRsfanh6Hzrm1On6
 uphKU5J9beW+9RuroihaGLth97BLtaS13FyRgHzxb23KTPb7iykx4pBW/yPZjfTSCX//6DKW
 Amf56uU3CQvkAkYvoxiPaxsyK5itdLjq6UDllZvHWnRbkTtAbRleyHU0c5Kv6xL57lYpQrpB
 R7fpogEYe2EaJH/DVocBAs5deDfh/sarSbfsKYuK0Lg6S4poLfeCRdOPwOBgTB2JaduNN932
 v8ovcMbslTtihcjPtucoDpT8mCAci4JX6k978lIC473kAs7jFpFZMWEWCPx5ZiObfRKM1Urf
 WDI1PaT2ewEyxObIXQpFHXL0e5Mvrg0uUhHnA0YOlCEutvZnftrjhdfxis6E1ZOxRJd3uMtZ
 mUybx9pJb+D9itDjdRYWzz+ABlIARCU9xCjy1YNk2GFHUCkWnaUcT84MOeJuksY73hdbn5Q+
 7TBkDTpVjPjfcfQ2CouWBE696y/HIIprgCSytq6G8mlHoUhZWu3i6CjUmMEth/7DJ5jn0bAv
 +RroL59ZKCT2fT8eEHn5112DYgtdS0=
IronPort-HdrOrdr: A9a23:5rekYK8np9YI6mIFdL9uk+DYI+orL9Y04lQ7vn2ZKCY/TiX2ra
 +TdZggtCMc6wxhOk3I++rvBEDoexq1n/MY3WB4B8bGYOCMghrKEGgN1+vf6gylMSv46eJHyK
 tsTq5bCNn9ZGIK6frH3A==
X-IronPort-AV: E=Sophos;i="5.87,180,1631592000"; 
   d="scan'208";a="56382673"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dV/5fUcBqNpV1forc07pJN1B0HRbDXsxAXJfMbTrDr0Ggzc0ykY0jV9KoBfr35T/GNz0ifCAx9Oe3NgGQOer18TJEBrfRPRCnYSG0Jn48f+RWH+aoD7yXl8mgu9RcRRY3kfBdiuW7IkaBcHnTT0EMd8silDFk3Avd4zaEBA1BmDXMgQvAhdbuvdwoeJogbgnDxWuQK2aC/xH5xgAOopqQKHkvqjWVmXDMjJRcd/dGPnbRGjWcQaERwdc5N7/7qw9AM/XfiQUvsqQX3IwmnEh3Xb6T9T9bI6Y6rsP24UuTlvDM5E+AHr/CpoTmPQlNdKgi/+Z7OgsTU4l8LeVRD3xxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+vmYW3W+r5oYDmBhfopIfv3ufDChDKH04CHssxa3rQ=;
 b=CT7KlVEavczvnxJsT42oW97YF1ZoVVIk8JAKbs7EcT4AkEKF1XVq/iAPr3BDV5135BGGxw0PMTrwuLnsIpTJKvmPLVzfvmD4gVq1olt3H4Mvu1hMD5qP5EvHoXSo/btabSeAHmes7qMhP5rjDAR/TUMuld82ZyAfZyXjo7zjOZyk95GaegpJv1NkN+MYrRUsSsMZzp5p5Vzxi5nkFFjzzvPdXn6wjkQt5igqjFv6aprfkwB+CleYMHhjGZDcxcivFHNVOhkba11TrWm8dL3Y6eKfE2FVHeq1oqjlfxVW2BHcltNN9IZO/yk6pgJ2sjp6qG8NKMJ38PB0Kq3TrakAOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+vmYW3W+r5oYDmBhfopIfv3ufDChDKH04CHssxa3rQ=;
 b=PrQueacth3A3JPoZx5UjYcAeXWsV/jUh49SjJOu4l5Op/XAcIg9UCxmjUtxqpo7M2yuWBUNRfE9tUuOSjNlIXwCBAI0Ridr8uAq7FS8n90ZoAF2EAUhDDLv7VjPZPVPLPeOB44jhnMsbWOeQkMrADUf9+ZVSXRFrqe1NH2eE+9o=
Date: Mon, 25 Oct 2021 16:28:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Oleksandr Andrushchenko
	<andr2000@gmail.com>
Subject: Re: [PATCH v3 03/11] vpci/header: Move register assignments from
 init_bars
Message-ID: <YXa/BINQ4IKwg9ZE@MacBook-Air-de-Roger.local>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-4-andr2000@gmail.com>
 <YWbkZ216FbV8lBns@MacBook-Air-de-Roger.local>
 <01ce921f-cbc1-9524-0edd-47665b5db82c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01ce921f-cbc1-9524-0edd-47665b5db82c@suse.com>
X-ClientProxiedBy: MR1P264CA0067.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dab0a69-82fd-45d9-cf05-08d997c3b4e0
X-MS-TrafficTypeDiagnostic: DM6PR03MB5178:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5178A2DE45464C592DD64C448F839@DM6PR03MB5178.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A8F2TspDzEVWZJ9OpyXnHZ/pW/CfNvg6cjgpSs8GXPnlVEEPEii7JzLkXNyhWXmJ1cxiCJGWy4A1dfi8nqLa0H85XoWwo3sj3mQKmCzSdFj0/+sJwYSmlzqPyOw/kSlf1+TiBAv+7D1QBXlLKyyNs7OUqhmjIhdmF0/CF8ehfI9q2etUFbUSdhfGdviLIeY4FYnumfEQryoT6ZJrvtoB3CF8IcRgUutAE13mXsNwVtFoPWO7WhXmacXlJHpR71nm3yfler5JwWmh3ZDGS5q/xGUD+oUa8qG8R5UG4Ww0vtgMncqB+ZPPkydxOcLGLiyxJO7NyRrhsnkpTtfacpHMIJECI6dsoqZ4urkPziLJGSLsfWHhEDM/FbsQsWahxuQsZnBsxwJJ3f/bRo+VUrOF7HCxcZz0I/G1ExARKwxdNt4jTJB95DM401qngWwLnci0UM8xeGhSZtwjz8k2a1MZTWVkQ9WYGVM7IyIhUuIIRG7x8GYfDYI1VTihDdhKnIkVtzqfeTpc2x8CQy1+bdNtwArAepgBkF2EIPh9qtU98xlqMPNvB6pEFxhbrPaDGmCupo+QNAHPMzPBagdm4ZcZcE+zeGfbUoqgLQCBewZXQteaE1a2DTNmSAF7m7UJRo7O7nLxUxT1/zOB/L+VxJl+RA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(82960400001)(85182001)(6916009)(8936002)(186003)(86362001)(9686003)(53546011)(316002)(54906003)(6666004)(4326008)(66946007)(5660300002)(2906002)(6496006)(66556008)(66476007)(6486002)(956004)(508600001)(7416002)(38100700002)(26005)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2xKaWFvMnRKSGlKOVVBdTcweUppNHFXSHYrVjNOZzdxeGlXU0JpVUNJODFM?=
 =?utf-8?B?UEZsU0RXMW1zRGt3MkxmNkdrZmMxd292aG5qQjJnMlVCUWZaWTlGS3BHcGNQ?=
 =?utf-8?B?ZGxHR3FRKzB3a25sT0xZOFdHQUgyN3F6cm01cytEMmJSeFluV1pncmkxSU5a?=
 =?utf-8?B?UDVKdkFPWUMwK0M2ckJzSEozbVdyRlQzUE5aRC9PdUVzV09EWGpYVE5VbHV2?=
 =?utf-8?B?QkM0UkhkMmprZWM4TW1lMUtpS0tHN2xXVmFDNjZjUlJ2Y1oycENXa0IvN1Zk?=
 =?utf-8?B?RlNFZmdlT0F1TDdkbVlWbi9MRzF0blRZYlpKVHh4TmloY214N0RDS1RTZ1dX?=
 =?utf-8?B?ODd3NUdaOVRMK0dzMDVXdy9FSW5KeHZjN0hqQStQNE12SW9obURHaVY0bmE5?=
 =?utf-8?B?L2t1N2tqRkwwNlRHNHNJRGJEOVA5Yno0by9JMU1wZlRYNjN6L1hJSUE2WS9h?=
 =?utf-8?B?NE5nWnFDcDVnK2pjRUh4bXVpUXYzQlRvbkRFR2VoTEF3WWVUMDJrQmdRN3BT?=
 =?utf-8?B?NXlQY3pnYXU5OUQ5andsV25SRDg0U1pUTzJ1Qk5HUjhEVTVOV1FGMzRnb2pM?=
 =?utf-8?B?UlRlSHAxSU5lVHlydUVwcFNPWU1DVzV6QmpwbkdVdEsvUXRGSDRnNmIrTmh1?=
 =?utf-8?B?QTdrNmc0MjhSaEtoMlJ0Q0gwNVlxbnovVXVOaWFpNFR1VzR2MWl2VDQ2eGhV?=
 =?utf-8?B?cUZCR1dDWjI3eFRqSXkzalZLYTdwZTRwTW90SWkvSE40N1BRRjJ4S1lkU2dC?=
 =?utf-8?B?eUhGbVM5ZjFjTHRBMlJnMlZoUm5MNStwZDJpR1MrV1NuTDFZTjBjaUs5QWkz?=
 =?utf-8?B?UHFNK2JESWdmZld4UVVJZFA5OWhFOG9pbHdZTU9YejZHdUxBTmljMnNvNkNR?=
 =?utf-8?B?ZDBKUzhUWTF2bVAxa3pkN1dzMHRhYnYxOGR0NmdBODV6dHlzcDhDUG85WHR6?=
 =?utf-8?B?RzhXeERoTEY4YWQ1VS9XNkg1YStuVFlhMElWd0ZxUnJqWXF0ODdWbXZ0cm1P?=
 =?utf-8?B?NnA3S2J0bmM1bjVEdzBaSitYL1Vhcm1Sa1J4Y29vNnFJVlhYVzhzanFGc2ty?=
 =?utf-8?B?akpZWGZRTDFTMldHNzM3d0JDdWIydUhlRnZTRzhVZUFmWTV5UWpWZy90M2Np?=
 =?utf-8?B?b21lWThBUTdFSHFHWlVXTEZLR2JuRHdINGNpbTZPR2V3bnlkaWJqb2pXSEow?=
 =?utf-8?B?QnJialJ2NUhKdVFZVzE1YjRRMnI5VzBkalZkTFFUUVNnREdHRU5vWml4UUNS?=
 =?utf-8?B?elkwWXpHSTlMaG8xVSswR3YvNnJ1VFZMU2tWMmYzWmhRdmgvT01pYmErK0hT?=
 =?utf-8?B?aEVnd2d2N1dRd1ZlQXNlZ01hVk1PZ1lydkp5MTdEdURjbnpCZ0N4SUd3eitM?=
 =?utf-8?B?dlJGMGtSTFVMVFY1NVcxdlpNYnF4V0trZ0pveW4vZXc4RnVKUEI4MGhzZEhW?=
 =?utf-8?B?aHZYbjFWYTNSSDF4UFJSSGh5ckErcEZrVWUxTHk5cDVHcXp0YysvM1I3ZUwy?=
 =?utf-8?B?d1MydU9qNUgrNlJaazhCUkxOREF3QlJ1RzRjbXJHWk9iS3pXS1gyRmcvSE1t?=
 =?utf-8?B?d1FDRTFUWS8wK0dvY3c0UzJBcm16bzdndHVkT2FQbjVqbW9RdFNNOW0xMnIx?=
 =?utf-8?B?c3ZsK1hjYTJxcGR1T2FkdUpGWWtOSm9uQ3lkK1h2YWFacGo2WXVjbWs1RlA2?=
 =?utf-8?B?cjZoMG5ROEdWUTZoSGVaa1hEYmVYZndmVk5ERzI1cjhZMlRNK2ZGTDdVcHJZ?=
 =?utf-8?B?TTAyZ1ZMMkVtY21aVDFGclVNUGhRZmVxTGhYSWxSNUNrU0tjVkFLR0xvSURx?=
 =?utf-8?B?S0xpcDdvSTlvOTdBQTNVRGhKa0Nld1pxVStOd2JjVDI1NmdCK3RNQS9iVUJp?=
 =?utf-8?B?cUlPeDA0eEdWa2taby9ERytLcHd0cXhqY3oyK1FIbTFUSE9PdUJJSnVEQjFO?=
 =?utf-8?B?MXBFRHBURHYzRWdZZ2V4eUdnbGxCekRFVW5semxGak1hTGlWNXhCengySjFY?=
 =?utf-8?B?K1lSS08xNXBwbFZraHNKVVdlVXlKRnllQ0IxWGU2Tks5cUJpNmpFZnFVSFVM?=
 =?utf-8?B?R0FHSDRaaXA5ektpenZNYTVSWEU4c3RyTzZaYVFOQ0ZrSnRIUzZoTldPbmRY?=
 =?utf-8?B?OCtpcjhRK01LcUdvQ0Q0emFOWnE5alZUUTdCOGUxUkFaaFArNHl5Z3h3RktS?=
 =?utf-8?Q?3/KTpBvLeB6RsspoKk58C5Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dab0a69-82fd-45d9-cf05-08d997c3b4e0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 14:28:26.1283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dCCt+yd7lau6pvFYJr1D06xALojgyOKzzoZv/Hgk20dDZb/7D25tMUQhGK/ovWgyEgHoRtbGEAPt3vkkBAhVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5178
X-OriginatorOrg: citrix.com

On Fri, Oct 15, 2021 at 08:04:56AM +0200, Jan Beulich wrote:
> On 13.10.2021 15:51, Roger Pau Monné wrote:
> > On Thu, Sep 30, 2021 at 10:52:15AM +0300, Oleksandr Andrushchenko wrote:
> >> --- a/xen/drivers/vpci/header.c
> >> +++ b/xen/drivers/vpci/header.c
> >> @@ -445,6 +445,55 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
> >>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
> >>  }
> >>  
> >> +static int add_bar_handlers(const struct pci_dev *pdev)
> > 
> > Making this const is again misleading IMO, as you end up modifying
> > fields inside the pdev, you get away with it because vpci data is
> > stored in a pointer.
> 
> I think it was me who asked for const to be added in places like this
> one. vpci data hanging off of struct pci_dev is an implementation
> artifact imo, not an unavoidable connection. In principle the vpci
> data corresponding to a physical device could also be looked up using
> e.g. SBDF.

I was considering vPCI part an intrinsic part of the pci_dev, but I
can see you thinking otherwise. We similarly have other pieces of data
hanging off pci_dev, so I think it's hard to tell which ones as fine
to have as part of the struct vs as pointer references.

> Here the intention really is to leave the physical device unchanged;
> that's what the const documents (apart from enforcing).

Ack. I wouldn't have asked for those myself, but as said above I can
see your point.

Regards, Roger.

