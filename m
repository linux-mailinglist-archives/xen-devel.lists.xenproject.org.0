Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCD44951CE
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 16:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259122.447014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAZk1-0001f3-S1; Thu, 20 Jan 2022 15:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259122.447014; Thu, 20 Jan 2022 15:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAZk1-0001c0-Mz; Thu, 20 Jan 2022 15:52:49 +0000
Received: by outflank-mailman (input) for mailman id 259122;
 Thu, 20 Jan 2022 15:52:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWAP=SE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nAZjz-0001Xs-Vv
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 15:52:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0213d81c-7a09-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 16:52:46 +0100 (CET)
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
X-Inumbo-ID: 0213d81c-7a09-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642693966;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/E5gXn1X8HDAxjmzgIQf7U89X7jgYJtwhSG4jw2yA1g=;
  b=Q8vernFIncJ46YivISgPWhl/mxu++GNr6OK9t9rpAC6ZQ974lisjJCCv
   Df78d7iK0L/C/iNHRyt7XOkQC1shPLQVL45bF4IcwN3xZR7xqQlgPTsnL
   pHnvrQVqSx4TjbdCXtcp3fh2K9CcpQSEWf1lh2E0N301ZmWVa7NpgVSiU
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Tk8E8bF4dx7aq4BA0y24akDcU8gekjG0Wytb7XJ/w8AOz7oQnOR4qCFKKnrZ2+KnmxSvwnKf3l
 nLTjbB4rPKTgEQET7I9OGBVHLx9ClkyNtNlH63c4NYrleK/es1YQW81krLyiLPAV5iVCn5yd5n
 twNP1nZKuIIHsuoOJuUU/UZsn940rizO0kaDkeVGJ7+jFHVf7DH7j42LsrUvneBgyAnk++uVNs
 fV2W6l4OQADjExZ4nqM+CTqAS3NB975kEYFWWhtZHpHxaL5+r0hxB5DkWFJIMolxJGpudalN58
 d/QNBI9+A0sg4hZGQt0LRIyZ
X-SBRS: 5.2
X-MesageID: 62417152
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Bc/pd6md3Syn31wNUdaR7Vro5gxpIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaXm3VbKuJNjH2KIh1PNiyp0pU6pbTm9dqT1Bs/ytkFSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29Qw2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Npv6oSARBklBJTdwNwYdyVmFB1mZbITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glq2pkRRKuED
 yYfQWpzagvCZAJiAEkWNrEgociCu3ikeBQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCssTxDQ+pdDeEA0RDV8q/w3zieOnBcUWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZo87SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRON/Ni2+AswGzARN8wGCxFAXpU
 J8swZn20Qz2JcvR/BFhutklErCz/OqiOzbBm1NpFJRJ323zpyT9JN8AvG8ifRcB3iM4ldnBO
 hO7VeR5v8c7AZdXRfUvP9LZ5zoCkMAM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Aj+ND7n1glAv7GMCqpzz6gOH2TCPEFt843K6mM7pRxLmauz/c7
 9s3H5LMk32zpsWkPHmOmWPSRHhXRUUG6Wfe8pwOKbXbc1M4QQnMyZb5mNscRmCspIwM/s/g9
 XChQE5Ijl35gHzMMwKRbX5/LrjoWP5CQbgTZETA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:pE9QdaGHwbGG3EwtpLqFcpHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcT2/hsAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtdD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9854ud3AQV0gJ1XYJNu/xKDwOeOApP+tfKH
 LKjfA32QZINE5nJPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DLeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQv003MwmMm9yUkqp/FWGmLeXLzEO91a9Mwc/U/WuonhrdCsT9Tpd+CQd9k1wgq7VBaM0oN
 gsCZ4Y5o2mePVmGp6VNN1xMvdfNVa9NC4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.88,302,1635220800"; 
   d="scan'208";a="62417152"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGBciDsipHoV2Z5c6z1QSjDc5f7J/b+VFDEP/L4hXTiuNiaUVhhDZLuUDPjRlAGaMxT8L73YZ0BGdjeaVHhFZ6uk9pICl2wFvY/3DRlw+P62XNqFbmXQRyNvPBs4/bRfLjZ3bGnzCUv6J0icpAt0jI+7OdquQZZRgIfHv1h6Xj2TVnDOFBXkr5RPSaUOUeoCBcggL68bY1TKvur5FJ4LO9yoTkf6iNnlOe49kfyQ/XGYOBI6Gg5+cO8hemsPHWZkHzvAPgiS4u2HnMov0lPiOL3B7KSG0frYx2ssqNqCJzp4WHv+1D8VHp58Y6IyOdd/LC63QVqu4XoG36901SgQ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3jSrd20QaJ/193lbLMJWETxQp/+Zk8sQ9uQ4SYfQE0=;
 b=MR/i+TesQ5dBi4Ug4a+udWZessPPFXj0hDzctyhA+i36nAFViMMdnoAvIDmh4HsTQAmixhj8vxWVWIBADF7HxNxscfbWVZTMYBR8EtAj8wto9AkxsxxNz0gzeFLvt/WOZ3rfg3z7+SnpH4/vAS2W7BfplmheEX1XSMze/NMU4V+rJnSy4G4KTh42e1MkVqywSX72rQZKEb+A5y11NSIM0Pnho/EhS1Z1hgjFrnlxJjNAC1wI/6LkseMqYw3YG+B3o/iny0k2G1kv6ZLUPwm+pjssfrIHeVhDWxFWeaGIot9hvSCtVhSVs65O5SXKYa7tZnrx/0xTzKs0Sy0EK7vrPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3jSrd20QaJ/193lbLMJWETxQp/+Zk8sQ9uQ4SYfQE0=;
 b=PUEkbO0sPxi/aVQNXmyrGvOgEYPB/0ivfnS/gz/+t0OuXZAuPfWkPxQV6Nibsv03ZyZ3AVNkFfahdtVJi+WtTj0gPNu6aub3aE14zzP4SPWwKQdkbT6gz8nUDcX/LgWrfghGBEJJVjHdZsYcO7f3QJrpWL4Yar2sBK50iW2kMvI=
