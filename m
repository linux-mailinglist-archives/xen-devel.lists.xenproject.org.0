Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A9A4CFFC6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 14:17:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286029.485348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRDET-0005v4-7F; Mon, 07 Mar 2022 13:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286029.485348; Mon, 07 Mar 2022 13:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRDET-0005s8-3s; Mon, 07 Mar 2022 13:17:01 +0000
Received: by outflank-mailman (input) for mailman id 286029;
 Mon, 07 Mar 2022 13:16:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NixE=TS=citrix.com=prvs=05809d0ec=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nRDER-0005s2-OO
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 13:16:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd264158-9e18-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 14:16:58 +0100 (CET)
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
X-Inumbo-ID: dd264158-9e18-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646659017;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=c+k+7/LIv5GOwGrRzB9qcjoW4h3ycch/t2uRfEac1Jc=;
  b=cl9fdr+MpUiNPAOkkOP4JL27ZtwTvgYteBoKJlIj43x/aQ4zcCDIL47k
   M19ymOu1xGXCYFTUlYWrgCUOlxPi1o+NpTnQVGv6hafnLNIzOpWTQmLNA
   inolW1ovcCSCLaK2g+uExBt/bs8wq9Q9F133H8zwHFYCL+SV4HnvWqAjr
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66009736
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:laWaXKpZQRkHHXtwG2YP/+3GAH1eBmK1ZRIvgKrLsJaIsI4StFCzt
 garIBmEbK3eMzf1f4t+ao3lpkhT7Z7Ty9JjTQY6pS0yQy0X9puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 Yyq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBLvHwuacdCBJjCjxQAL185ZuWByG2vpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI7zjfALADSJTKR6zM6PdT3Ssqh9AIFvHbD
 yYcQWQxNEyRPEYRUrsRIKAHuOH531nASTRJtwqovY9puHT47CUkhdABN/KKI4fXFK25hH2wr
 G/c437wBB1cMdWF0CeE6VqlnOqJliT+MKosE7m/+u9vkUek7GUZAx0LVnO2ufC8zEW5Xrp3K
 VESvCwnrqEw9UmiZtj7QxC85nWDu3Y0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 neKks3oA3pzsbSTYXOb6rqQ6zi1PEA9MmsqdSICCwwf7LHLoos+kxbORdZLC7Oug5v+HjSY6
 zKFti8lnJ0IkNUGka68+DjvmCmwr5LESgo04AT/XW+/6A59Iom/aOSA60Xf7PtGBJaUSB+Gp
 ndspiSFxLlQV9fXznXLGbhTWuHyjxqYDNHCqU4zI7hi92+mwGe+U71A2ixadWEwO8lRLFcFf
 3TvkQ9W4ZZSOl6jYql2f5+9BqwW8ETwKTj2fquKN4QTO/CdYCfCpXgzPhDIgwgBhWBxyflXB
 HuNTSq74Z/244xDxSH+eeoS2KRDKssWlTKKHsCTI/hKPNOjiJ+ppVUtbQHmggMRtvrsTODpH
 zF3bZfi9vmneLeiChQ7CKZKRbzwEVA1BIrtt+tcffOZLwxtFQkJUqGNn+5wJdQ6xPQFyo8kG
 01RvWcClDLCaYDvc13WOhiPlpu1NXqAkZ7LFXN1Zgv5s5TSSY2u8L0eZ/MKkUoPr4ReIQpPZ
 6BdIa2oW60XIhyeomh1RcSt/eRKKUXw7SrTbnXNXdTKV8M5L+A/0oS/JVWHGehnJnffiPbSV
 JX7jlKLGcdYHl86ZCsUAdr2p26MUbEmsLsad2PDI8VJeVWq945vKifrieQwLd1KIhLGrgZ2H
 S7PafvEjYEhe7MIzeQ=
