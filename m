Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642964AAC9D
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 22:07:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266119.459799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGSGf-0003AI-1F; Sat, 05 Feb 2022 21:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266119.459799; Sat, 05 Feb 2022 21:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGSGe-00037h-UK; Sat, 05 Feb 2022 21:06:48 +0000
Received: by outflank-mailman (input) for mailman id 266119;
 Sat, 05 Feb 2022 21:06:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vIk1=SU=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nGSGc-00037a-Ox
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 21:06:46 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84a6b80a-86c7-11ec-8eb8-a37418f5ba1a;
 Sat, 05 Feb 2022 22:06:44 +0100 (CET)
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
X-Inumbo-ID: 84a6b80a-86c7-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644095204;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bBcNgdzqaIV25K+0a8PQTba+I3Zfq0Gy/TP+peWPSvE=;
  b=M4cIoGZZvrlXN0fM7p0H/O1XEg7wYDmD4LOlFpYgXGpRxj0p5Rt4VXmA
   EtNWQJJJLwiJxyDzkelR3ztpTp9KmRLYTPiA+P6o6W4ybi+bIKKfyHyaJ
   4kFQtjPfA7uHfFEHX9i4IKS9pQdVMOe6DyJU66+jnitVvlbYgHJuzLZjZ
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: U0iOjcFc4Bq0eNLUcwwYIhfO+R3SSl33MRcxtvQX/0XT8ojPcNCmk6NvI4jQyIZH8sCyUFDukC
 GcC2Z5OFgCQruybd1BP+6I5lqkFZECzcJDHPoPN58FM9RM4vtA/KDd0D+YHkW/PTDLG+RjClCD
 glayBs7GrSJRQeDJsaCs/rCX4V62+fvNALrQov7lAToLkpO6pf9NkH/1u88AeRd4fwii6IRkEY
 zI0ZeEM2ugEnYzxXgd3BuJFFlQ1FU7O3zEkkOJfaj/kUeRrIlnM1bWsHLlMXqcrolSCtmJK3YM
 DoJ5L3ZA8bdqetUINh97mJpB
X-SBRS: 5.1
X-MesageID: 63979404
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LhB3daNrPuTJtl/vrR1HkMFynXyQoLVcMsEvi/4bfWQNrUol1GQGx
 jFKUGDUMvaOM2Gge4x3Pt+yoEoGv5aDm4A1Swto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500o+w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxuik4poz
 thria2Pd1YpA4H2scEXYxYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsZhgd4sIY/HIYUbs2lIxjDFF/c2B5vERs0m4PcGh2Zv15wWQZ4yY
 eIWeAJ0cy/wZSdjeWZLNag/uduommfWJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ1NRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiFCvskQFXdd2L9wF1lCN94buyiOTNmdRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARBodtvxor6p5
 yBspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/IdgIuG4heh81Yq7onAMFh
 meJ5Gu9A7cIZBOXgVJfOdrtW6zGM4C8fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP+eTFPha9F+xaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/q9JKfQtUfCRkWfgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMxiPsZvjAsRyq2wVJyspMQr60nQve9/3vqwea4E2bf8s8+k6lax4S
 PwMesOhBPVTS2uYp2RBPMel9IEyJg62gQ+uPja+ZGRtdZBXWAGUqMTveRHi9XdSA3Pv59c+u
 bCpyijSXYEHG1Z5FM/TZf/2lwGxsHERlfhcRUzNJtUPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kSrIsEFBbEm/X6aeNGRPbpmfzk5VdVOuofCzGUD+m8quVe
 ugIner3N+cKnQgWvtMkQapr1683+/Dmu6ReklZ/BHzOYlmmVuFgL32B0ZUdv6FB3OYE6w6/W
 0bJ8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8erVS1hWMjmNlDdZfel8P44Sy
 Os8vNIbtl6kgR0wP9fa1i1Z+gxg9JDbv3nLYn3CPLLWtw==