Date: Thu, 20 Jan 2022 16:52:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH RFC v2 4/5] x86/mwait-idle: enable interrupts before C1
 on Xeons
Message-ID: <YemFRFaKRanqgpSW@Air-de-Roger>
References: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
 <a0b3c3f6-2abc-353b-92f9-367fa57af8ef@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0b3c3f6-2abc-353b-92f9-367fa57af8ef@suse.com>
X-ClientProxiedBy: MR1P264CA0125.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8db2b7eb-1c8e-4708-8bf3-08d9dc2ce3c0
X-MS-TrafficTypeDiagnostic: DM8PR03MB6216:EE_
X-Microsoft-Antispam-PRVS: <DM8PR03MB6216BCCA98816F31224B9D918F5A9@DM8PR03MB6216.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cnyxpWPrLXsy822s9KqsuIDU2ujeAkZQR6zK4lls1kzlmhiQP5kcfsBvEBAEOlGqIAW5H4Bd5KZN73tteNn33EIeJUZXKXDcfLQHvvdwOm3TUwr+0PlnK1364QIMo/PxIUYfj0u9g+2H2Dx4XoNZ1l5x+ntsxrJ6hF4+wD/stCcOofyAGTPEBALE67KbFgQn8m6Xzy6C4xdwHXRuw2MN2FFXFexMWMnXxgCtEXAnjYbCc4cBKzS3t10U89xIj7EPU56ONuzyJUBnj4SUpQlcgVQkPu0D73qaBvabNPq0wKKK6DGuJKBL210R7MItYbyywR2bW31xMXp2d97Aw3CwwKzibeRM1kfUphLsDsmG3GZggf+/kZAI+y7N4OAycp6IOOjIHywFny4wqUmTy+3ps9fw5IphSot90GCuzs/QSuk9/zBuH8P32vVuFy+R+EmYgoVVH2QPfx7HFU77TYtKQ4u1xTvR8KMK4tZJW5ZCX3XbUtXa9YbXq6XBVtK53k/U2LXa4hYocIOGyUy8M1pqPsJwgp8x6uekvZtqm0opscWqfAEC5FgQRi8cs6b6wcuZAdLC2hWCngvNnfysiyrTSlYwbUi56kD/UiM9ifsZkN4eCOlsJo52csRmyQRArqEaW/tk8HwzAPcJgfI5kpe1+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66476007)(66946007)(6486002)(6916009)(33716001)(508600001)(66556008)(83380400001)(85182001)(86362001)(54906003)(38100700002)(6666004)(6506007)(316002)(82960400001)(2906002)(186003)(8676002)(9686003)(6512007)(4326008)(26005)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2puSlhNK1owK3diZ01ORHpMeFhlMUxoeDFKTFg4aFYzUWdKUTZlY0FBM001?=
 =?utf-8?B?end3MnFJRFFYNDZxMkJNY1dscWo2YWdMYWwvMXhzY29JMzR6L3NCZmtYRWhr?=
 =?utf-8?B?U1lVL3dMTmZMU3FlZDROaElnajd3V29WWVN2ZmlSOTF4NGlIcDlyWlFObUJ4?=
 =?utf-8?B?N1gyekM2OTRBNWtOUmZvWjJqMThKSjlTV2x5TlV1aE1SQnRzRVd6YjlDa0pE?=
 =?utf-8?B?SmRNd0RFRHIvYnFDZnpOWjJaUnhrbFFoOVA1RXA1UEtsTkR5WGtUWUpITW9S?=
 =?utf-8?B?Q2dlQk1QblROSTd1YWxqMHpJeXA4OFBJVHdhNkFRSldnY2U5ZGpsT3JKQlJR?=
 =?utf-8?B?dVFYMHFoQnNzVGJnYmlDbzZVdXNycUNXY2d0amFSUXpVa3Fsck1WS3VZeXFT?=
 =?utf-8?B?L2phYlFReThsZHhjd0dPM2hsS2VGWjJmNHY0M2NlYnNSK0gzTThvRnVabXYv?=
 =?utf-8?B?MW8wdWZDbmF0ZTBBN25QVVR3aDd5cThML205UHdNNGFVUHRpOXF4a2o4b2pY?=
 =?utf-8?B?S1dJZ0hRY1ZLTUY2TXB1dzBaeHJFaHZncXFHMDZqMjEwZ2crcWtGSm9mVmdy?=
 =?utf-8?B?YWhuY1FXNVZIbVF1Sk4zUUZQUkN3N1Z6YXlrc0swNlliQ2R2N3RJczZWK2dX?=
 =?utf-8?B?TndFaFFwSzJpckZkaHdUc3pnSWNWRUhCSlM2M3Z6MTRBd2ZGdGQzQlNXOFlD?=
 =?utf-8?B?OENjWDFjQTNvR2laSnpTRkJYUk5VL2pSS1ZMUTlNTk8wcXgrSGlPb2dyeUt2?=
 =?utf-8?B?b2pHbHdLazZyV25scnN6QngxZzUwaXlSSlEzYXlxcTBZU3paQ1Z5ZUxzbXBI?=
 =?utf-8?B?clpzSkNXcm85emVqYnVXU1l6ZXo3bDNBZnk4SERLeEo2TTdvaDQ3d1NxMG1F?=
 =?utf-8?B?R2dMYzFzS0xaY3d6c2hlSFR6K0dLWEZBbDF6VEdBSnp6d21wVmd1RzRsa0Jr?=
 =?utf-8?B?c0EvQnBNM1g2NUhtbFc0TjN1K0QrMWtLZEltNTRGOHQ5MFpEdlFCUVN0Rjlj?=
 =?utf-8?B?NFY0Q21HZHZpbDlmdDlCL3oxRkU1OEJHNmljcnJERU1LeXFKVEY2VHEyaFI0?=
 =?utf-8?B?SzFKMjdTTmI1eGlmQkxYTGVmd0pzRTJjOEYxVklqcURNbGlVQUovNWZCYjc0?=
 =?utf-8?B?WS91TkVoL2FyWXdTd1dMVzUyTzdMUFd6T1hObUdxblJHVklzaUZDdmtNT244?=
 =?utf-8?B?d0RlV1JFNHFwekpYeDh1Rjg5M2NVZ1d0NEQwQ2ZCelB1K1Jpc25PakFvc292?=
 =?utf-8?B?L0E5TXZOUUhpNzVIOFNCcVczNUpaTTR1cDcvK0tmN24yNkVHa05CdUZtL1pl?=
 =?utf-8?B?WmVBMjJVYUtLaWlMZ0xtTERTVWJZeVQzam9UZFU3ZDl3aE1oRGlFTzBRVlVW?=
 =?utf-8?B?VjZUY3JXQktaQlh1Zld0QWVpQVZ1Z0MwTFV2b3pRWnJlMG9TOW9WbytpUEx3?=
 =?utf-8?B?bEtDRzI4UWdmUEtoY3VGamw5VlpOcHZtSWlLeVZtVDJUUlVkZ1ZkQVRYaUMx?=
 =?utf-8?B?NXh4cUtSWWVWSVV0QjdrRmovTXJNaG9EdUpCaHd3anMvendqbXBwcTlDcFhL?=
 =?utf-8?B?TXE4NGkwQk9pS1ZlV2ltaC9KRjZNMllrNkI3Tkh0QVpZTEoyWTBoRVJ1Lzlj?=
 =?utf-8?B?L2JrWWcxU2RMNjJIcVppMUdCVng0Y3FJK3U2ZnRZUEtDNzRFUVY4VlhCY0cx?=
 =?utf-8?B?UWlnRFFSdHF5QjgwbVhUVmNYS0w5WTd4Z1MwcmQ3VkduUjBTUVNBS2lvNFVk?=
 =?utf-8?B?dFJyNnFKQTNSQjhDNXRkQTVmUEZOYWc2NkhvREJZN0ljQTlqYkRQeXZ6dUhI?=
 =?utf-8?B?V0tnUjB1cVp3c25wbkowZ3k0NE1RdHhTcGY2Mi9ZTTNhN2NSVmcrNllGdHdw?=
 =?utf-8?B?SGdEeFo4ajkzYW5HMFc4eG9oUktTOWdRMnlhL3dNcXRveEoxNkpRTHNKU0RM?=
 =?utf-8?B?RFkvakUrVVZHOERhMTIveW9UdldSb2sveGNKa1NGMWVZT1RhOCs3Zjg3dVZT?=
 =?utf-8?B?akMrc1hrY1VqQ1ZxZlhTZVRqblZrVXNJVXEyeEM1SkorOVhsVVR5WXlsb0FY?=
 =?utf-8?B?M21FOVMzN0FVa1JVM05kemRNOERrWmMzOXlLbi8xUzNOeWhCRmlOOHd1SnBN?=
 =?utf-8?B?TXNDZHdZQWRhem1menRrZGdwNVZZNVhLcXZ2bTZqVmtvODdVS2J4emZDZ2xE?=
 =?utf-8?Q?px8B4O1Vesyx3nezm0eE/so=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db2b7eb-1c8e-4708-8bf3-08d9dc2ce3c0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 15:52:40.9697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ti5Fh98NPIyR9pYMFLPdY3mvP/X2J6vkE3rkvmx0Un5OvSQyu/TNC0Rp4rFmVvlQ032R1zNfVvYtB9dZjuc5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6216
