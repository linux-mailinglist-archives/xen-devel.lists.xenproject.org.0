Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FF34B22C4
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 11:07:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270271.464501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nISpP-0003km-Lt; Fri, 11 Feb 2022 10:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270271.464501; Fri, 11 Feb 2022 10:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nISpP-0003ha-IN; Fri, 11 Feb 2022 10:06:59 +0000
Received: by outflank-mailman (input) for mailman id 270271;
 Fri, 11 Feb 2022 10:06:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JgwB=S2=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nISpO-0003hM-CN
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 10:06:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56b98864-8b22-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 11:06:56 +0100 (CET)
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
X-Inumbo-ID: 56b98864-8b22-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644574016;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=n7pQDiOy8SYXQFImR2ih146+tHBRFjraEgjdFyik4Fo=;
  b=PnQ8woPX1pqRhvqLt58zR90ZIHuG8CTP8NxRELcoWpMvimUGWN6bRC10
   /fFulrOWgYgc3AbgXCY0N9+QhAj3FSQi4D1cJNFQTgKfbvA6FOjP7d57e
   Yfj718dglZkCIo5hPg62CfptisnrUnl2h9p5k3SJBCdA2QjwJdvsFSWdF
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Y3bTxsiFgpn0CXMgYdzu6Juq1t8POL6vS/yoWJ73+/f1etkd5Q/PcVEBEukbCn2Y0d5p4BJlRd
 AxhkSgN170O50A0mEmHQFGVuVOUin/r5s9ql9HDJtO2xuTEZra3jQ4OrqFSmLKkbpmZeeqzYHE
 7eMoxj25dQ29nbGD+WH/tA07Kmy5YcnM/jF7FyEw2Iyos5ix7r9BcljN/c9fFyum09rlji9U+N
 cQ3pzZW/Klf+Qf78gmNyIIWym1tAxONNDv90zh8y8F8hMbBDQwbySoLqDLsd+ODWutQ0MYsnl5
 36nhvyOfa6NaLrlbamtdPq7G
X-SBRS: 5.1
X-MesageID: 66227615
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DO4FmK41G3w56Sm8jNS5IwxRtEXBchMFZxGqfqrLsTDasY5as4F+v
 jdJXzyDOveNZmWnKtl2bNu+8UxUupDUmIdgTwBvpCozHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj29cw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zj
 4sXk8KuFFoTBI7rsb4mDl5SMghjMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALDsDtMcU6s3VpyTjfAN4tQIzZQrWM7thdtNs1rp4QR6yBO
 ZNEAdZpRBTfUjFwGVgrMZYjo/eM23LAVWIHqnvA8MLb5ECMlVcsgdABKuH9RNuOQslEm1eCk
 UjP9W/5HxIyOcSWzHyO9XfErvTUgSrxVYYWFbu53v1nmluewioUEhJ+fVG2u+Wjg0iyHddWM
 VUJ+zEGpLI3skesS7HVXBCmoXjCoh8VXfJRFfE37EeGza+8ywSEAC4CRz1Iat0jvec3QyAn0
 hmCmNaBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kbjBjCU9JiG66dlcDuFHf7x
 DXihDc6r6Uei4gMzarT1VLahzOhoLDZQwhz4R/YNkqn4Rl+f5WNfJGz5B7Q6vMoEWqCZgDf5
 j5ewZHYtb1QS8HW/MCQfAkTNPb3vdDbLmCBu2RMOLB7zGnq8V+KYI8FtVmSO3xVGsoDfDboZ
 mratgVQ+IJfMROWUENnX26iI590lPa9TLwJQtiRN4MTOcYpKGdr6QkzPRb44oz7rKQ7fUjT0
 7+/eN3kM3sVAL8PINGeF7ZEiu9DKszTKAruqXHHI/aPjOL2iJ29E+5t3L6yggYRtvLsTOL9q
 Yg3Cidy408DONASmwGOmWLpEXgELGIgGbf9oNFNe+iIL2JOQT99V6KLnOx+IdE8x8y5c9skG
 FnnCye0L3Kl2xX6xfiiMCg/ONsDo74jxZ7EAcDcFQnxgCVyCWpexKwea4E2bdEaGB9LlpZJo
 w0+U5zYWJxnE22fkxxENMWVhNEyJXyD2FPVVwL4MWdXQnKVb1GQkjMSVlC0r3dm4+venZZWn
 oBMISuFHcRdF14/UK47qpuHljuMgJTUo8orN2PgKdhPYkT8to9sLi36lPgsJM8Qbx7Ew1OnO
 8y+WH/0fMHB/N049sfnn6eBo9v7GudyBBMCTWLa8ay3JW/R+W/6md1MV+OBfDb8UmLo+fr9O
 bUJnq+kaPBXzkxXt4dcEqpwyf5s7dXYuLIHnB9vG2/Gbgr3B+o4cGWGx8RGqoZE2qRd5VmtQ
 kuK99QDYeeJNcrpHUQ/Pg0gaujfh/gYliOLtaY+IVng5T8x972CCB0AMx6JgS1bDb10LIJ6n
 rtx5J9Is1Sy00N4PMyHgyZY83W3AkYBC6h35IsHBILLixYwzg0Qa5LrFSKrsoqEbM9BMxd2L
 2bM1rbCnblV2mHLb2E3SSrWxeNYiJkD5EJKwVsFKwjbk9bJnKZqjhhY8DBxRQVJ1BRXlel0P
 zEzZUFyIKyP+RZuhdRCAD/wS10QWkXB9xyj0UYNmU3YU1KsBz7EI2AKMOqQ+FwUrjBHdT9B8
 bDEkGvoXF4Gpi0qMvfejaK9l8HecA==
