Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 291C849B702
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 15:57:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260440.449927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNFm-0001KU-SC; Tue, 25 Jan 2022 14:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260440.449927; Tue, 25 Jan 2022 14:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNFm-0001IJ-O6; Tue, 25 Jan 2022 14:57:02 +0000
Received: by outflank-mailman (input) for mailman id 260440;
 Tue, 25 Jan 2022 14:57:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCN9l-000334-4Q
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 14:50:49 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 153584e1-7dee-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 15:50:06 +0100 (CET)
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
X-Inumbo-ID: 153584e1-7dee-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643122247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=SdSYNvIvXjuUpSG4B6g2Au59lE4nuJWjeYH8MZknVwg=;
  b=gMfQu/ZT3sR+LOxXB1CS6L1Wf/megiNuakfNO+aNiQ5WQcaATg/MU9mS
   i1cE4ooC4oA6dhgoaV4AyfRf9SAShg5pbmnxk0WBeYe7zLAabexLkQqBJ
   PTlDeChLxncAOzBVXS+W4I0ETzAMElvm3mJ6TocRTnm4tPo+Fi/1ZWmTB
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TJjTIJn3k9sU0BY1Oxq8NXu//fkBWwpd3r4jllFC9MP1sRqP0p6C9Ih913kPEwvu9xN1dXycAg
 /VZ+RLZErVsy9tcVZ9RjKTo4vkuh1tiSseTYXXNYZvRrClE2pyt+UPr1s8tDsY7qdqb6GZUM4f
 lo26bpZu3mzRRSFuuBxAiY2YgsC4YVWuLB/m4LeUjdma9Wdv8QMNUGtUqXbmyO3BCxuSTSVA3w
 1/WUyFeGuyjR54T963W9C4Afj3F0oWm4phk9U7fjB9Jn7mcfiGmQjcJZ+VcvaEliJOOuYsF1H4
 uKBJLzTJZQRgA2MSpYwZW150
X-SBRS: 5.2
X-MesageID: 62717123
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:US5r1KNjWZ0BRgrvrR1UkMFynXyQoLVcMsEvi/4bfWQNrUoj0DRSm
 jFOXTuPbPrfajHwf9EnaInj8UMD7MeAxoQ2Twto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Eg+w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo22YmZN8z
 cduj46TFkQuAPD3mORHQQYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uQuoYHhW1r7ixINebHR
 sQmVwdWVxHZIFpyFQctBLVgrvj90xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiR8pPmV2Dj
 nnb5Gm/CRYfXPSPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+fVmxrOS9i0W+c8lCM
 EFS8S0rxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9inV26yX7gOLJVIWbWECb+J7j882Hy41g
 wrhc8zSORRjt7icSHS4/7iSrC+vNSV9EVLudRPoXiNevYC9/dhbYgbnC486TfXr1oGd9STYn
 mjSxBXSkYn/miLiO0+T2VncywyhqZHSJuLezlWGBzn1hu+ViWPMWmBJ1bQ5xasYRGp6ZgPY1
 JThpyR4xLpSZX1qvHfVKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aJWSxP
 B6M5l0Atcc70J6WgUlfOd7Z5yMClvCIKDgYfqqMMoomjmZZKmdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6j+b2TCPLGN8tbQvfBshkvfjsiFiEr
 L5i2z6ilk83vBvWOHeHqOb+7DkicBAGOHwBg5UHL7HYels/RjhJ5j246epJRrGJVp99z4/g1
 nq8RlVZ2Bz4g3jGIh+NcXdtdPXkWpMXkJ7xFXVE0Y+A1ydxbICxwr0YcpdrL7Ar+PY6lax/T
 uUfetXGCfNKE2yV9zMYZJj7jYpjaBX02l7eY3v7OGAyL8x6WgjE2t74ZQ+zpiMAOTW66Jklq
 Lq62wKFHZdaH1Z+DNzbYe6Exk+quSRPg/p7WkbFe4EBeEjl/IVwBTb2i/s7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHCDrGS5wIJGXOKZRhznVTv5qPe4e
 OFY7/DgK/lbzlxEhJVxTuRwxqUk6tqx+7IDllZ4HG/GZkiAA697JiXUxtFGs6BAy+MLuQayX
 U7TqNBWNa/QZZHgGV8VYgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYlYpk4x
 eoBudIN713tgxUnBd+KkyRI+jneNXcHSagm6skXDYKDZtDHEb2ejUgw0hPL3aw=