X-OriginatorOrg: citrix.com

On Thu, Jan 20, 2022 at 03:04:39PM +0100, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Enable local interrupts before requesting C1 on the last two generations
> of Intel Xeon platforms: Sky Lake, Cascade Lake, Cooper Lake, Ice Lake.
> This decreases average C1 interrupt latency by about 5-10%, as measured
> with the 'wult' tool.
> 
> The '->enter()' function of the driver enters C-states with local
> interrupts disabled by executing the 'monitor' and 'mwait' pair of
> instructions. If an interrupt happens, the CPU exits the C-state and
> continues executing instructions after 'mwait'. It does not jump to
> the interrupt handler, because local interrupts are disabled. The
> cpuidle subsystem enables interrupts a bit later, after doing some
> housekeeping.
> 
> With this patch, we enable local interrupts before requesting C1. In
> this case, if the CPU wakes up because of an interrupt, it will jump
> to the interrupt handler right away. The cpuidle housekeeping will be
> done after the pending interrupt(s) are handled.
> 
> Enabling interrupts before entering a C-state has measurable impact
> for faster C-states, like C1. Deeper, but slower C-states like C6 do
> not really benefit from this sort of change, because their latency is
> a lot higher comparing to the delay added by cpuidle housekeeping.
> 
> This change was also tested with cyclictest and dbench. In case of Ice
> Lake, the average cyclictest latency decreased by 5.1%, and the average
> 'dbench' throughput increased by about 0.8%. Both tests were run for 4
> hours with only C1 enabled (all other idle states, including 'POLL',
> were disabled). CPU frequency was pinned to HFM, and uncore frequency
> was pinned to the maximum value. The other platforms had similar
> single-digit percentage improvements.
> 
> It is worth noting that this patch affects 'cpuidle' statistics a tiny
> bit.  Before this patch, C1 residency did not include the interrupt
> handling time, but with this patch, it will include it. This is similar
> to what happens in case of the 'POLL' state, which also runs with
> interrupts enabled.
> 
> Suggested-by: Len Brown <len.brown@intel.com>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> [Linux commit: c227233ad64c77e57db738ab0e46439db71822a3]
> 
> We don't have a pointer into cpuidle_state_table[] readily available.
> To compensate, make use of the new flag only appearing for C1 and hence
> only in the first table entry.

We could likely use the 8 padding bits in acpi_processor_cx between
entry_method and method to store a flags field?

It would seems more resilient, as I guess at some point we could
enable interrupts for further states?

> 
> Unlike Linux we want to disable IRQs again after MWAITing, as
> subsequently invoked functions assume so.

I'm also wondering whether there could be interrupts that rely on some
of the housekeeping that's done when returning from mwait. I guess
it's unlikely for an interrupt handler to have anything to do with the
TSC not having been restored.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I think it's important to keep in sync with our upstream that's Linux
there.

Albeit I would prefer if we could carry the flags into acpi_processor_cx.

Thanks, Roger.

