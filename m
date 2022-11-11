Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4088E625B43
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 14:30:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442534.696775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otU6x-0006yX-44; Fri, 11 Nov 2022 13:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442534.696775; Fri, 11 Nov 2022 13:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otU6x-0006vK-0g; Fri, 11 Nov 2022 13:30:23 +0000
Received: by outflank-mailman (input) for mailman id 442534;
 Fri, 11 Nov 2022 13:30:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xehc=3L=citrix.com=prvs=307a7835b=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1otU6v-0006vE-Cl
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 13:30:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb4f2f8c-61c4-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 14:30:19 +0100 (CET)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Nov 2022 08:29:54 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 DM6PR03MB4921.namprd03.prod.outlook.com (2603:10b6:5:1ea::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.13; Fri, 11 Nov 2022 13:29:51 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 13:29:51 +0000
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
X-Inumbo-ID: fb4f2f8c-61c4-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668173419;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=e1wd13aFpX+t2aJMyOroH0QE+VdZUhC3e1G7wjOv4CI=;
  b=cncmzS3Z9Eyom76EMoa2+AicJ6yQjt9j53S5yhjWRWFCk7XqfQFJSQiv
   35+aLG9J8+yIF5+ITtZb463T514RH8+HjZIMwzadsdB/7XuP6g7RatPDb
   xdwtmxmWlSrnw3Ow6K6dY+Uf6CbMF1b7KSAQgBQ4CeH/4E2ML8LB7daNT
   E=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 84239427
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:j2COvKxXzZhw90B0fQh6t+cWwCrEfRIJ4+MujC+fZmUNrF6WrkUCy
 mUZWDrQOazZYjD3KNx+bITi8EgPu57RyNE3QVZt+yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnPKkT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXMf6
 Po3cmA0VTmsoqGq7J7nT8Nrn+12eaEHPKtH0p1h5RfwKK98BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVMvuFTuGIO9ltiiTsVPn12Ep
 2vAuWD4BB0bO/SUyCaf82LqjejK9c/+cNJOTubpqqQ16LGV7kAyKgEdVn2hncOouhWzV+99K
 G9ToDV7+MDe82TuFLERRSaQgHOCpA9aZNNWHMUz8gTLwa3Riy6bDGUZSj9KaPQ9qdQ7Azct0
 zehlNPzBCdzt6WVRGjb6fGfqTqoOgAaKGYDYWkPSg5ty9/qvIE6iFTUUstvHbSdgtrvHzzq3
 DeQrzN4jLIW5eYQy6ik9Erbqymwq4ePQg1dzh7MQmuv4wd9ZYikT4+l817W6bBHNonxZlucu
 HkJneCO4eZICouC/ASdTeNIELy36vKtNDzHnUUpD5Qn7y6q+XOoYcZX+j4WDE1kKNoecDnlJ
 kraoxpM5YR7NWGvK6RwZuqZAM0wwa/tPd/sTPzTY5xFZZ0ZXA2I5iZ1fmaLwnvg1kMrlMkXN
 ZmSfsmtCnIbIb961zfwTOAYuZcmwi04zCXOS5H+0w+qz7O2Y2ScQrMIdlCJa4gR9qSfqh/S9
 NVZH8SPwhRbFub5Z0H/9ZMQJEsYBXgyGornr89QMPaHSiJYH2UmB+7U0KkWUYVvlKRIlc/F5
 ni4HERfzTLXiWXcLASWalhqcL71QYtktnU/IDAtOlCznXMkZO6H6a4DeoYsb/8i8/NgxNZ1S
 eUIf4OLBfEnYjfK5TUbK4X8pYpKdRK3iAbINC2gCBAndoNkbxzE/JnjZASH3DUPCwKnuM14p
 KevvivERbITSgIkC9zZANqsyFWrtHRbh+N2XGPPONBYfEiq+49vQwT9h+E6C9sBIhLCwn2dz
 Qn+KRIRv+zEuYI22NjPm6Gfro2tHvd+H0xVBG3S5/C9Miyy1mi+x8lGWeWBfzHYXUv1/rmvY
 aNeyPSUGPcAllxbvpF8F7tuxKQW6N7mprscxQNhdF3AaFKtDbFsK2eHxuFAs6RMwvlSvg7ec
 keC/NZKJJ2COdijDUYcIgxjY+ievdkPkzzP4PBzPEX77iZq+KavXENJeh2djyobK6F6WKs5y
 OIoo+YK6AiyjBU7P9LAhSdRn0yFL2cJUqEunpsbHIPmhActxlxYJ5fbD0fe+ImOcd5FNkAgP
 xeehbbOirpRwEbPaTw4En2l9eNZhI8SsRFQilEYLlKCm8HtmfM8mhZW9FwfQgtZwxpd2spvK
 2NrMAtzPqzI8DB27OBaQmmqXRFcXDWW/0Xwzx0Ck2ixcqWzfmnELWl4M+Dd+kkcqjhYZmICo
 +/ez3v5WzH3es23xjE1RUNut/3kS5p26xHGn8ekWc+CGvHWfAbYv0NnXkJQwzOPPC/7rBOvS
 TVClAqoVZDGCA==
IronPort-HdrOrdr: A9a23:qWc676AdvRluN+HlHej1sseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuaKdkrNhR4tKOzOW91dATbsSoLcKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUeF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlil9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4sow3TX+0SVjbZaKvm/VQMO0aaSAZER4Z
 /xSiIbToFOArXqDziISFXWqlHdOX0VmgLfIBej8AfeSIrCNXMH4oN69PxkWwqc5Ew6sN5m1q
 VXm2qfqppMFBvF2D/w/t7SSnhR5wKJSNUZ4JwuZ+w2a/pgVFZ9l/1owKpuKuZIIAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkdoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWtKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEniefvFmHKc7hiwlbF/NLggFkPsulqSRkoeMNIbDIGmEVE0kldemrrEWHtDbMs
 zDTa5rPw==
X-IronPort-AV: E=Sophos;i="5.96,156,1665460800"; 
   d="scan'208";a="84239427"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Px4H+z/IuS6jfqAo5fRpncqlF//1jSDUULZff8K3Zi/KbrxIQy6l5DOireqCX050tKHDsi7hIyYlnv4ke+b7jnftuBKIZ1hmFzJrWpuTWLng2tQQU/MPNjv9yRZMrfZrAhJJTYQi4VcNfug+udhVmxob746TRrOPkK++MU8yPdmSO+9P9n6OA+XnNoUe3/F/9xlxPocQjpgZWK+c2CSSlgcg4buHaDthtjhXZHGzvl9Re429pq0vkj4eORw5bI+rrzTw0yeVeGxJfxhhAtmyLHUaVtZsPVTZSzddBGiVdvvIIHMx8fcSr0fRISEPOG5AvfYEWaG0TQBNCZG2f25mPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1wd13aFpX+t2aJMyOroH0QE+VdZUhC3e1G7wjOv4CI=;
 b=ltH9IOI8RDnoZDXkXkeWpDO8RbNCt+f5jKBdP8vPf5JljbTmgtp4i1V9qZfNvkUCat9afSmlxvU82Cme5kpZLrBozeOe611jR+xhWAfkiMdONAAymRAN735ScJ13wnjjvfL8cjBxkHIpRQwHZ9daqM8LYFXPGW09NqVcqF81Ih2A0PzgvH+jLUfl8uwKn7O5jZAxF1DM75z1Osooi3yPwa2U4Mc/A28cBCL9XziTWcymPWAlVkLpLRUjStlhco22FGm/p5e6tlMuVsxvqOZpkPdrnW5WgtIQ1Ab32lp8zcL8c2eH3Ef0+abVnBeHQi5hJ3Z9WmsmOtux7F5OZuAV8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1wd13aFpX+t2aJMyOroH0QE+VdZUhC3e1G7wjOv4CI=;
 b=Vc3+43M/57ItxNUYYS2kUoSqkhoKnyb5l2jlxrKikWgaGvpKYsnrEzke3AgkyrRECPFDEWjXYQ2DNosuVZR+dXu/x2C1ZqkyQ163RcdYL0NuLf74mkJp6706/k1S8HDpo6i6l/Kuc2PegioWBuzFrsc8YaXfxS7BZrQhq1BgUrk=
From: Christian Lindig <christian.lindig@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Christopher Clark <christopher.w.clark@gmail.com>,
	Nathan Studer <nathan.studer@dornerworks.com>, Stewart Hildebrand
	<stewart@stew.dk>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Doug Goldstein <cardoe@cardoe.com>,
	Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>, Elena
 Ufimtseva <elena.ufimtseva@oracle.com>, George Dunlap
	<George.Dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Lukasz
 Hawrylko <lukasz@hawrylko.pl>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, =?utf-8?B?TWF0ZXVzeiBNw7N3a2E=?=
	<mateusz.mowka@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Paul Durrant <paul@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, David Scott <dave@recoil.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Anthony Perard
	<anthony.perard@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
	Meng Xu <mengxu@cis.upenn.edu>, Samuel Thibault
	<samuel.thibault@ens-lyon.org>, Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan
 Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH 1/3] CHANGELOG: Update link for RELEASE-4.16.0