IronPort-HdrOrdr: A9a23:LC1kTqCf70wrH0flHeg2sceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6Le90c67MAzhHP9OkPUs1NKZPTUO11HYVb2KgbGSpgEIXheOjNK1tp
 0QA5SWaueAdWSS5PySiGLTfqdCsbu6GeKT9JrjJh9WPHBXgspbnmFE42igYylLrF4sP+tGKH
 PQ3LsMmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZTbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczOgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxeokPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesXMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO11GkeKp
 gsMCjg3ocVTbvDBEqp+1WHgebcEUjbJy32AnTr4aeuonxrdHMQ9Tpv+CVQpAZGyHsHceg32w
 3zCNUeqFh/dL5kUUtDPpZ1fSLOMB23ffvtChPbHb21LtBNB5ryw6SHlIndotvaPqA18A==
X-IronPort-AV: E=Sophos;i="5.88,315,1635220800"; 
   d="scan'208";a="62717123"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0zonlQYGqaWmpW2MRNbGscGtLSD9S9NdFeLJ0qEAk/g0STGSjnwWUOv4o+zgw9jocDcUE6o6c4jnmupIv9+Go8PorylxuIFmrnCXCzIpSVll0W+YqJQJLCoq5hRA3AVaJpPEqDfyOwbD8tUtXEeBp61GT7jU2RVUsuoOJfb76TLe8Mp2jjEPSkZ7ccn11iwlXCgP51G4fef2/Ma9KYDTW0BlLeT5Q/vrpWUOnGmBB4ymXm4aSM5OSaqmtLfXMPiDAQWr03ZkCRuiqwGBme2sX+indqwkA7wa3o7WnA0vLHe17ykUJUkjbgDAPUQrhMJYWZ7stYC/SLrTUjFzRvqxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlGOnZqzGyzuT9kP+fcec5bcZMp+YNPmS8unxsF4SiA=;
 b=LY0KF8zHGhtc9IAjHnK5u4+860Vbiu5FzCrDTSRw5JW6BKIBWxqxo43GtlBEjrG0UkqwOIVSISJMetF9Vn/4VEa7sMXwmGvPF9SfQm5LsVbtbER4+GEaPvXr+AHC+op4zhPUiqOn68Xk4QTuYur1CtZ+lnfAto98ogfUamri0UtkQjQui9lTY3eXgl7Bbxl7i3i+dHU+b/a2cb0MYLKYC72Vt3Uh5JoKlPiS2PPyz2F4U9CKPPKCIHk9oMCWKhSrcCHeyqKigjX7nNyjktaym7oU/XGDs5WwJW8MS13ZEaKlvuTnqCWVpjQlLvo/wbKJZUPFJXOxxmqBRHoT3FTsIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlGOnZqzGyzuT9kP+fcec5bcZMp+YNPmS8unxsF4SiA=;
 b=rSSxX0DRbji7Q/0vtR0jczkRkPGm03/BplpUnI4RL8gPaUahi7iZ0KHQ2YeujwXVjX3/H+x3AAna247bpf1R1/ME73HaZZZIXWeP3nzTYIBjLA+55B2Sjz9d/ZPPXrY44boxNYlDUsqk0hk88NAppk9zelWNmZtBDVVWcheQyN0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v7 11/11] x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents
Date: Tue, 25 Jan 2022 15:49:35 +0100
Message-ID: <20220125144935.44394-12-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125144935.44394-1-roger.pau@citrix.com>
References: <20220125144935.44394-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0136.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ff935ad-0472-4559-48df-08d9e0120eda
X-MS-TrafficTypeDiagnostic: BN6PR03MB2868:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB2868D23C716B51736013BAB88F5F9@BN6PR03MB2868.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: buHmY4QbYa0ASvS/Dki/DXAofZc4f7uSbI+H5+GWuVg8lGiqZYaG/CA3eQTOcgXRomimqynqf1m8ATSPOCqYiQlaydcy/qKPcC0tbmC/KpWUVuk5YTuwN3/jlehwoEq6Y9+L69Xwso4UFms6dQRYZiJnS4j3/xVkL4eM5HKwCoojp+XFH4jCK5W++xALJ1SfH6bNgJH9L81cP1QA6wYySfYd/yuBjtsxz5h8oPq1RRGJuuWdC0ovX/S9TM2AZHfU+bViLxGHM3Md/BSXMjhQkuXOxXtwl3B/iIyCbb4GsEXPtB1DDzSzDyvZRdf7ZiyxvwGhsvJN4FiL/vGjmFcQxv/DSpeT8c0/NwRCJAMLGAEwh1WCRRw1EDvcvkVJLYCrD78cBkP/0bZyl55Q0eP6JLexkRDxAEE1dNbJt0BJDtGBhh/1rWSso7v4ihLLxWmKKuYwmFgesP0WynWtVq5/tgdOWnsDcff1zXrvb7E6vhcVuqDc0ddfH258zomhxavrKj5Vc6tPrL3pDv9RboQYwv9ALennxCYgjYH9mWJdOMaXk1LG7WrjnevCyXnwphbVw9W8/K0Bq0mCh262poNIvDUr7ZqySlyJYV9kay7yXm8bLtF/RuZJacRdLdMMDbtzs/1pWgsNMlAQbox+oQFpag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(83380400001)(316002)(6512007)(186003)(82960400001)(2906002)(54906003)(66476007)(66556008)(6486002)(6506007)(8936002)(6916009)(26005)(2616005)(8676002)(36756003)(4326008)(5660300002)(107886003)(6666004)(38100700002)(508600001)(1076003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXhHUlE0K1MrbHhFNUgyV3d3a3lMelZmSmM4T1hJazhqMXRwakVOWk5JVmVh?=
 =?utf-8?B?VXJ2M3kyVnZSdC8xYW9zZUlHYUNXblFNb1BCVTRoQ3U5SGlpdDhBU2tsWUJs?=
 =?utf-8?B?anU2eW0yTzU2czdUUHZEM2UvbXJZYytRUU1VdE1XUWU5bnU4ZlBnajdzV09O?=
 =?utf-8?B?US84UStFN1N4RlB5cVgwK0FSTFVyMytmeUZpQ1gwTGZMY1I2M1J5S1RmeVl2?=
 =?utf-8?B?QmZCTHJwZDMxVXVKZm5Bb1FnSy9TNmZadkxrZFZEZUY2eXNSaitINENOZnhQ?=
 =?utf-8?B?dTlUT0diTUdrYk5kdkVuSmMraW9uWVU5NFNjTTNQSFc4eW5maWg0cnNiOW52?=
 =?utf-8?B?eE12aFRETXNMQ3ZjZklLcmpyUWJBcktvOGN1OU81TE95aWV5WlVUOTZiNGc1?=
 =?utf-8?B?YXVzMWd0Ykd2bEpNTFpJY0txYjJYUVlJampGRWhEOFdJNElzb0FRUkc0cnFw?=
 =?utf-8?B?MU1XcnZTYTAzYnBpWjBlTWVXRXU2TlF0RGZvUnpLd0pmSjIzSUFNeEYzZGMy?=
 =?utf-8?B?NitjYVZvaFFCblRmQnBQQzdhK1UzZENvZHpETDZTWUVIajhGMWUyVGdIVGht?=
 =?utf-8?B?QUwxZHdhdEFrZXdxbGt5SkRTUlpadUVUbTdUdU5wU3RncHM2OXMrZnZPeFpY?=
 =?utf-8?B?NmtKQzEvSnY3bkFsTlNhYTY2bzZLbFo1VzhGZS95Nk9RbmhYanRJbVlBK1Fr?=
 =?utf-8?B?V3JQMTJNVzEzSGRTR0ZNVm1RT3VrakgzU1p6UVBvc0p6WUZsU1NaNHR0dlhH?=
 =?utf-8?B?QlUzU3ZZczRDYk1VQWVqWWxBMURuMUhDMWlYd2dmNDZJMHEyWUppRHVsdGdC?=
 =?utf-8?B?VHoycjU2Z0g0cFZ4NUxRMlhiOEVZNzd0Vm4zZ2lOSGhrVlJ1MGZURFNMQTYz?=
 =?utf-8?B?K0lpVGpuQ3NZVmlTN1hDMktMTVV1ZnRYWG80eEt0ejRwK2xTYzZtcGsvNUpx?=
 =?utf-8?B?aFIxbFNEN0lHRW8vYUJZZ3ZKRkg1d2I4Qk5vTVpFOVpvOHA4a1J1SXd2c1oy?=
 =?utf-8?B?a25NZkRtdVJYMnpSYkRkWDJ3dlFUdVNBbmR0Yy91Z0p4WitlN3hOY1V3c3Ey?=
 =?utf-8?B?Sk1Mbko3QXRxTHBpNXVLNm1jRVNsZUtnMjdIYUpYZmVIcysvWitlSEVPdVRo?=
 =?utf-8?B?SEZna2M2UFRUb1BXUTJpZXBJQWNORVNVSUxlZW9IYXJqRVdmeTR1bXgrOHgy?=
 =?utf-8?B?TTlHM3lQQVZVNTVJNWpkOWRCLytQMHlETGtMYXJGL2RIVXpUcEp0Vmc1cDhm?=
 =?utf-8?B?aTZIRU93MTZ1dklQTzRPMGdSRndnZEtBa0gyR0E0V1pxY0NuZEk5ckRlL3U5?=
 =?utf-8?B?L3Yxc3AxY2J4RUZRNHh3dmtDTnhMOGdjaE10UE9WVE9obXR6S2xLNThpUFRZ?=
 =?utf-8?B?UEx4VHU3cUkzczBucDJXVjVJOURKUU1JTXZiN2llcE5zVjVZNjdVRmpkUkow?=
 =?utf-8?B?Wlc4T1RFWHBYS0gxL0k0RnhiTzhmTk1ib3o0OC9tVjhPNEdvaTZJdWFOaksv?=
 =?utf-8?B?SURBNjdzQUNodkdWeDQxaVkrT1dYNHQ3TDJOOEQvYXcvQ25TRko4UmNXUWNw?=
 =?utf-8?B?WEppSUFhc29YeFFkZGN6WVpDMXdBUThRYUdJRTcvV3ZwdnNuTEhDZDk3ajFv?=
 =?utf-8?B?Z3dRTzZobnpUQjZTUnlNSGhsNVVIZVZwNTROSFRYcGVzbXUzdDB4VHA1ZkFT?=
 =?utf-8?B?ODA2RHptMVpQdXhMdmVXQTdtT2xKY0xoK1RTOWRmZk1IYnU0UVozVEtNeng2?=
 =?utf-8?B?SzE4QW1rbnF3cktzb0hUVFFXbkR2TnhWV2JuNGQ4a1p3ZEJ0QTN2WXlUWWdP?=
 =?utf-8?B?RmRxYnJyMW1VbWxvd1BhclY4QzFVcGtGOWwyRzJhUDFHcCt6V20vcHBFRy9F?=
 =?utf-8?B?TmYzZ0hHTkJ2c1doTDc1OWtxckQ2cXBSaUxoYWNzMkpvSUxLVXRqckNna0Ny?=
 =?utf-8?B?RzB4UXFVQ3QzTXFXcWsvSmJJZ3BOVUhudG4rT3dBcDR3VE12QWZOYlFBVk5n?=
 =?utf-8?B?MGErckJFMGhXNkZrOFJPUldOb3dFTEJQZkJTbVdTREZEOUJNWks1M0htSWhL?=
 =?utf-8?B?Q0QyL1lqeFI1cWtBRWhrOU5LQ0MwSXVHTUJ3Yk1Lbmx0ZEVOMWgrTXRqYTIy?=
 =?utf-8?B?RzBiSEtpY3BIdThiNHZGNXNDQm82aGNUeUprdzhraWRYUm8xNlk4RzdUOU9G?=
 =?utf-8?Q?z03+CUtppo5NIlFkkb+LPak=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff935ad-0472-4559-48df-08d9e0120eda
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 14:50:41.3949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJqnFxRByBqkhr2EGd8pTwC7yLAZ/g1mmso8xzsHYglynyiHE/VX4zDklt1vRXS9cseHzfN45j/IbS7jdB0jmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2868
X-OriginatorOrg: citrix.com

From: Jan Beulich <jbeulich@suse.com>

Zapping leaf data for out of range leaves is just one half of it: To
avoid guests (bogusly or worse) inferring information from mere leaf
presence, also shrink maximum indicators such that the respective
trailing entry is not all blank (unless of course it's the initial
subleaf of a leaf that's not the final one).

This is also in preparation of bumping the maximum basic leaf we
support, to ensure guests not getting exposed related features won't
observe a change in behavior.

Note that such shrinking is only done when creating a policy for a
domain from scratch. Migrated in domains keep their previous policy if
present untouched, and for migrated in domains not having CPUID data
the crafted Xen pre-4.13 policy is not trimmed to keep a behavior
compatible with those older Xen versions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - New in this version, picked up from 540d911c2813.
 - Only shrink policies for newly created domains.
---
 tools/include/xenguest.h                 |   3 +
 tools/libs/guest/xg_cpuid_x86.c          |   5 ++
 tools/libs/light/libxl_cpuid.c           |   7 ++
 tools/tests/cpu-policy/test-cpu-policy.c | 101 +++++++++++++++++++++++
 xen/include/xen/lib/x86/cpuid.h          |   7 ++
 xen/lib/x86/cpuid.c                      |  39 +++++++++
 6 files changed, 162 insertions(+)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index ffe74c7a51..4b1ced4c49 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -835,6 +835,9 @@ int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
                                    const uint32_t *featureset,
                                    unsigned int nr_features);
 
+/* Sanitize a policy: can change the contents of the passed policy. */
+void xc_cpu_policy_sanitize(xc_interface *xch, xc_cpu_policy_t *policy);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 032459f3de..1b83533098 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -651,3 +651,8 @@ int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
 
     return 0;
 }