IronPort-HdrOrdr: A9a23:IiY5Lq/L0K/e36izVjtuk+F8db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQwdcdDpAtjkfZtFnaQFr7X5To3SIDUO31HYbb2KjLGSjAEIfheRygcz79
 YYT0ETMqySMbE+t7eB3ODaKadh/DDkytHRuQ629R4EJmsKC52IrT0JcTpzencGHjWubqBJcK
 Z0k/A3wQZIDk5nCfhTaEN1PdTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mHryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczBgNl1mpDr1L8Zqq
 iKn/4SBbU015oXRBDtnfLZ4Xil7N/p0Q679bbXuwq5nSWzfkNENyMIv/MmTvKe0Tt8gDg06t
 M640uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pVVFfAxbZvjX+9Pa1wVB4S0rpXW9
 WGzfuskMp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wuK4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Fqd2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLH3QIwFllu5EU5HHNcjW2By4OScTepGb0oYi6+XgKo
 OOBK4=
X-IronPort-AV: E=Sophos;i="5.88,346,1635220800"; 
   d="scan'208";a="63979404"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RciyYAx32QMF15E4su+ygtpN4ZtLj+EGqjpcl5L6ZwU/hp+LdVfEJXsn3N4JAA254UCZ/Gh4fiB9ulELfHcISvoyoE9qHee/ptMD7vV/UaY8l+iSsvcBEiO0G3XtbbJOAOJjxp+r4+pFDunWaIRxnLTuQs1EuFfXxw9nFcfCJ0yf1dyqAbfyznp+02bMy81/+Fu7B1pE/nf4s+FNFgfBXmxZQDJd1MBCaJVN6fGEn+Dwoo0bwtPjkGeR9/HiA0/cRzAy6gNKsvmQtk6AyDr9Tb/F/zl4CX6zEOU0Zb/IJ4ciAkRIyoMa2ddUL7BdIzpmFjmsbKzIzZBVN7ueGt+VYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBcNgdzqaIV25K+0a8PQTba+I3Zfq0Gy/TP+peWPSvE=;
 b=k2U93ROcZipFt3yij51V2+PAQVXYppZmjTWgOae8pPZ1aOcx4RFZ+16xmvaPAUAXgdy82Hjs3EEPcucnC6lxtiqcc+FpxENHvcpCRvAesUvRtkfiijMwpA1SC1v0dPN/jOJcH/54aZXsgnBpOzpmtmYgM4qGKG89sW+ND/F7OYJKgzGA8tNtJ0aSOHRodDNT8ZtBQGdNGwKWrxeZSzgC1So56Fh/NTXVmAECXuDbsN3ZbMrQj49al/YeEE/o92GrpV80oFmsU5Cqp+zF/KrgjEwmXjmIHYXIdEK/J3q/dz0+PuLjsSN6x07cAX5P54I92+41TRR9/JVMBxWlpCLUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBcNgdzqaIV25K+0a8PQTba+I3Zfq0Gy/TP+peWPSvE=;
 b=mtFRoIiMhwEQJEMsG4RLipHuacUZ4R+QtZhoWxOhzWjDHNg3aloKLKXm4MmkDEAzkRiHVJ+WOfSraTmHApiZxakxDK/sCQP1pCVYRR0NzPITRQw+zEdiTHPsdfeJBOCswEKKgPZsaBFGC43KNSyEsLSgfeUJeLeXdjejETAmsO0=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH 05/16] x86/mm: move guest_physmap_{add,remove}_page()