Thread-Topic: [PATCH 1/3] CHANGELOG: Update link for RELEASE-4.16.0
Thread-Index: AQHY9b/tV4PXQktPckC2MFDCwX3RyK45t9kA
Date: Fri, 11 Nov 2022 13:29:51 +0000
Message-ID: <AC58DA7A-529A-461D-9DA5-A91D2388280F@citrix.com>
References: <20221111112208.451449-1-Henry.Wang@arm.com>
 <20221111112208.451449-2-Henry.Wang@arm.com>
In-Reply-To: <20221111112208.451449-2-Henry.Wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|DM6PR03MB4921:EE_
x-ms-office365-filtering-correlation-id: 57b27f65-4a18-43e0-dd00-08dac3e8d00d
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VzT7EUfwrCUGDO4Iny3Xh82bIVqjt+KRTKHnXHZcJMlyUT3g2tmF70RN1Wb+LKx5EOkMtwhXQzFS0i96g3A3aEmoRdoqn9Z7IQ919K/sYFOlRTqM1GIsc0CMeQPFlkCGrUV55zjMm6fVncOFN7VDLmSIsFuxkNlgbADuqfgF/4cIOBT0RajXq0xa1Txbrj3+ePjMgNl/UGxQIJMT+KIqBkptq7QIyJuHZcceKoe6BtU/4zfqszLu+x17JiEIiIj6yB8sVjwwTpmQCPx752KyrqXD393A++n3cwmmJRj43ZH0vG6k6kEEv7y74zHFPtHxG80zI8xt795a3FpZYpDQ96hdWEFtmMRVTOQhfWctlV16F09K7NyKRX+66lBXYj5u3mfFELBBk3LQ3waz+L7f7E+JE9YCt89qvyJfkiO9QMeh5q5nOBmmgfGros2XZS8rIBpWBnOT9r+2niDxUJeJLKuZhIDELp2strpGsWC2f3GbreR98uW8SqdFtFs85DaBNAk5uuVxWttoHHeN+at8M0UVgWct3GaxFjOUseCFxbngdp/PxX3QLLyxG9BsVTUcJgrL78GAhAIeoMi5KhV5E4CgfMI8vkCl8w7luRKCLofUqzoIvT4C6hkeptqYR/Fb7oqYQOVRuDFsSztbmFeOb0ueeTsq3LlwOjnLCOIx1twGZv4K8qBR27K8NfFsyukBnsNrUyHKexky2gkMUR/swb3qAbCvw4h96m5tcABxVJyRz7DgF9IDOBhT8gGZnsxjQ8VmKKKKLSyOMJipSim0eG15KVLbSnEWR5ewsZzFInC/Gq1kvCib83Luvhoyd7UENV9gb03lbDcGXLwoHLL42rf6x17wEvVZfHT0aW43ZRM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199015)(6916009)(54906003)(38070700005)(122000001)(316002)(2616005)(8936002)(41300700001)(66446008)(44832011)(5660300002)(4744005)(7416002)(186003)(7406005)(2906002)(33656002)(53546011)(6506007)(66556008)(26005)(86362001)(76116006)(66476007)(91956017)(6512007)(66946007)(4326008)(8676002)(36756003)(64756008)(478600001)(6486002)(83380400001)(38100700002)(82960400001)(71200400001)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnJvWXRZdVYwNlhmMEJUZjN0NnZ5MHQwQUFZelJGMjI4TUIvNnZobWZaZDEx?=
 =?utf-8?B?aytRNzE3V0lDZHVOYm8yWGhwR2dYSzdLeDdjdlBVTFUrb2NraDNoYTBoTUJ3?=
 =?utf-8?B?bkV0RS9LbTA4TW90MWNaUjZ1YXZObS9CWmhHTllvdFVaQy9TQnQyUXE4NGVE?=
 =?utf-8?B?WWZ4Vklja1E5L0h2THh0QUdySHg3SU5aeDU5Z05Mc3VDOGl3OWVOK2Jsa0Zt?=
 =?utf-8?B?NGdVODZNekVpK2JLdGEzVTB2am12SkxSeFFnclhCems0dTJEVkZQOEp3Y0Fn?=
 =?utf-8?B?UG93Mm9QUk84MFZIQ2p5NEcvMmRCVE91OUpPajNtcUtCdVZkVmVBR01NYncy?=
 =?utf-8?B?UnFVZG1pUFdCWlYrdExpcVRqNjRMWkJNcWxLOUVTbURnc1dCNzFJRkl2UjZV?=
 =?utf-8?B?QzlEOHZnZDljL1hvVzVSRHdUQjRsbDlyT21WMnl6RWUwTkt4RzNZOGFoUnYx?=
 =?utf-8?B?ekZOMC9oMFBHcDVaYWVMazNsaUJuSmovSWxhbHpEdWExS0oxSExlaDJCVUFI?=
 =?utf-8?B?b09pMFhoaW8rWWxObU5oeUs1Tm9oRFVwNU9lUFNZajlsQjhYZkNsSHNiRmdk?=
 =?utf-8?B?aUVEbTdhbisvUGd6UkJLWEJldEMyclJiblg0bSszV0twTG5LS0gyb0Frc3pU?=
 =?utf-8?B?bWNGbkRUWHpHZjR1cXVVWVFaekd1TVloT3BDMWNFVUdFOWZVV0czSktVcFJC?=
 =?utf-8?B?alZEekJaMnE2QzVTMC9TNFNYaXVjYlFGczNhbFB3Q2tUZHNhZXRIcmNOOWJj?=
 =?utf-8?B?YndCKzAra3NyWjVIMWlkWUJRSTdvUmE5djlRazdYUVJ5UDh3dGdUdDhMVEJj?=
 =?utf-8?B?ejJqM0FoZWNBMjVWYzlDbkVySk5LbHZXSWtUM0hFM1JnRDd2ZnQ4VjAweTNx?=
 =?utf-8?B?bGxaekNQM2grS1lMN1lkRUorQysxaUFQWHRSZXZDd0FEMTZDRHFLRTFBcGkw?=
 =?utf-8?B?cmZ1WlMzMTc1eTRHY3RtMzJrQThxZEViU0JEdUtwcUlpc0QxRkdudzVOYjhx?=
 =?utf-8?B?WFdpd2ZCRHNyaGEzQlNPanJZZklNQS9xa3VHdmVuMnQxVWFoMUVSM3JJZ1BX?=
 =?utf-8?B?Wk1ON3JWYUVMNnBZeVp1clRHNHJvbTdwbG5pZFRoS1hHNkNJQjRGaDJyakNT?=
 =?utf-8?B?dW02TUE1Rk4xVWdPMm5XUHFYdHd5bWVQUjM3NHNhUS9NcTVUK1JsN3B3N01X?=
 =?utf-8?B?eklmdzFCUFlZVVdIWjdXUDQxZXRCOE04eFRxUE9LRkJSanNvMHM0WVRBb3cz?=
 =?utf-8?B?UHE2REZ6ZCt5aHc5c1lSdVVoeFE5bHBwajduMjVNMnJVZzhxMHcwbWRkSTVV?=
 =?utf-8?B?YkduLzdkcFR3VUpaZmlVelhMTk1yU2NsbVJVVno2bXlXbW9KWUpvekFRKy9I?=
 =?utf-8?B?ODdVRWNNYlR2MFlIVnk3cjhCMEdmcXJUVHVPQVhqakJRM3BIODI5THNmQTh3?=
 =?utf-8?B?VWV5ZURRL1htTlh4cnd4YW84TFNGZFhmS3hhblFCbVcrM1p2T2p1SURSeDFR?=
 =?utf-8?B?T2FLYnNkNGZ2UlVrdTJocUJnL3AvY1VKb3VsOFpQRUZleUwwcGdSTHpjd2Vj?=
 =?utf-8?B?dTdIbWRNdXY0bGFvK2xkTDRZdWRjSVZPOUg5dG9pTEVYQm51MmdaWWc3azF6?=
 =?utf-8?B?V20wRlZodDFML2NINHE2VWFDTlZUeXh5V05YMkF0VnlRVUZwcDJyVjgvckNL?=
 =?utf-8?B?MHc0dmlObk9WYjBrdkdURU1HMHVRdzcwV3crbUYvR3ozRWVZUzlOUVdFaGsy?=
 =?utf-8?B?ajkrUGFtTGlWbkdvOEY5bHVLUlo2Qjh5M2M1cUNyV2VrQUE3dHBsVWI5VHhn?=
 =?utf-8?B?ZFFSVjIwZEV4Y1NwRmljUGZjRDRQa09QM0tLSmZaMGJrQUlYTUtlUGFadk5t?=
 =?utf-8?B?RjR4bUIzM2pKT3llTnFKOGxJelJCNGtVUFVtQndReVBaMWtJeXVMbXUrcVRY?=
 =?utf-8?B?VEFPRGZLbGtBaHFXMUNQaUZ2L1pNMHQwTjlFTDVRNFd0dU8xSmRkNkdNR2tY?=
 =?utf-8?B?dnQ4YkFCcGhVYUtCcTNRdnppYmM0VXNXQi9PRnd1UEVQRmdrUXZwUDhoMExi?=
 =?utf-8?B?aCszN21ObEZmVFVqUy9QbFZSMjRRMTEzdnBheHJDTHd3TXU4STdDWlkwUDJU?=
 =?utf-8?B?MnVIZUZZbHpVWm96Z2xGTzFqNVNCVnhGVG5xSjdZM3ZqdzBMclRibWVjVDNT?=
 =?utf-8?Q?ikSAQYj1lznAiAXZljkrGZY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC96F95067D4904FAA6E050D7C079C7B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b27f65-4a18-43e0-dd00-08dac3e8d00d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 13:29:51.6432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hY1J+ujbeuHW3Q7Llz1A9ZaWveWWQUfDKiKLEEYdz/kF2c1gGx4J/3agEe//Ybf24KJU8tPhRA/XGDGcsT6QosxgmtVrgejJQlIvo69Bpeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4921

DQoNCj4gT24gMTEgTm92IDIwMjIsIGF0IDExOjIyLCBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFy
bS5jb20+IHdyb3RlOg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGVucnkgV2FuZyA8SGVucnkuV2Fu
Z0Bhcm0uY29tPg0KPiAtLS0NCj4gQ0hBTkdFTE9HLm1kIHwgMiArLQ0KPiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KQWNrZWQtYnk6IENocmlzdGlhbiBM
aW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4NCg0KSGkgSGVucnksDQoNClRoZSBj
aGFuZ2VzIGRvbuKAmXQgc2VlbSB0byBiZSBzcGVjaWZpYyB0byB0aGUgT0NhbWwgdG9vbHMvIHBh
cnQgdGhhdCBJIGNhcmUgYWJvdXQgYW5kIHNvIG5vdCBzdXJlIGlmIHlvdSB3ZXJlIGxvb2tpbmcg
Zm9yIGFuIGFuIEFjayBidXQgaGFwcHkgdG8gcHJvdmlkZSBmb3IgdGhpcyBhbmQgeW91ciAyIG90
aGVyIENIQU5HRUxPRyBwYXRjaGVzLg0KDQrigJQgQw==