+
+void xc_cpu_policy_sanitize(xc_interface *xch, xc_cpu_policy_t *policy)
+{
+    x86_cpuid_policy_shrink_max_leaves(&policy->cpuid);
+}
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 5d28476eb9..61b85c6e0a 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -660,6 +660,13 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
         goto out;
     }
 
+    /*
+     * Do not attempt any modifications if creating a policy that aims to be
+     * compatible with pre-4.13 Xen versions.
+     */
+    if (!restore)
+        xc_cpu_policy_sanitize(ctx->xch, policy);
+
     r = xc_cpu_policy_set_domain(ctx->xch, domid, policy);
     if (r) {
         LOGED(ERROR, domid, "Failed to set domain CPUID policy");
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 8f51447117..d883f750f5 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -9,10 +9,13 @@
 #include <err.h>
 
 #include <xen-tools/libs.h>
+#include <xen/asm/x86-defns.h>
 #include <xen/asm/x86-vendors.h>
 #include <xen/lib/x86/cpu-policy.h>
 #include <xen/domctl.h>
 
+#define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
+
 static unsigned int nr_failures;
 #define fail(fmt, ...)                          \
 ({                                              \
@@ -772,6 +775,103 @@ static void test_msr_get_entry(void)
     }
 }
 
+static void test_cpuid_maximum_leaf_shrinking(void)
+{
+    static const struct test {
+        const char *name;
+        struct cpuid_policy p;
+    } tests[] = {
+        {
+            .name = "basic",
+            .p = {
+                /* Very basic information only. */
+                .basic.max_leaf = 1,
+                .basic.raw_fms = 0xc2,
+            },
+        },
+        {
+            .name = "cache",
+            .p = {
+                /* Cache subleaves present. */
+                .basic.max_leaf = 4,
+                .cache.subleaf[0].type = 1,
+            },
+        },
+        {
+            .name = "feat#0",
+            .p = {
+                /* Subleaf 0 only with some valid bit. */
+                .basic.max_leaf = 7,
+                .feat.max_subleaf = 0,
+                .feat.fsgsbase = 1,
+            },
+        },
+        {
+            .name = "feat#1",
+            .p = {
+                /* Subleaf 1 only with some valid bit. */
+                .basic.max_leaf = 7,
+                .feat.max_subleaf = 1,
+                .feat.avx_vnni = 1,
+            },
+        },
+        {
+            .name = "topo",
+            .p = {
+                /* Topology subleaves present. */
+                .basic.max_leaf = 0xb,
+                .topo.subleaf[0].type = 1,
+            },
+        },
+        {
+            .name = "xstate",
+            .p = {
+                /* First subleaf always valid (and then non-zero). */
+                .basic.max_leaf = 0xd,
+                .xstate.xcr0_low = XSTATE_FP_SSE,
+            },
+        },
+        {
+            .name = "extd",
+            .p = {
+                /* Commonly available information only. */
+                .extd.max_leaf = 0x80000008,
+                .extd.maxphysaddr = 0x28,
+                .extd.maxlinaddr = 0x30,
+            },
+        },
+    };
+
+    printf("Testing CPUID maximum leaf shrinking:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+        struct cpuid_policy *p = memdup(&t->p);
+
+        p->basic.max_leaf = ARRAY_SIZE(p->basic.raw) - 1;
+        p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
+        p->extd.max_leaf = 0x80000000 | (ARRAY_SIZE(p->extd.raw) - 1);
+
+        x86_cpuid_policy_shrink_max_leaves(p);
+
+        /* Check the the resulting max (sub)leaf values against expecations. */
+        if ( p->basic.max_leaf != t->p.basic.max_leaf )
+             fail("  Test %s basic fail - expected %#x, got %#x\n",
+                  t->name, t->p.basic.max_leaf, p->basic.max_leaf);
+
+        if ( p->extd.max_leaf != t->p.extd.max_leaf )
+             fail("  Test %s extd fail - expected %#x, got %#x\n",
+                  t->name, t->p.extd.max_leaf, p->extd.max_leaf);
+
+        if ( p->feat.max_subleaf != t->p.feat.max_subleaf )
+             fail("  Test %s feat fail - expected %#x, got %#x\n",
+                  t->name, t->p.feat.max_subleaf, p->feat.max_subleaf);
+
+        free(p);
+    }
+}
+
 static void test_is_compatible_success(void)
 {
     static struct test {
@@ -889,6 +989,7 @@ int main(int argc, char **argv)
     test_cpuid_out_of_range_clearing();
     test_cpuid_get_leaf_failure();
     test_cpuid_get_leaf();
+    test_cpuid_maximum_leaf_shrinking();
 
     test_msr_serialise_success();
     test_msr_deserialise_failure();
diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
index 050cd4f9d1..86cda38986 100644
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -386,6 +386,13 @@ void x86_cpuid_policy_fill_native(struct cpuid_policy *p);
  */
 void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p);
 
+/**
+ * Shrink max leaf/subleaf values such that the last respective valid entry
+ * isn't all blank.  While permitted by the spec, such extraneous leaves may
+ * provide undue "hints" to guests.
+ */
+void x86_cpuid_policy_shrink_max_leaves(struct cpuid_policy *p);
+
 #ifdef __XEN__
 #include <public/arch-x86/xen.h>
 typedef XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_leaf_buffer_t;
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 924f882fc4..6a943cd91b 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -236,6 +236,45 @@ void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p)
                 ARRAY_SIZE(p->extd.raw) - 1);
 }
 