IronPort-HdrOrdr: A9a23:atOEqK31EYache9RaEw5AgqjBRFyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/heAV7QZnibhILOFvAi0WKC+UyuJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZm6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngdOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4k/Ez5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXIISaCUmRMXee
 v30lAd1vdImjXsl6aO0ELQMjzboXITArnZuAelaDXY0JfErXkBerV8bMpiA2XkAgwbzYxBOe
 twrhOknosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfVsRCMkjTZo+bo7bWrHAbocYa
 JT5QDnlYJrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRaxx47hd4AYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiHqAaPHDGrYLx/dwOlayXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO6RzJSHXVZ0Wl9iif3ekOhlTRfsuZDcSzciFYryL7mYRuPiTyYY
 fABK5r
X-IronPort-AV: E=Sophos;i="5.88,360,1635220800"; 
   d="scan'208";a="66227615"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5B6Ww7IG7uE2l5E83mypACRsFZgVyAXEKf+i6UxALZlJVPJxZNc5HJassch6+DHwhe1Olc1siemXvo5sK8bZ9SLFW4Zh2hddtEy4Yp5xJ7cqsKgBvFIC8+YRt3S2lAubUrHvMOCqVhyaP0ctYfNGIT8z2isg905uEdgpQYsn/gTCxzFRAD68dlpr0ca4SsDNwktF4P8Q3AtvLIHnZqqH7l7IBfUiDdOvvY/L2nBBRejTVWs7rYJM7fo4Yed5r0H41LGLCm6ScMbg+zO7P26FWh5vdnpJBSHHG526S/Pg4Gai0hge4DjUZSiEc8afXgeaixKbO8EJF/4xYc5fQSk5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7pQDiOy8SYXQFImR2ih146+tHBRFjraEgjdFyik4Fo=;
 b=UFf6IYyuXjSnAJ+hLA2WmlYIqNDjDJN9wYJdT8rLjJpMRMwywAybwW6oE5BuTAREg/I2iVIhx562EXgCoozuldSKiGHSJINtaHElPW8hFxHlq5jLVCaY4k2prhW1Fj6uu54IevREe49zJie529PJTqbNPtdotMDLRpUe0zX4t1R96AVGjPFgSsl7nZiTgQBLf0qwZm7UgCAx/ahjjp1pAZHM3CzAsRzWkjdV7e1m40ulp6M3zQWvf8R2+ZizkpnKmYElEhwOtGiMFncw6TAorgKLR43zOtJU1jeHFNp7U1TU0CGl38pCjMQAc4CAWN+MsWe3a6/zfmteIRjfV0k/ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7pQDiOy8SYXQFImR2ih146+tHBRFjraEgjdFyik4Fo=;
 b=O5MNZz/ATX5uupN6rZSwMJlRaal18KaAxYYV8dSoLyNZIel6koUAqLH47IZyEWH+MjKzeDCZjCLO5nAnfkSzP2bQkbrR9p+ZuSf7KZEYWXvE3OGdNcz4Rl7JWSrEhI9y7oGNNrnnSVhZEf1U289LQqfTkux8r0GK7cagnnuXLrY=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYHE+TdJl64aH33EedeR0PZ4zblKyMkj6AgAGTLwA=
