Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366A749D629
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 00:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261123.451780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCrkj-0001YK-9x; Wed, 26 Jan 2022 23:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261123.451780; Wed, 26 Jan 2022 23:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCrkj-0001Vl-6e; Wed, 26 Jan 2022 23:31:01 +0000
Received: by outflank-mailman (input) for mailman id 261123;
 Wed, 26 Jan 2022 23:30:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCrkh-0001Vf-9W
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 23:30:59 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 021d2c89-7f00-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 00:30:57 +0100 (CET)
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
X-Inumbo-ID: 021d2c89-7f00-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643239856;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=b7qGjUtkWUNkEPjMZRwwEk327kJmGLqbfISdAUSYC3c=;
  b=HHnb/uKnDa5subNkdDC1r4YnwwrNmzOERA0LpEi9gm1pBupwLJCTnGc9
   jLcisbRWSIaZbJlFXVoRpJb47XT2e+jFFxp7E0YQ54bK5K4DB8oQSa/4f
   wVP4bnX7DBXKgdIQJsfMKnA8GET2/4UjZIbqwiUc1+9DA2NFhHRh6SiyK
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: o4DOjTXEmOkR5cbhZ+DxJ8Snv/9Hfh4LdC2jYFdwqP/CFetW4Pvl57D/rk2Y+BwliWlAKDbCJb
 cwc5lSbqlhRjmSpAYZENDPmY17amUXsQX7946lXzgPja2zfWgZVpIRyP4WnBL7qS5Ly7aM2UG0
 B6VGfTYgN0QlZAumQCTguRaOxsrRLIO9M9HfQacxxadq7aOK9Lz1w1zOpcKL7FDxAXgLnu/mKa
 UdVyRBWB0Stbq/IqEZW2hovnCga1uY6wjmKvJYyBXAFg0cXvtsA5ezmf7ChRZU2LmYcrMcQPWa
 EVTk0MRR4oslraQZPT/RqL86
X-SBRS: 5.2
X-MesageID: 62765349
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MBDSRa+FzeC7dFqBKe/TDrUDbXmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 WNNWGzSPPeKMGKjLdpyOduz9kIO75eHzNA3GgJkqC08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj3NYz6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhSj
 /9M7oKBbT4FGf3Fp+s9cj1/EwphaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4UQqiDP
 JZIAdZpRC2cWT8UAX5GMZgzoeKHr2vuchpD9V3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0eJ16ErYk2SW05o2E6jmWJkkgaT5qd4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb5NuRECnCBtJ6sybp1qHHb7
 RDofODFtIgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0lfRw0bJpYJG+2C
 KM2he+3zMUCVJdNRfQvC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmD2PLbimkUXP+efONRa9FOZeWHPTP79R0U9xiFiPm
 zqpH5HUm0w3vSyXSnS/zLP/2nhTfSFkXsin8pIOHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu0NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:T5IJdaB5u8ScWXblHegIsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPEfP+UsssHFJo6HkBEEZKUmsu6KdkrNhQYtKOzOW+VdATbsSorcKpgePJ8SQzJ8l6U
 4NSdkcNDS0NykBsS+Y2nj5Lz9D+qj+zEnAv463pB0NLT2CKZsQlDuRYjzrSHGeLzM2YabRYa
 DsgPav0ADQHkj/AP7LZEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZgzU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUiZ1TChkFxnAic0idsrD
 D+mWZnAy210QKJQoiBm2qo5+An6kd315at8y7CvZKpm72HeNtzMbs+uWseSGqF16NohqAN7E
 oAtVjpxqZ/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh57D30XklWKvoJhiKo7zP0d
 MeeP309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv0kso5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHrYkd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MSyAtPTWu7djDrRCy8/BrYvQQFq+oQoV4ridSt0kc7jmZ8
 o=