+void x86_cpuid_policy_shrink_max_leaves(struct cpuid_policy *p)
+{
+    unsigned int i;
+
+    p->basic.raw[0x4] = p->cache.raw[0];
+
+    for ( i = p->feat.max_subleaf; i; --i )
+        if ( p->feat.raw[i].a | p->feat.raw[i].b |
+             p->feat.raw[i].c | p->feat.raw[i].d )
+            break;
+    p->feat.max_subleaf = i;
+    p->basic.raw[0x7] = p->feat.raw[i];
+
+    p->basic.raw[0xb] = p->topo.raw[0];
+
+    /*
+     * Due to the way xstate gets handled in the hypervisor (see
+     * recalculate_xstate()) there is (for now at least) no need to fiddle
+     * with the xstate subleaves (IOW we assume they're already in consistent
+     * shape, for coming from either hardware or recalculate_xstate()).
+     */
+    p->basic.raw[0xd] = p->xstate.raw[0];
+
+    for ( i = p->basic.max_leaf; i; --i )
+        if ( p->basic.raw[i].a | p->basic.raw[i].b |
+             p->basic.raw[i].c | p->basic.raw[i].d )
+            break;
+    p->basic.max_leaf = i;
+
+    for ( i = p->extd.max_leaf & 0xffff; i; --i )
+        if ( p->extd.raw[i].a | p->extd.raw[i].b |
+             p->extd.raw[i].c | p->extd.raw[i].d )
+            break;
+    if ( i | p->extd.raw[0].b | p->extd.raw[0].c | p->extd.raw[0].d )
+        p->extd.max_leaf = 0x80000000 | i;
+    else
+        p->extd.max_leaf = 0;
+}
+
 const uint32_t *x86_cpuid_lookup_deep_deps(uint32_t feature)
 {
     static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
-- 
2.34.1