Date: Fri, 11 Feb 2022 10:06:48 +0000
Message-ID: <dff9c5c0-7bee-ce0d-3288-91255a701c99@citrix.com>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-2-jane.malalane@citrix.com>
 <YgTi6bzeojtcu0xL@Air-de-Roger>
In-Reply-To: <YgTi6bzeojtcu0xL@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5817aba1-0bec-4454-baa5-08d9ed4637bc
x-ms-traffictypediagnostic: BYAPR03MB4870:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <BYAPR03MB4870C3502A6DB7CF6DBB011881309@BYAPR03MB4870.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gBahJt30VqlxGhh613xPuCnAUQ/j9PgI1NSWq+yk3SwbBSOm1q3PDewPbdY25JDdrOWVK76CKMJ36850D9xfQqjjyi+v5rmRmnO8RUGtN7spt7M7smr5fobKhWZmmu6c+LbtGW4J3iDQRufuEtngK0rziCD5cjAnpMsBNTeJ3xEY9EryoSmQtCiv2riTyq11WtXMqR3AmbUsBI/R8Wt/6MDi8mdedIXBz7MRYGwvKjJvTbwDVPfwdihkfH1W6p2pY7//euUMRIoP3DIBsNl7aBAV2I7kPTcXAnzbBf+vUjUsJYx7TgUkD3Oid9ATMPyHTdWV3buk6CoN9pI+Vutv07c8I9Zi4xm1xh2MRTsdgruHPpvckzPIRqleYj2IzLXqql1qlrCabyjTDF3kRtzyvGiR/u1deoYoQXDpSzj6+VUS2yqKueVBb+RvL7KMqxhpZtwIwcg8mhQ5ad+fMmwIrpUq1z9t21Tw32tW0fIEV+le+CAxGyKLJk08Jyc0sNDa+jYIvsOSgB5jW0vv1NDDfDfMaOfmP5VQnPWAtn+xnZdOLHn9ry3aff8viGXbcHi2qlJvHANt9sXXsN53eOdlTO+N9QmFVKs8YhfKzcr0vITaayW5Zn5qPjeFy/T+dz6Sso0ZYV91CCvgwhmOszvc7r1Oikl+/ynW27sBkDhxrhA8i86I0bRf0d9yQTRKjtdqWxpAco3iahexcAuDiJ5otemmzUe3H7WwB9l1+al36vIzkMZQQXWO/KUIOTL5AQsZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(83380400001)(508600001)(31686004)(53546011)(36756003)(26005)(6512007)(186003)(31696002)(2616005)(7416002)(66556008)(38100700002)(6636002)(8936002)(316002)(110136005)(38070700005)(122000001)(54906003)(8676002)(2906002)(86362001)(66476007)(5660300002)(76116006)(66946007)(91956017)(6486002)(71200400001)(4326008)(66446008)(82960400001)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmpjYnJmS2dzN0UwcUZ5Z3lHa1dLOUF4VDAwWHhYWjhWN0kyMGNoM0pmVlBR?=
 =?utf-8?B?NjNkL291K2o4R2NEc2lSeVJvNVM0OEYwOXVnVnNUZUV1Tisrdm9PS01peVNJ?=
 =?utf-8?B?dGJicTFHRDlHOXBtUWxQQzhpbmswdFRuYUFkUGdtaWxxOW5HdGFIN2I1NkRO?=
 =?utf-8?B?OC9SUkV3M3orUWd3WG1zTERMV2tNZ1pYNGxaOGJuVUhpUTA0dkJDYmJ1VFpq?=
 =?utf-8?B?d3VZM0hycU54SFNtcDJabUZickdscEluZUU1K291YXVrcHEveTZSOFJ6TGRM?=
 =?utf-8?B?czlFUnk1elZabE9GaGZwZFVKVHpSalVsV0cwTHlBMGZRQnFhN0Q4RW5jWlpO?=
 =?utf-8?B?TUVMUHRSbmVtaUJlVkxuVnYzb1phNFkxRjN3Y3ZXZHYreUFlc0JGb3lyZjhH?=
 =?utf-8?B?STVRK01zdVRQaFVUdG5LSndlaTF2Y1Vtb1RvWVorSDJHdUNvUE9KUzM0VEow?=
 =?utf-8?B?UzNHaUsvS0RpZ1FPL21lWUt2WHJ0RmE4aUtmWXlSNjJnME1PczJrSlZCSG5K?=
 =?utf-8?B?RmVjb3ZxYmNXWjZUZnlBdVl1OVZBZmNvK2puLzI3V1AybTJLQjdvaTRiSjlw?=
 =?utf-8?B?OEVIUDJyUFpoa2gveExvblNGUHJ1a3l6SGFKVjk3Sm1iT2sybEJ1VVFQNHBi?=
 =?utf-8?B?U2Z0RUZjSVFCZ0QzNGFJRlRmajJEUGhFeW43WXZxQTg3dk5LVHJ6SCtJYTE3?=
 =?utf-8?B?U1FMcEowU0JOYXhkSWhXUGI2dTBwcC9zeE9Gd0thclBKRCtqNktaZW9lQlFC?=
 =?utf-8?B?dkxEZks3bllpV0syQVBsWVl2Sldyd1J1THpxbmxVaUU4aGxoVE1pQ01CV3ZH?=
 =?utf-8?B?Z2h5VVFlaEFTRG40S3EreXR5SktjVVBEbEo4b2dzOXhvZWM4RnkxWEJYTWZy?=
 =?utf-8?B?clBIVHZOdUhwdkJQQ0VMVGdEYVdlRmgxWmdCUG9qbytRSTRHcEp2SEZadlRl?=
 =?utf-8?B?eHdha3dtTTZJeGhHN1owOTVrNDNRVVR1YlpUUFRaMU1Gb0NiQWg0bnBFWDE3?=
 =?utf-8?B?SUlNN09aVVZ2NmwwZks3QUhuZTRMM2JPNDd5cUl3S2pGSHA2dXNCSHVPM24z?=
 =?utf-8?B?dTRJT0RhYXRhdDk3Q1JFR2dyUkE2cllpVEZpdUdqaWxJamdXK0FlUWdSSzFK?=
 =?utf-8?B?UDg1Znc2TXdualE4YmRPNFFlSXhqRVN3NmhqVTB4MFY2K3ZPSjdWd1NpamdI?=
 =?utf-8?B?bi92M0ppYzd3U0xCdGZPRjdOOTk4QnlWVExrYndsM2lJQVlJWDRCVGtHcVJx?=
 =?utf-8?B?em1sZ1ExUGVHTVN1MDRQbEhqK3FPbUdsUkRkYUx0VHJRZUwvbHR3Qi9GYnJK?=
 =?utf-8?B?OEVVWnlUZGlvWFhwa1VtMDJjVFZlWnh1S2szd3ZBODVOYmJmSGVmUytzTE00?=
 =?utf-8?B?UWZzQ2txZGVKcXgzM051c1U3a0VZb1NqVFhnK1JBMVlJcEtnZEZQUTg0eE5Z?=
 =?utf-8?B?bGVWOG1VeGxobUJIUmJReUVqWVVxbnRiczNLTjlGVmVWWCtwU0xhZENxYVBV?=
 =?utf-8?B?N1AyZk9MQjAxUFEyT0wzckROWlp4TDgyT2w0ZSt2djE0ZkNXNVJJSDBOcVFV?=
 =?utf-8?B?elpwZG5SV0hQTUFyQ1l4Y2F2QURwdllPQ1IwSUJadEkxc09mYkFTcmt4S2Rm?=
 =?utf-8?B?Z1NxUWNFckdlNWw3UzA3Wk9zTDZ2VWJpallEY3dIVElwRTBpazV3V2R6NFFp?=
 =?utf-8?B?WlQyY3NSN0NhcmpxVmhuYkpzMU5hWkR5NmJFVjR5TkNUM0tyRU9lWXdOTUg2?=
 =?utf-8?B?di9mbGdRWE82VXV5MERLOWw5a0lINjFJUURONjlOQlYxYUdHeFpOOFFFSlhk?=
 =?utf-8?B?S0FpRjBWa0VaSWl6UDZTcW9VcDVOZmUxWE1LNVJ5QUVtbUZxQVQwTmJ3Tk4y?=
 =?utf-8?B?WGpxbEdhbEtQSG9ZampnQnVlUnh2QU1jZU9ScHI5SlhtWngyU3I5TzB0VUxE?=
 =?utf-8?B?TkRielBGRWVESmYrNlhQd2FyWXRuNjVXUXhYSmU4bkNUWUhORitFcnRwMWRj?=
 =?utf-8?B?c2swT2xrN2J6NGlOdUIvNXdKSmZSMWNlOVNoRytyR2JqSFdjVWQ5NGFPeTJD?=
 =?utf-8?B?N2o1b3BmazRRclBDR0NvQkdTWUhxT29wY3dZUEliTGhDQk1mZFhGYXkwem0x?=
 =?utf-8?B?NS9CVzRvZmtOa0pDcU5xYUdseGdZTHE1RjhRWGJGWGRkajJvcVNBSnAwK3gr?=
 =?utf-8?B?NExMVXJjelEvQWRYVklvbThIK1ZWR0cyb0xwSS8rZk1zbVE5VE1YSjdKZGJq?=
 =?utf-8?Q?StpJ6xUPFevD4Hsi+wgngAiAR1HOuJt9dVWY2teJts=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63DE51BE07CFA34AA168BED1E55DB0F5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5817aba1-0bec-4454-baa5-08d9ed4637bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 10:06:48.6370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UPxkwL6D/P+hSz1/Zib6i13XoYaySkSt9ioF4VEvZkj9+O/MwxDygP2GOTxQED8EvHt1rMl8EWxulF7cyyFpUeY6IrmXRkoTClwJyvOurJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4870