IronPort-HdrOrdr: A9a23:wmgwoKPxpdrf4MBcT2z155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjzjSWE9Qr4WBkb6LW90DHpewKSyXcH2/hsAV7EZniphILIFvAv0WKG+VPd8kLFh5dgPM
 tbAstD4ZjLfCJHZKXBkUiF+rQbsaG6GcmT7I+0pRYMcegpUdAa0+4QMHfBLqQcfngjOXNNLu
 v72iMxnUvGRZ14VLXYOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPcf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcdcsvy5zXIISdOUmRIXee
 r30lAd1gNImjXsl1SO0F7QMs/boW8TAjHZuAelaDDY0LPErXoBerR8bMRiA0HkAgMbzaBB+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jdiuCQlGcpsRKEkjQpo+a07bWrHAUEcYZ
 1TJdCZ4OwTfUKRbnjfsGUqyNuwXm4rFhPDRkQZoMSa3zVfgXg8liIjtYEit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4AOsaW8O4BmHEXBqJOmOPJlbsEr0BJhv22tTKyaRw4PvvdI0DzZM0lp
 iEWFREtXQqc0arEsGK1I0jyGG6fIx8Z0Wb9ihz3ekLhlSnfsuaDcSqciFdr/ed
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="66009736"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jC5+Yp+iCWLGwNHi0cEVWCCYJ/CvKb7k3oGDLA3hHB2A8PKGyMMWn+g5cGSXYqEoMCoPmWaSVc6rxv0ikvFBcmRwVZyoitxf570daQWa7p/E9dBZH72en1DmWTplNVM3pEfqI0EzEg2gn5hlZynwvQHlPgfkldvzTbkxoQj/paBmMJfEm2WCgx4CWD0MK5a/Gjzhb4K6/a7oR1/Y4Neh5iCpT0Nl2XtIaMchs3dxZ9dgiEXqqZHwL8V0aWfWJeWfUdjepudqlGCm4uinRLgLna3e/4tKpe5iW8NpyOEczXOxXoR54Znm/JZCB0k7IVWDye3FVMwM+w46pxJBWEfXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+k+7/LIv5GOwGrRzB9qcjoW4h3ycch/t2uRfEac1Jc=;
 b=Wzy3NPTcwSUas0B9reLxwPHDPbJQHLR9SuvwF5grxwX9+JwNnSsCB4aF2lBj/IK/O9cp+L6lFEOjMaukeTiHw71NIe7W/dJ08ugidjMyHgHObxMWnNaaE43S9Z3pl+EJpkMC78+Y4SeSxIaNO2ph+ZnhYM+iqVfNnPt5Qjhs4N9NtpIznh48sbi3T+/3Vj+duXSZKhYXwq5DtAiKqQ3LyAoR4Dg0cYTomUYtiKJNrheeOhujDC1q0mQh8lGOQoD0RXVILgYzmVhTZttyJGbLQPSdt2RQ7wGKdnrTyEcDE1B14Jo6PFq5tTTCqZyMeBlhdfCauvwkX86Fk1vTS0A3cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+k+7/LIv5GOwGrRzB9qcjoW4h3ycch/t2uRfEac1Jc=;
 b=uOfmUfA79IZKpEN/iz0W/v2K/9JrlC2z2tMK3G2DX30HUit+JRG4HdLLJoH0gTzcOf/EzYsRPhxrraNDd/2vFLZygRPj0GeBXeYlj2LR/8eABI5mXfUZ2AEa21lCJeqw++ZWi9/i4BGCJ4tum6vRdWt6WwtWAc9DQKpepjbpzOg=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v4 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYLkaMjdZBkrS3CkWZwGsOatNz36ytiXSAgABT+oCAAQaGAIAE+jyAgAADxgCAAAyyAA==
Date: Mon, 7 Mar 2022 13:16:52 +0000
Message-ID: <0d0dc2f0-470e-4ef7-ff88-f411ba79617d@citrix.com>
References: <20220302150056.14381-1-jane.malalane@citrix.com>
 <20220302150056.14381-2-jane.malalane@citrix.com>
 <240602ab-412c-8607-ed6c-916cf37343f7@suse.com>
 <67296830-aa16-4231-69ba-f07d2b1a4b65@citrix.com>
 <fa957ce7-07f8-9726-9537-8b05e9b6d76e@suse.com>
 <ee556d51-bcf7-5749-6e3a-92d1ec3092f9@citrix.com>
 <299a0fe4-e7c0-b381-4318-a27f02c96d98@suse.com>