X-IronPort-AV: E=Sophos;i="5.88,319,1635220800"; 
   d="scan'208";a="62765349"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlLNwJoqXld7SUZrmt5buCsxnPAICB1YwHPX9k17HfFEAZNvCOQ2e+O/scMfxZvPF6B9UgQC0v8n+g+0SgK9DNj5rjtyES78gDe33XGFmmhMyaPqwBGFej/Ofut9+0UlAXgd5V3csiXoyZWoQ2lQvXziwCmqcJzh27WjUcWQ3vRlV4PFWv5nezk+FZ2UBVw6x9gqjPlqSxFyI/7qcwJprYAURJAj8krzbFNpMz2yI2gH/srChxjCwMubnhs5t2JTMz4DgMBfco6o9NNwj1iCXQ24PeNjdTBPbBWI7SnhiwN6LtJgZzPHpQaeXnUm9LiCNyAhrzTACdKuBbN517oDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7qGjUtkWUNkEPjMZRwwEk327kJmGLqbfISdAUSYC3c=;
 b=jJt7Z2rxba4/h24OzLUCFmmFuzORMvZJNCreLKhcRfHn3E8ZST0YxX090r61vPfMNbQZ47yDqYP1ZiBcikwWKrCnKbcsIK6AAUx9mQbQTfeprboh9hszvG+WBtiDu3kgabfNQ4rg1sf8bZYsYE6fOPt6i/tsNig/veyXAUeCrR3KtxPX47uuGAYZhXhsvqVU0qEYUOk+rYX0GwXQd7YUNdsLYvChJ6oF6cMGqPAybaY2yVBIne2z3vQg7NcgutALaHGp4+3IaKjWzJWCmX9okYVaaDgrIvWT3jvL31yGkyPV/1ryhxVaU1BAeTiXqnrBwRhSkptGqQjvdLb8VcFLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7qGjUtkWUNkEPjMZRwwEk327kJmGLqbfISdAUSYC3c=;
 b=PcMWu942i1tigbbjWXctbetFYZEWXAB3gaeeSrR6evpYqtMjmLk3JkRQQSdcZVIgUKu8JQUEwcPgQi58+KCdP3dH/gONjyLRLaI88I3WhaasUKnWHtfa0J4M0HTtk8GAzD2q38ol/nOvPRI8MjxPCaXo19O3HYKCTsW88gnLs1I=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] x86/Intel: use CPUID bit to determine PPIN
 availability
Thread-Topic: [PATCH v2 2/2] x86/Intel: use CPUID bit to determine PPIN
 availability
Thread-Index: AQHYDgiCEwv0NK4Rvkyq5oesJ8VOH6x1/WyA
Date: Wed, 26 Jan 2022 23:30:48 +0000
Message-ID: <31121cc4-5980-3e06-89ea-c2268e2ec53f@citrix.com>
References: <64a5a3ac-8f4c-b13d-0b7d-4c4ec15e2721@suse.com>
 <2d13a663-f03e-b1e2-0c38-5dc3282dab10@suse.com>