Thread-Topic: [PATCH 05/16] x86/mm: move guest_physmap_{add,remove}_page()
Thread-Index: AQHXcbfpNpZFZZE1mEO1hN8seL+XRKyGxRaA
Date: Sat, 5 Feb 2022 21:06:38 +0000
Message-ID: <E3A90AE4-1325-49C6-B043-2CBFF1F6F273@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <3636b781-d84e-6e95-6bb8-bc6a7c596912@suse.com>
In-Reply-To: <3636b781-d84e-6e95-6bb8-bc6a7c596912@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da6df83d-8312-433e-914f-08d9e8eb6670
x-ms-traffictypediagnostic: BN7PR03MB4388:EE_
x-microsoft-antispam-prvs: <BN7PR03MB4388ED62DC74A4AC30FB260A992A9@BN7PR03MB4388.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oYCOPmesQBQJnTGPpi5pztYoCg2/LkgtiFJdczDsQyFAuqckGyPVX5XBYzHEpINGd7ITxNTH1TEa34/zM9NtHmFvIcMrq/8j5wG0SCnU37K+LSPD4ZWyIQKFytKYXwDH/ma5z5vrq38rF/IMtAC0PuPMbuIxovsDHzGLdj9m9a2pMV+oXpJzdX7YYgqC39fSJCgqBZDcKRS3PAP6ffuyILl1XSmUF3g5CmXyOGMUuo7fFTlZccprIq7fLz0hHTZ3q1mnqmfGPm4i4apDN/T5aPFQO0crYFQ+TK+wNYH1noFuKV/BaV+6ug0LKsG9iAcpds7kN4rKRi5lrf10aZnjG3NYHU5alMtm+yRYPKWt7ZoIIfiORrpSFcy3hI06D6GQjSxH4C6SdzfxBBo4BJ1Js7mxVvVql0GDGeUBC0WvCpUqdCdHIHpQc2mzaFiJPFYuP7knrx8a3PEb8HmWQV7SXFdAcx7/hAyxEdAjHkHfR3T7ANpQRmfFaiKvCLU4DXg6+b3nrc+r8RKiF7kJ7UcoaMq6NQSQi9bk+JiWkcWHUsDI0aLpWXHlTPdy6OydrttWOhzrqJcg5KXCmgGG7Qbx9lZTU5iv/fMWe2qY7yh0murSbxOR9XaDT35lOVGq5f/MaoH+ZilPWX+HGB29HVElpPfSTL1f0tQ68FDrzSHMoI3KWv2jP3uKAoITDLWoMfn5qSaa8t6COex0lo5ekRYOqUhmZ2LI3sYGkDSWIY1WAWTIZBgWwlAQORDPHHFki8U+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(186003)(86362001)(66476007)(8936002)(38100700002)(107886003)(66556008)(66946007)(76116006)(4326008)(82960400001)(508600001)(33656002)(6916009)(6486002)(64756008)(54906003)(2616005)(66446008)(316002)(91956017)(71200400001)(8676002)(2906002)(6506007)(6512007)(53546011)(122000001)(5660300002)(4744005)(38070700005)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3Ckks0KUxotlKq7uNOLV5WucSXkJm30nlL5IyY4o3pK57o7diUvqEA0zsh2H?=
 =?us-ascii?Q?UBeinALvE4Oq0iI3ytKjiXEJYutYhkMyzLnTvwPlDCVcwslDtHUTmybeUorZ?=
 =?us-ascii?Q?uXZrOlcc/iL2M504c6bneew80COGJ//Gt9HFswxnc0iJcY5mZ/Jv6y72toDG?=
 =?us-ascii?Q?xrL6z52x2++x/vcq0Jc6oSBSdBB/cOO1pCmMMTNrvGGNNbEZD/3hHewWBGRb?=
 =?us-ascii?Q?OE0bymQz3EeCSIC2du7h1Z+Vopz5h+8LgR+8+4eFu5dJKoCWexF/Brj7UpTe?=
 =?us-ascii?Q?CZ26V0hM93jGPTFSw8NCR/+l1pqJPc7ZKrI0k36R4mLEZ44TwygKvHojn4Gx?=
 =?us-ascii?Q?4eFgPBqGPq54DisOUaDy7V+qgloXEX+QfGKgrIe7tHBWOeIRRqghf2VZ5KuX?=
 =?us-ascii?Q?E6nHv1NUa3m/QxDAaBDaRBxewaEyTbrw739sgVdawyalZj7VB2xcSTubI1h6?=
 =?us-ascii?Q?HNlEeDt0XG+POGW1bwcoiWvcF3ziwdir2bWFrbgPHi7lV6tkrTYiBVUJeXSk?=
 =?us-ascii?Q?q79amLVNyDGkPDbacffBaAGXrRhitSCJ9tOE+el8bjA2DoWwpMUhMISj44rT?=
 =?us-ascii?Q?qncsilxLpdb1J6eLdM8RGIrsbXlDqTD+xyC/Iun1Dd9haXasU8+Ysbk4XBsE?=
 =?us-ascii?Q?yGhSVbrj7tucBfNPUKjQHTzfIJBit/sEwQd3Df3iXNlzGhUeiSBJzPhMoZ0b?=
 =?us-ascii?Q?OxspnFahhQXyBMHwum5NZqTMQyJXY6CGorNSP3aS9F5NTaBeFDNzBMElP0F1?=
 =?us-ascii?Q?gBoVCnbbiflZsrvK3MJSzEe8mpLon5QfF/1U8B/qFLbimfe5yMEi1S+406JY?=
 =?us-ascii?Q?JqalZkEcEjBePZU7EbYryLauGiJZWL1DXLLJZYOFe9qsZqMTth31TmyUHn++?=
 =?us-ascii?Q?Iw/t7WDOs3tMmIIDsUSJme4JrQigMaMPoBn7hdLBr52KMB3oc06ErOJqNX35?=
 =?us-ascii?Q?SVge66g+3cbdBQaBZN1AeVN9S6nzIexMrac8gcvyO/Gm6q7MlG6iF71roG3k?=
 =?us-ascii?Q?l6LyiQlQKKfOFqc2AO/8smZJVAtpInkfts/faJFNUT1mggf0aO69n72grPyg?=
 =?us-ascii?Q?Yu0FMmDSW8tdsyQ7je6bKcwi5A+MNbQeirvHNjSGD26kXsAI8YTXyvwx1H+i?=
 =?us-ascii?Q?WTHmXK6Oq16oIHSV2u6kIFtV73E8HHrnCk9sjn9ETPAIjjlCs6mhsr7sY8ma?=
 =?us-ascii?Q?KQVKcs3V1jGWc2lCWk9Nxb/0FbeTrC5Cc8FR2WR6ocH3B0wJR24wzOhz+Nyd?=
 =?us-ascii?Q?Lg0iKGap5o2xaVSbatqs0Z273OlOo69RPWpsKuK1f1Gm92zguy8e5Ry9OZwa?=
 =?us-ascii?Q?e6PlzuGyFwVFUC8he7Xneg8XM1Ia/yF5TaZLEtSayC6FDtKNJ/MlwjRh9UOq?=
 =?us-ascii?Q?br75m9erBjkuxTRJ/drOyWxDtyFbBVck66tmI8i+8xo0Fu7nV9AzMjxUxH+3?=
 =?us-ascii?Q?Z7ovOTk5AQDxDGYxNGzzTBhgzXe5/reTeioIKkDN3CoouuRTHUhxIY2thYYf?=
 =?us-ascii?Q?S1XrmnQgm4NTJsomxhJGEzZRSzI+x7h7rMCnEs+S7j2WH4OmR0wL56qEfU/e?=
 =?us-ascii?Q?9Z2+zigcYeTk5AGj6JAxtBhOAIl0L1+ZLzBlKFtwva/piuzF0EO6TsfmE6/9?=
 =?us-ascii?Q?yjlg3T61VFDEcV1HvThr0/zkR0QAkc4dJeAEFIBOOeCdl/zeB1NWX2tjJlAj?=
 =?us-ascii?Q?I2q9jcS4Iix3hAN/nZqAlYIkUz0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B8735DF42A121D4597793C3C5C145780@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da6df83d-8312-433e-914f-08d9e8eb6670
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2022 21:06:38.1216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PET/MKuNPXdcMZp6t7yOEY0WiPkTxsg+X8dnsk2q79pGGRlJqKK9bsolXpK7PZM6/kaI2+Xaq0NTUC3M1BFOFjSQW7jMVbALP0kp4oGPW1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4388
X-OriginatorOrg: citrix.com



> On Jul 5, 2021, at 5:07 PM, Jan Beulich <JBeulich@suse.com> wrote:
>=20
> ... to a new file, separating the functions from their HVM-specific
> backing ones, themselves only dealing with the non-translated case.
>=20
> To avoid having a new CONFIG_HVM conditional in there, do away with
> the inline placeholder.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