In-Reply-To: <299a0fe4-e7c0-b381-4318-a27f02c96d98@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3b9c6b2-b869-4981-433e-08da003cbed3
x-ms-traffictypediagnostic: BN7PR03MB3826:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <BN7PR03MB38269F63CB789A3B4EAE650B81089@BN7PR03MB3826.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iJwSaFkkWvyHViuhWH0evcAqEGQqdVuAxkWA5kxZhXMbYPomMBK8KqNNFAXDle64DMfgQZqxmxIOkyrKGNSVCGiGDVctBr4ZNKTo0J1aFmyVAYivZNaIAqMw/4xAA17DW94vACIrv8n5yWAoA/rQB4mYX2N+vrUf3Xi2hf1ZubMw35O0vbmPbv2hL9AHTUt5d8RvFnvt6dI1wqxvINQfdvfxxT8EhGAS/UniljlfPZ7bsItO5Rv0urDJUZUL9sB4aLIvlFeueW9cwjevT0aeREd4EosatuguqwQxu882BHozAamA0YrvZyDr5UPR/oHVTondjKrHTGBqefPCTECBPD9NKk1nFKBdB7sM5o7tIPTOI4J301NnofNtejikBVMA/t4Eh+KSL9+N3EcTIC1WtONTSL9wT5IwNOLFbT32SYYeyPtx+qfk0sT6hOYurHhbzvwUm1cUK1bb15vK9UNF/5/Aicy+A3qG+Afb5r02TqgsqIabFFmlB+4VnTFZlhXOgD300olhK8sTmLzhSioRSwX9BoZOcXrvaELDUt0O5lBggmJDwT3e4DgVuPX+8Q6h3JQ3WQo4a57ncbNFDeuBvFUrZ7DyDIyOrxhJpSU2al3IWmxqlmX3CnlB4BuZq3/xz83Fiid/Q+Ldif6o/ENM29YAjtyDIWyhsCjXFmXYkFHcvYwEL25jTylnmha48JMeeNF4x9PrSU282VTsGMKHckiXeCfYt4p3eKnXVkYIN2swDPl2B/G/YB4lLlLlRazq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(36756003)(83380400001)(186003)(2906002)(2616005)(31686004)(7416002)(54906003)(316002)(38070700005)(5660300002)(82960400001)(6916009)(71200400001)(6512007)(6486002)(8936002)(508600001)(122000001)(91956017)(76116006)(31696002)(53546011)(66476007)(86362001)(66946007)(6506007)(4326008)(64756008)(66446008)(66556008)(8676002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3lBU2RpbUU3eVNTQTJBMmxKV1l4dlNtZWl1K3hna2NRSTJPR1pCSDYycTVH?=
 =?utf-8?B?cWFza0lCNWdZUk5kSi8zRC9aNXBXcVdReEJMQ3p4Wm4zdHk0V05tVjJEb0Vo?=
 =?utf-8?B?Vkx1QWpmZlpWMHRlYWRXakxVUU9RRytGUGQzclpHRmhXaTA0TlNIZDByT0RD?=
 =?utf-8?B?enNwMEFiRGdKWFB0RG85QUpaRUVoNmdlTWVIb1hBdy9TSTFSNU9PMWlORDZk?=
 =?utf-8?B?eUJsZ0RPenV4VnpuaWNoR2w4YklaSFQwYzNpKzJVWitvQjV4N0JCNUw2RHMv?=
 =?utf-8?B?LzNmRGpqVCtQN2ZVR1puNjRCZ0JmZGJjdnUvN0ZrbVFHSEIzYXdmd0pPWnU0?=
 =?utf-8?B?V0I1Mk1sdGs4cFIyVXBnMzRSQ25MTkxwWG4yV21peWlrRDFJaWVrVWQyRXUw?=
 =?utf-8?B?MnNNZnJmN1lqWnUyTy84UUJqSktYR3o1VWFGcWxWeWJtNktyelBqbHpSNG1Y?=
 =?utf-8?B?M1AvK2VNZm53YzdVQ0NoSS9hOXJHakR5V0k1UDFKbDZodVBqOVpWeFg5MnlQ?=
 =?utf-8?B?TXJ1d0tEY29TVjQvYTFVcmJQMjZSZE5ER3lhZ1p4WDNraFNKVFFXNzl6eEVG?=
 =?utf-8?B?eWhVTXJNNzhEd0ZqblJEY2dBUFZWbFJzK1FMV1QrbzNiVUQ5Y3A4NlVRdW9p?=
 =?utf-8?B?cWQzSmxKT1AzN2JvZENIOXFkVE5DUTJudmFoenc0SE9haGVKS1cwSnUrU2hj?=
 =?utf-8?B?TnkwdGZkT2l4SERlTEczRmNKNmpTZE54TkFxWlAxaFZSK3ZkRXh6SXB4c2g0?=
 =?utf-8?B?ak4wekszRndpNi8xM3JueWtSOWdHeFBBZW9zdzNtWkJDelZOdVlFb0NOVm1i?=
 =?utf-8?B?TlFCTThRSWl5dE9xZ013K2I1NFd5RXoxV0trU2ZabTVmVjV5WTU2d3d1ajJT?=
 =?utf-8?B?cENMM3laSnhhUUlNc2lJWnBubUd0ZHd3RGhKcldQNk81NVN1dXRydytocHBh?=
 =?utf-8?B?a291MnJDWkdnU2EvRTc1WTVRUkx4OVduYjVLNHRzWGZqei8rNm0xeGZyc3NI?=
 =?utf-8?B?WC9yRlFNcytSa1BUR2ZiRE52MDNDRjRMeUlqRDlmWWRkZFNsUmRncDVkdjJs?=
 =?utf-8?B?a25pMTF6WVpiWVJ5d09wZVNMNnhsTnBUb0V2Wk9nU21kY3NTWmhmTElJSWkw?=
 =?utf-8?B?RjBNa3FmZGpuQmNocmhpdC9CZTQzOGtWK2E5SlFDL2wwdmdycUdKSWcrcndW?=
 =?utf-8?B?T0xCQUZhejZQOFVPRmdqZG02cEdnbVkvMzQ3Vm90LzJxVUdtZmJNekVwS041?=
 =?utf-8?B?QytpWEkxSEdNWFlRT210MzVrUWpEQ0orVEVEOWlwRi9UK3BST1I0WHFrN2dM?=
 =?utf-8?B?YVBybXZCRzlRY2lIZmtIZlVCQk52OEZvaUJlM1ZucGVaaEpRT2o0QTVnNUtK?=
 =?utf-8?B?UDZod0IvTWkwVnNvUzFndmZkdWs1WHhpUTRJVnpkVmdNdGJTTXRJK0dKUW9w?=
 =?utf-8?B?OXBsZDdRS0h1TWUwWTMrUWNBK1FoaW5KbFV1cDFTbkRmZ2VCNXcxendmclp5?=
 =?utf-8?B?bHg1bUZaM1FjaHA3YUJOaG1XeTQvRFBKUU9jOG5oYVkrVmtMU2FqcDhJMnBB?=
 =?utf-8?B?ajRZakluRk1xNFA2Z1FWZ0tCUlJVMFBFRENvRUNrN2hRbFQzTC82Y2xDaldU?=
 =?utf-8?B?eDRNTDlpK1lqTkw1ekJrNEdTdkpEcEVuMGdhZENidWtaa05wanlEQ2EyWG9u?=
 =?utf-8?B?V0ZaY21GUkQyK2ltT3FxeWVEQXh1WlEyVWVLcVJBQ1BKYnRCb3BtVzEwbVQ3?=
 =?utf-8?B?cXRJWllaWTNscTF5WGpnZktFaTUrNmRhYVd6ZTUyWGt4eGJyOUtQVEZtamYx?=
 =?utf-8?B?RmZCamhTK3JIbGlOMGowdmVNWTEwbW9rVWh0aDNOQ3FKRWdBSDBZSkkwUVdn?=
 =?utf-8?B?QVdrTDdUZ3MxNjQyTklBVU1hcXN0QnZ5Vlk2clpOWWNMZTRoK2ZCWVBDaDJl?=
 =?utf-8?B?QUpqZjdKN0oycncxWHVXWTh2cTBSUkI3eWlkYzJNWDMrYTB5UjhLOWRsOHZF?=
 =?utf-8?B?eHlsdy9BT2xTYzBDYldDR1VRZ0tPUmZZdnk5RUhEU1pQc1VMSmhha0pFVklv?=
 =?utf-8?B?dmdKQzZlQldSOFhJajFxSDR5SVNma0dUL1JRZFA1b2N4SDhqWmZkUFd3WXVy?=
 =?utf-8?B?MVpjWnduMHAvWVR2bkY3ZFVLZXFUZUxmSWtteGVJcWpJcW1WVklEVXdTMHpl?=
 =?utf-8?B?dzRJWGo1RGpkMDJtVjQ5dU11SFp1KzNHMG1oS2tRNkM1bjQ2cWZiZGVwTktk?=
 =?utf-8?Q?97gD7Ik/7zoYVp0ocEBT+B78LWaAGphcOJElL0xFPs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BB1C3518079D24CA36CD610F7753FD6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b9c6b2-b869-4981-433e-08da003cbed3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 13:16:52.3869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N2/s6AOWvg2Q/Y5xKhM7cwmWvwrTy+t1SJyjPayU+m4Tav/NlRdgAdHQGXsgLufght7x30zOUh/0sLxm3+P+n0QY//fSS5EaPSK3HqfsV9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3826
X-OriginatorOrg: citrix.com

T24gMDcvMDMvMjAyMiAxMjozMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDA3LjAzLjIwMjIgMTM6MTcsIEphbmUgTWFsYWxhbmUgd3Jv
dGU6DQo+PiBPbiAwNC8wMy8yMDIyIDA4OjE3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBbQ0FV
VElPTiAtIEVYVEVSTkFMIEVNQUlMXSBETyBOT1QgcmVwbHksIGNsaWNrIGxpbmtzLCBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIGFuZCBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+Pj4NCj4+PiBPbiAwMy4wMy4yMDIyIDE3OjM3LCBKYW5l
IE1hbGFsYW5lIHdyb3RlOg0KPj4+PiBPbiAwMy8wMy8yMDIyIDExOjM3LCBKYW4gQmV1bGljaCB3
cm90ZToNCj4+Pj4+IE9uIDAyLjAzLjIwMjIgMTY6MDAsIEphbmUgTWFsYWxhbmUgd3JvdGU6DQo+
Pj4+Pj4gQWRkIFhFTl9TWVNDVExfUEhZU0NBUF9BUkNIX0FTU0lTVEVEX3hhcGljIGFuZA0KPj4+
Pj4+IFhFTl9TWVNDVExfUEhZU0NBUF9BUkNIX0FTU0lTVEVEX3gyYXBpYyB0byByZXBvcnQgYWNj
ZWxlcmF0ZWQgeGFwaWMNCj4+Pj4+PiBhbmQgeDJhcGljLCBvbiB4ODYgaGFyZHdhcmUuDQo+Pj4+
Pj4gTm8gc3VjaCBmZWF0dXJlcyBhcmUgY3VycmVudGx5IGltcGxlbWVudGVkIG9uIEFNRCBoYXJk
d2FyZS4NCj4+Pj4+Pg0KPj4+Pj4+IEZvciB0aGF0IHB1cnBvc2UsIGFsc28gYWRkIGFuIGFyY2gt
c3BlY2lmaWMgImNhcGFiaWxpdGllcyIgcGFyYW1ldGVyDQo+Pj4+Pj4gdG8gc3RydWN0IHhlbl9z
eXNjdGxfcGh5c2luZm8uDQo+Pj4+Pj4NCj4+Pj4+PiBOb3RlIHRoYXQgdGhpcyBpbnRlcmZhY2Ug
aXMgaW50ZW5kZWQgdG8gYmUgY29tcGF0aWJsZSB3aXRoIEFNRCBzbyB0aGF0DQo+Pj4+Pj4gQVZJ
QyBzdXBwb3J0IGNhbiBiZSBpbnRyb2R1Y2VkIGluIGEgZnV0dXJlIHBhdGNoLiBVbmxpa2UgSW50
ZWwgdGhhdA0KPj4+Pj4+IGhhcyBtdWx0aXBsZSBjb250cm9scyBmb3IgQVBJQyBWaXJ0dWFsaXph
dGlvbiwgQU1EIGhhcyBvbmUgZ2xvYmFsDQo+Pj4+Pj4gJ0FWSUMgRW5hYmxlJyBjb250cm9sIGJp
dCwgc28gZmluZS1ncmFpbmluZyBvZiBBUElDIHZpcnR1YWxpemF0aW9uDQo+Pj4+Pj4gY29udHJv
bCBjYW5ub3QgYmUgZG9uZSBvbiBhIGNvbW1vbiBpbnRlcmZhY2UuIFRoZXJlZm9yZSwgZm9yIHhB
UElDIEhXDQo+Pj4+Pj4gYXNzaXN0ZWQgdmlydHVhbGl6YXRpb24gc3VwcG9ydCB0byBiZSByZXBv
cnRlZCwgSFcgbXVzdCBzdXBwb3J0DQo+Pj4+Pj4gdmlydHVhbGl6ZV9hcGljX2FjY2Vzc2VzIGFz
IHdlbGwgYXMgYXBpY19yZWdfdmlydC4NCj4+Pj4+DQo+Pj4+PiBPa2F5LCBoZXJlIHlvdSBub3cg
ZGVzY3JpYmUgX3doYXRfIGlzIGJlaW5nIGltcGxlbWVudGVkLCBidXQgSSdtDQo+Pj4+PiBhZnJh
aWQgaXQgc3RpbGwgbGFja3MganVzdGlmaWNhdGlvbiAoYmV5b25kIG1ha2luZyB0aGlzIHJlLXVz
YWJsZSBmb3INCj4+Pj4+IEFWSUMsIHdoaWNoIGltbyBjYW4gb25seSBiZSBhIHNlY29uZGFyeSBn
b2FsKS4gWW91IGFjdHVhbGx5IHNheSAuLi4NCj4+IElzIHRoZSBmb2xsb3dpbmcgYW55IGJldHRl
ci4uLj8NCj4+DQo+PiAiQWRkIFhFTl9TWVNDVExfUEhZU0NBUF9BUkNIX0FTU0lTVEVEX3hhcGlj
IGFuZA0KPj4gWEVOX1NZU0NUTF9QSFlTQ0FQX0FSQ0hfQVNTSVNURURfeDJhcGljIHRvIHJlcG9y
dCBhY2NlbGVyYXRlZCB4YXBpYw0KPj4gYW5kIHgyYXBpYywgb24geDg2IGhhcmR3YXJlLg0KPj4g
Tm8gc3VjaCBmZWF0dXJlcyBhcmUgY3VycmVudGx5IGltcGxlbWVudGVkIG9uIEFNRCBoYXJkd2Fy
ZS4NCj4+DQo+PiBIVyBhc3Npc3RlZCB4QVBJQyB2aXJ0dWFsaXphdGlvbiB3aWxsIGJlIHJlcG9y
dGVkIGlmIEhXLCBhdCB0aGUgbWluaW11bSwNCj4+ICAgIHN1cHBvcnRzIHZpcnR1YWxpemVfYXBp
Y19hY2Nlc3NlcyBhcyB0aGlzIGZlYXR1cmUgYWxvbmUgbWVhbnMgdGhhdCBhbg0KPj4gYWNjZXNz
IHRvIHRoZSBBUElDIHBhZ2Ugd2lsbCBjYXVzZSBhbiBBUElDLWFjY2VzcyBWTSBleGl0LiBBbg0K
Pj4gQVBJQy1hY2Nlc3MgVk0gZXhpdCBwcm92aWRlcyBhIFZNTSB3aXRoIGluZm9ybWF0aW9uIGFi
b3V0IHRoZSBhY2Nlc3MNCj4+IGNhdXNpbmcgdGhlIFZNIGV4aXQsIHVubGlrZSBhIHJlZ3VsYXIg
RVBUIGZhdWx0LCB0aHVzIHNpbXBsaWZ5aW5nIHNvbWUNCj4+IGludGVybmFsIGhhbmRsaW5nLg0K
Pj4NCj4+IEhXIGFzc2lzdGVkIHgyQVBJQyB2aXJ0dWFsaXphdGlvbiB3aWxsIGJlIHJlcG9ydGVk
IGlmIEhXIHN1cHBvcnRzDQo+PiB2aXJ0dWFsaXplX3gyYXBpY19tb2RlIGFuZCwgYXQgbGVhc3Qs
IGVpdGhlciBhcGljX3JlZ192aXJ0IG9yDQo+PiB2aXJ0dWFsX2ludHJfZGVsaXZlcnkuIFRoaXMg
aXMgZHVlIHRvIGFwaWNfcmVnX3ZpcnQgYW5kDQo+PiB2aXJ0dWFsX2ludHJfZGVsaXZlcnkgcHJl
dmVudGluZyBhIFZNIGV4aXQgZnJvbSBvY2N1cmluZyBvciBhdCBsZWFzdA0KPj4gcmVwbGFjaW5n
IGEgcmVndWxhciBFUFQgZmF1bHQgVk0tZXhpdCB3aXRoIGFuIEFQSUMtYWNjZXNzIFZNLWV4aXQg
b24NCj4+IHJlYWQgYW5kIHdyaXRlIEFQSUMgYWNjZXNzZXMsIHJlc3BlY3RpdmVseS4NCj4+IFRo
aXMgYWxzbyBtZWFucyB0aGF0IHN5c2N0bCBmb2xsb3dzIHRoZSBjb25kaXRpb25hbHMgaW4NCj4+
IHZteF92bGFwaWNfbXNyX2NoYW5nZWQoKS4NCj4+DQo+PiBGb3IgdGhhdCBwdXJwb3NlLCBhbHNv
IGFkZCBhbiBhcmNoLXNwZWNpZmljICJjYXBhYmlsaXRpZXMiIHBhcmFtZXRlcg0KPj4gdG8gc3Ry
dWN0IHhlbl9zeXNjdGxfcGh5c2luZm8uDQo+Pg0KPj4gTm90ZSB0aGF0IHRoaXMgaW50ZXJmYWNl
IGlzIGludGVuZGVkIHRvIGJlIGNvbXBhdGlibGUgd2l0aCBBTUQgc28gdGhhdA0KPj4gQVZJQyBz
dXBwb3J0IGNhbiBiZSBpbnRyb2R1Y2VkIGluIGEgZnV0dXJlIHBhdGNoLiBVbmxpa2UgSW50ZWwg
dGhhdA0KPj4gaGFzIG11bHRpcGxlIGNvbnRyb2xzIGZvciBBUElDIFZpcnR1YWxpemF0aW9uLCBB
TUQgaGFzIG9uZSBnbG9iYWwNCj4+ICdBVklDIEVuYWJsZScgY29udHJvbCBiaXQsIHNvIGZpbmUt
Z3JhaW5pbmcgb2YgQVBJQyB2aXJ0dWFsaXphdGlvbg0KPj4gY29udHJvbCBjYW5ub3QgYmUgZG9u
ZSBvbiBhIGNvbW1vbiBpbnRlcmZhY2UuIg0KPiANCj4gWWVzLCB0aGlzIGxvb2tzIHF1aXRlIGEg
Yml0IGJldHRlciwgdGhhbmtzLiBBc3N1bWluZywgb2YgY291cnNlLCBpdCdzDQo+IGluIHN5bmMg
d2l0aCB0aGUgY29kZSBpbiB2NSAuLi4NClllcywgb2ZjLg0KDQpKdXN0IG9uZSB0aGluZywgc2lu
Y2Ugdm14X3ZsYXBpY19tc3JfY2hhbmdlZCgpIHVzZXMgDQpoYXNfYXNzaXN0ZWRfeHsyfWFwaWMg
YW55d2F5IGRvIHlvdSB0aGluayBpdCdzIHN0aWxsIG5lY2Vzc2FyeSB0byBhZGQgYSANCmNvbW1l
bnQgcG9pbnRpbmcgdG8gdGhpcyBmdW5jdGlvbiBpbiB2bXhfaW5pdF92bWNzX2NvbmZpZygpIHdo
ZW4gc2V0dGluZyANCmFzaXNzdGVkX3h7Mn1hcGljX2F2YWlsYWJsZSBhbmQgdi52LiA/DQoNClRo
YW5rcywNCg0KSmFuZS4=