In-Reply-To: <2d13a663-f03e-b1e2-0c38-5dc3282dab10@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6aebc1f-a843-44b8-ebc9-08d9e123e212
x-ms-traffictypediagnostic: BLAPR03MB5652:EE_
x-microsoft-antispam-prvs: <BLAPR03MB5652735AAE8C2A24DC290D7FBA209@BLAPR03MB5652.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YUSZKOsQRB4XyqyA3w+McNOG2Kt4dyJXP9hVIG65iAY7DY6R26xMVu3q+L8sLAR8LtOstb37+LEsUiKNYsfSn0M81+Ro75YM3ftD28EnHdxs6W9/4o+C4d8n/z1tvEPSw1nCC4PNS7woLxQfhSAONWYyS1CLhamyInjOA4jS9t0pIX7wAtxqY1r4AaDnnSpVcKWZj0ejTVpgC04TjkBaV66TwBRRzji46pVzhWZFPtEjL86JVbK91V4FFSbADhR5wWQj3Jb8XlejQ6cPlBQPf8wazMe3dunnalmayuwkTl3dtWiNTSeIVFES4Q+7Bl0N4mx/oS8Zsjb+ryMg/c2NQ/94tJAEUSSbSVUXonv4bXdmAD2TMw6ZHFcOi/lhZG2NDky84kga4KCfexUGBTbbn68Lz68vUdCi92v7cp6q3uu28R20+dTo6VrVLtV2WwqOeb5wLulYEKkGAIIf9sHkJNVsB/aoit0t1voDsYti7ODmTBUqImSM/Jhl5xKgEmBijLfEd/DmtW2OYNehJU0spszsw7b2Q20sowMaAwzHBFjAuZgUnhrwNqTYEce1wpKuQ9XDxnY5Gvd7w+2pruilEs3bLVfDkufCf03ZIG8mm2wSFJ+jj8ZiGwh/xL/3v0w9kfYwdeP9k17caRukgL271jG3lq/fhPSP1jjIW8enq/bisUrZ6g2V7n3SmWzRyozMwG37nOjEI3aRrboynPMXL1lLYG3bfsVvK8sw/7nwl2qIEdK2CM7YJcZqhGzmNTJHLW7YGTM4EEABxnK8UCPPQQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(107886003)(6486002)(122000001)(508600001)(5660300002)(36756003)(2906002)(31686004)(6512007)(4326008)(66556008)(38100700002)(66476007)(86362001)(110136005)(31696002)(54906003)(91956017)(66946007)(316002)(76116006)(83380400001)(66446008)(8676002)(64756008)(8936002)(71200400001)(2616005)(186003)(26005)(53546011)(6506007)(82960400001)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnB0SDhpMlFkdXhpWGRiOU9lZDNYdS9rSXA1bXJLYkpCRWNFd2NVSHRsSE5O?=
 =?utf-8?B?ZHRmcExtVDlMMGJtbW16Q3RHN05ZTnhKc3V5OHNFTmNGcUJxVzFoVFZoKzBS?=
 =?utf-8?B?SjhTcEtacTEwQXlFQmFMcGNFMUVBWXAwZFcyOE5iRVUvQldPZnpONWhxSFdq?=
 =?utf-8?B?NkVNSE4vWEtrVTM1Z0Vnb29aMGVKT2lDOFZnRm0wQXNKZlN2dEZYYU1JRGV5?=
 =?utf-8?B?OW1jdkVBc2R5WVp2UXdiZnh2N2JwbjU3Z2JYL01QNmdxTWhGQmVrcTFYYWdK?=
 =?utf-8?B?ejB1KzlWWHdtY3lqNFUyZm85Rk5qUG1PRU9JS2hESFBrOTFDY0xHT3U2dU5H?=
 =?utf-8?B?WnVyLzVrOC9TbndwMVJvNUgrZ0ZVYXVHYWk2c1RweFdpZmlJMmtyWWJUQXlK?=
 =?utf-8?B?Y05SUTdnWGoyOHYvSHdFMUZqd1lWZFl4RGxXUDZvNlJYM3FPUXNuUnNnUy8x?=
 =?utf-8?B?UDBjblJWdVRSN3RiQTJOODBuY3ljOFJxYWJuOGtBRTdEMTUyUlJtcmdReWdW?=
 =?utf-8?B?bmJZU0lPcjQrS09CelNmbGJ5bnY5NkNQUWZqdEF6RFlLM1ZrZ1hFUTU3WEdp?=
 =?utf-8?B?K0o5aUtqTEtUSHN1cWZWN1dQQzRnc2lVWW8vV1J5U2hVUUVuOGg2WlhGMnlp?=
 =?utf-8?B?OVVPQi80Qy9KRisrdjZKaHlRdTBmeCtLRmRQQkxaSWplMlZEakI2SnBIM0Ix?=
 =?utf-8?B?Uk0reGV2K2JJVHlTckxUNXEvbWNJbGZZWU0wN0JSQjFZSjdlMGpIS3ZhN0xY?=
 =?utf-8?B?R0FsY2grMkI3amh1eGxvbGw0a2NaVEVQWGVOVGx4TjQyU2hDYlZ3REJKTWE0?=
 =?utf-8?B?YWg0QlVmQmkvVEZvNlpTK2pGQ1ZOcUFHNlBoV1Y0d3hBTzJNWTAyM3JXaFF6?=
 =?utf-8?B?aGk0V05IelZSY0RwWm51NDBRUENrTmd0Q2h1d0JwWVdzVTQ5bk5FMnlwVEdY?=
 =?utf-8?B?L0wxUmxJTWpWMjFiT1Q4WW0ya3gwY1FoaEhsNXpsR091dlVjMHhYenZIOXVW?=
 =?utf-8?B?Y2RyQlVDc0JZdkhoZHlnWEh4eGdHTVV3TzhRcFNPNjBiNkRzeHh6czVvai9I?=
 =?utf-8?B?L3V2OFBrWDRyYlJnUmY2d0djMWhFRmRFNG5TdnVLTTFib3VISDZZdXNSSkJH?=
 =?utf-8?B?WHhRb2JQQWszY01uU29JNm15VW45N081Z1NmNGFvT3FhdDM1cDhKbE83MEpD?=
 =?utf-8?B?ZVFHSGRmMWxQd2xUdy9SNHp3TlllOVJZNHdleVB0YlphTTVOUVpuUnlGU0dR?=
 =?utf-8?B?OC8vcUlOTXpqM0QzeDNXalJYcFJ3NmVkZWJpam1KY3h5OUo4YjdVMWpkNVRr?=
 =?utf-8?B?TWZheVVPOEVkbHRveFBNdWJRTlpxSVA0cUcyVXd0aFQ5N01BZW1JakJ6am96?=
 =?utf-8?B?QWZHbmhRUDNJeTdCTTJBcEJDbTlCRm9WRWxUZCtLcU1OUXp5c0doZUZaMHlM?=
 =?utf-8?B?M1U1eFgrTWlFdS9ieHlwV2xVNm0vTVpxa1VDblVrZmRzNkQ5a0RoWmZuVXJX?=
 =?utf-8?B?TitEUU44d2tES1J1ZkVkeDkvclpxQnBoaHlxcDNMa09GckNDb01mSXZEdFhV?=
 =?utf-8?B?c2NIRjdBK3BuRFlBSURKcU5qV3RjdWZJRy9rQlowSGJFMnU2OE13Y1pWNWZw?=
 =?utf-8?B?VUhERlRqdzIzQXJ5a3Y2OG56THhXNFJBamFDQmF1UG9Gem1HbXJzc292WnlP?=
 =?utf-8?B?VmtCTUtEbzNidFU1Mm5yNkN3VkNJS0pPZlNYVFFvNDc1bS9CcXpMYlRYRHI5?=
 =?utf-8?B?UEFhdWVteDQ5MGlmQ2dtSFAzY0lYdWZVRUJHN1lWZm9kODY2cDNOMlMxSith?=
 =?utf-8?B?QzgxTkt2MXkrRnNpUm90cW5tTWV3R3RaRTVzbTBOS3hhekp6QWRiSXZEWmJj?=
 =?utf-8?B?dVRxcmhhaHNzNE42Sm1kdnBzdzhPUG9ZYnNBcjgvWGVsbUo0RWdseHpmZDJE?=
 =?utf-8?B?T0lQbWZ5akZFN3BmcXgzTldPc29vMlNTWXg3WGNHamNNZFRNL2VyTm50R3lQ?=
 =?utf-8?B?eTFGbVE0b1BrbmlvcHpwTDhFTE8vQW1YSjRHWGtkK3BjaDkrL094alFscmE4?=
 =?utf-8?B?QVZSWjdyc2FySVRBUkR6VmJreTE3aWpqSE03L2g5bFVWZDB2MzNHaEVyZDJK?=
 =?utf-8?B?Zm1KdWFhTW15MkZFWDZ6eXJiakdHME1XRHdQR3A0Z2NGTHJvamhCR2UxWTdZ?=
 =?utf-8?B?eWRRd1BWdmdrYzVPS1lpUFpQZWxialpYZzZpM1J2Umw2aGYzRHVlTDFHSVp4?=
 =?utf-8?B?SWVFcHJ2QkhHaHBsY3VQelV4Z2dnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E86AFF07F56BB469DE7D3AD451305BF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6aebc1f-a843-44b8-ebc9-08d9e123e212
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 23:30:48.1537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 17e0tsaoNZd6ismHtRHJfaQhr32AlcF49uh9dV8r+YA6XtFdwV5uxivPD9DqYK+zX2yrtGWE3MbRjkMs5OEH2CA1RSAmi2Gt/UxHkb9x168=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5652
X-OriginatorOrg: citrix.com