X-OriginatorOrg: citrix.com

T24gMTAvMDIvMjAyMiAxMDowMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gTW9uLCBG
ZWIgMDcsIDIwMjIgYXQgMDY6MjE6MDBQTSArMDAwMCwgSmFuZSBNYWxhbGFuZSB3cm90ZToNCj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMgYi94ZW4vYXJjaC94ODYv
aHZtL3ZteC92bWNzLmMNCj4+IGluZGV4IDdhYjE1ZTA3YTAuLjQwNjBhZWYxYmQgMTAwNjQ0DQo+
PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9odm0vdm14L3ZtY3MuYw0KPj4gQEAgLTM0Myw2ICszNDMsMTUgQEAgc3RhdGljIGludCB2bXhf
aW5pdF92bWNzX2NvbmZpZyhib29sIGJzcCkNCj4+ICAgICAgICAgICAgICAgTVNSX0lBMzJfVk1Y
X1BST0NCQVNFRF9DVExTMiwgJm1pc21hdGNoKTsNCj4+ICAgICAgIH0NCj4+ICAgDQo+PiArICAg
IC8qIENoZWNrIHdoZXRoZXIgaGFyZHdhcmUgc3VwcG9ydHMgYWNjZWxlcmF0ZWQgeGFwaWMgYW5k
IHgyYXBpYy4gKi8NCj4+ICsgICAgaWYgKCBic3AgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBh
c3Npc3RlZF94YXBpY19hdmFpbGFibGUgPSBjcHVfaGFzX3ZteF92aXJ0dWFsaXplX2FwaWNfYWNj
ZXNzZXM7DQo+PiArICAgICAgICBhc3Npc3RlZF94MmFwaWNfYXZhaWxhYmxlID0gKGNwdV9oYXNf
dm14X2FwaWNfcmVnX3ZpcnQgfHwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY3B1X2hhc192bXhfdmlydHVhbF9pbnRyX2RlbGl2ZXJ5KSAmJg0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwdV9oYXNfdm14X3ZpcnR1YWxpemVfeDJhcGlj
X21vZGU7DQo+IA0KPiBJJ3ZlIGJlZW4gdGhpbmsgYWJvdXQgdGhpcywgYW5kIGl0IHNlZW1zIGtp
bmQgb2YgYXN5bW1ldHJpYyB0aGF0IGZvcg0KPiB4QVBJQyBtb2RlIHdlIHJlcG9ydCBodyBhc3Np
c3RlZCBzdXBwb3J0IG9ubHkgd2l0aA0KPiB2aXJ0dWFsaXplX2FwaWNfYWNjZXNzZXMgYXZhaWxh
YmxlLCB3aGlsZSBmb3IgeDJBUElDIHdlIHJlcXVpcmUNCj4gdmlydHVhbGl6ZV94MmFwaWNfbW9k
ZSBwbHVzIGVpdGhlciBhcGljX3JlZ192aXJ0IG9yDQo+IHZpcnR1YWxfaW50cl9kZWxpdmVyeS4N
Cj4gDQo+IEkgdGhpbmsgd2UgbGlrZWx5IG5lZWQgdG8gYmUgbW9yZSBjb25zaXN0ZW50IGhlcmUs
IGFuZCByZXBvcnQgaHcNCj4gYXNzaXN0ZWQgeDJBUElDIHN1cHBvcnQgYXMgbG9uZyBhcyB2aXJ0
dWFsaXplX3gyYXBpY19tb2RlIGlzDQo+IGF2YWlsYWJsZS4NCj4gDQo+IFRoaXMgd2lsbCBsaWtl
bHkgaGF2ZSBzb21lIGVmZmVjdCBvbiBwYXRjaCAyIGFsc28sIGFzIHlvdSB3aWxsIGhhdmUgdG8N
Cj4gYWRqdXN0IHZteF92bGFwaWNfbXNyX2NoYW5nZWQuDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0K
DQpBbnkgb3RoZXIgdGhvdWdodHMgb24gdGhpcz8gQXMgb24gb25lIGhhbmQgaXQgaXMgYXN5bW1l
dHJpYyBidXQgYWxzbyANCnRoZXJlIGlzbid0IG11Y2ggYXNzaXN0YW5jZSB3aXRoIG9ubHkgdmly
dHVhbGl6ZV94MmFwaWNfbW9kZSBzZXQgYXMsIGluIA0KdGhpcyBjYXNlLCBhIFZNIGV4aXQgd2ls
bCBiZSBhdm9pZGVkIG9ubHkgd2hlbiB0cnlpbmcgdG8gYWNjZXNzIHRoZSBUUFIgDQpyZWdpc3Rl
ci4NCg0KVGhhbmtzLA0KDQpKYW5lLg==