T24gMjAvMDEvMjAyMiAxNDoxNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IC0tLSBhL3Rvb2xzL21p
c2MveGVuLWNwdWlkLmMNCj4gKysrIGIvdG9vbHMvbWlzYy94ZW4tY3B1aWQuYw0KPiBAQCAtMTk1
LDYgKzE5NSwxMSBAQCBzdGF0aWMgY29uc3QgY2hhciAqY29uc3Qgc3RyX2UyMWFbMzJdID0NCj4g
ICAgICBbIDZdID0gIm5zY2IiLA0KPiAgfTsNCj4gIA0KPiArc3RhdGljIGNvbnN0IGNoYXIgKmNv
bnN0IHN0cl83YjFbMzJdID0NCj4gK3sNCj4gKyAgICBbIDBdID0gInBwaW4iLA0KPiArfTsNCg0K
SSBoYWRuJ3QgcmVhbGlzZWQgd2hhdCBhIG1lc3Mgd2UgaGFkIHdpdGggdGhlIHByZWZpeGVzLg0K
DQpXZSBoYXZlIEFNRF9QUElOIHJlbmRlcmVkIGFzIHNpbXBseSAicHBpbiIsIHdoaWxlIHdlIGFs
c28gaGF2ZQ0KQU1EX3tTVElCUCxTU0JEfSB3aGljaCBhcmUgcmVuZGVyZWQgd2l0aCBhbiBhbWQt
IHByZWZpeC7CoCBUaGlzIHBhdGNoIGlzDQp0aGUgZmlyc3QgaW50cm9kdWN0aW9uIG9mIGFuIElO
VEVMXyBwcmVmaXhlZCBmZWF0dXJlLg0KDQpXZSBzaG91bGQgZmlndXJlIG91dCBhIGNvbnNpc3Rl
bmN5IHJ1bGUgYW5kIGZpeCB0aGUgbG9naWMsIGJlZm9yZSBhZGRpbmcNCm1vcmUgY29uZnVzaW9u
Lg0KDQpHaXZlbiB0aGUgQU1EIE1TUl9TUEVDX0NUUkwgc2VyaWVzIGp1c3QgcG9zdGVkLCB1c2Ug
b2YgQ1BVSUQgYml0cyB3aWxsDQpvZnRlbiBiZSBzeW1tZXRyaWNhbCBhbmQgaXQncyBhd2t3YXJk
IHRvIGhhdmUgb25lIG9yIHdpdGggYSBwcmVmaXggYW5kDQp0aGUgb3RoZXIgd2l0aG91dC4NCg0K
PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvY3B1ZmVhdHVyZXNldC5oDQo+ICsr
KyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9jcHVmZWF0dXJlc2V0LmgNCj4gQEAgLTI5
OSw2ICsyOTksOSBAQCBYRU5fQ1BVRkVBVFVSRShGU1JDUywgICAgICAgIDEwKjMyKzEyKSAvDQo+
ICBYRU5fQ1BVRkVBVFVSRShMRkVOQ0VfRElTUEFUQ0gsICAgIDExKjMyKyAyKSAvKkEgIExGRU5D
RSBhbHdheXMgc2VyaWFsaXppbmcgKi8NCj4gIFhFTl9DUFVGRUFUVVJFKE5TQ0IsICAgICAgICAg
ICAgICAgMTEqMzIrIDYpIC8qQSAgTnVsbCBTZWxlY3RvciBDbGVhcnMgQmFzZSAoYW5kIGxpbWl0
IHRvbykgKi8NCj4gIA0KPiArLyogSW50ZWwtZGVmaW5lZCBDUFUgZmVhdHVyZXMsIENQVUlEIGxl
dmVsIDB4MDAwMDAwMDc6MS5lYngsIHdvcmQgMTIgKi8NCj4gK1hFTl9DUFVGRUFUVVJFKElOVEVM
X1BQSU4sICAgICAgICAgMTIqMzIrIDApIC8qICAgUHJvdGVjdGVkIFByb2Nlc3NvciBJbnZlbnRv
cnkgTnVtYmVyICovDQo+ICsNCj4gICNlbmRpZiAvKiBYRU5fQ1BVRkVBVFVSRSAqLw0KPiAgDQo+
ICAvKiBDbGVhbiB1cCBmcm9tIGEgZGVmYXVsdCBpbmNsdWRlLiAgQ2xvc2UgdGhlIGVudW0gKGZv
ciBDKS4gKi8NCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2xpYi94ODYvY3B1aWQuaA0KPiArKysg
Yi94ZW4vaW5jbHVkZS94ZW4vbGliL3g4Ni9jcHVpZC5oDQo+IEBAIC0xNiw2ICsxNiw3IEBADQo+
ICAjZGVmaW5lIEZFQVRVUkVTRVRfN2QwICAgIDkgLyogMHgwMDAwMDAwNzowLmVkeCAgICAqLw0K
PiAgI2RlZmluZSBGRUFUVVJFU0VUXzdhMSAgIDEwIC8qIDB4MDAwMDAwMDc6MS5lYXggICAgKi8N
Cj4gICNkZWZpbmUgRkVBVFVSRVNFVF9lMjFhICAxMSAvKiAweDgwMDAwMDIxLmVheCAgICAgICov
DQo+ICsjZGVmaW5lIEZFQVRVUkVTRVRfN2IxICAgMTIgLyogMHgwMDAwMDAwNzoxLmVieCAgICAq
Lw0KPiAgDQo+ICBzdHJ1Y3QgY3B1aWRfbGVhZg0KPiAgew0KPiBAQCAtMTg4LDYgKzE4OSwxMCBA
QCBzdHJ1Y3QgY3B1aWRfcG9saWN5DQo+ICAgICAgICAgICAgICAgICAgdWludDMyX3QgXzdhMTsN
Cj4gICAgICAgICAgICAgICAgICBzdHJ1Y3QgeyBERUNMX0JJVEZJRUxEKDdhMSk7IH07DQo+ICAg
ICAgICAgICAgICB9Ow0KPiArICAgICAgICAgICAgdW5pb24gew0KPiArICAgICAgICAgICAgICAg
IHVpbnQzMl90IF83YjE7DQo+ICsgICAgICAgICAgICAgICAgc3RydWN0IHsgREVDTF9CSVRGSUVM
RCg3YjEpOyB9Ow0KPiArICAgICAgICAgICAgfTsNCj4gICAgICAgICAgfTsNCj4gICAgICB9IGZl
YXQ7DQo+ICANCj4NCg0KTG9va2luZyBhdCBhIHJlbGF0ZWQgcGF0Y2ggSSd2ZSBnb3QsIGF0IGEg
bWluaW11bSwgeW91IGFsc28gbmVlZDoNCiogY29sbGVjdCB0aGUgbGVhZiBpbiBnZW5lcmljX2lk
ZW50aWZ5KCkNCiogZXh0ZW5kIGNwdWlkX3BvbGljeV90b19mZWF0dXJlc2V0KCkgYW5kIGNwdWlk
X2ZlYXR1cmVzZXRfdG9fcG9saWN5KCkNCg0KSG93ZXZlciBJJ3ZlIGdvdCBhbiBpZGVhIHRvIGhl
bHAgdXMgc3BsaXQgImFkZCBuZXcgbGVhZiIgZnJvbSAiZmlyc3QgYml0DQppbiBuZXcgbGVhZiIg
d2hpY2ggSSdkIGxpa2UgdG8gZXhwZXJpbWVudCB3aXRoIGZpcnN0LsKgIEl0IGlzIHJhdGhlcg0K
YXdrd2FyZCBoYXZpbmcgdGhlIHR3byBtb3N0bHktdW5yZWxhdGVkIGNoYW5nZXMgZm9yY2VkIHRv
Z2V0aGVyIGluIGENCnNpbmdsZSBwYXRjaC4NCg0KfkFuZHJldw0KDQo=

