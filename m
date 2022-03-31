Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057854ED51D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 10:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296730.505157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZpk4-0000C0-75; Thu, 31 Mar 2022 08:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296730.505157; Thu, 31 Mar 2022 08:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZpk4-00009c-3M; Thu, 31 Mar 2022 08:01:16 +0000
Received: by outflank-mailman (input) for mailman id 296730;
 Thu, 31 Mar 2022 08:01:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDhN=UK=citrix.com=prvs=08274bcc4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZpk2-00009V-Od
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 08:01:14 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b93b4088-b0c8-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 10:01:10 +0200 (CEST)
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
X-Inumbo-ID: b93b4088-b0c8-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648713672;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cZ0wN+h63gmvpU+/aLQvrJz1HwwXX1Kpvu92wYQiQ7E=;
  b=RREQfJatgR8hynxpPkCS4ZFAzapeZzagRD+DoM8mXpUFTMGU/JOxHEs6
   v14aJnlSmOVZ9JhVKx7ijtXOGVrpw9n6ftWNofl1ZvJKZaEEe4pgppCKx
   9YPx3AmWLHIifreNLspuWJJeyCMZuRHDPLy0kBXp94/ZueShBTddAdklg
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68034510
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rrRcBazT+JJLjlNeyUd6t+cOxirEfRIJ4+MujC+fZmUNrF6WrkVTn
 zEeWW/TOq3eMTPzKN9wPYyyoU1QuJbVyN9iQVNsrSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2oHhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl5ZnrClYFNb/1nMc/eURkEy9SIrRM5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JAWRqqDP
 pJxhTxHfBPCWiZoEW4rUpsjwfX1vkuuTztFtwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krK+GnzDxUyPdmW2z2DtH6h7sfMmiXhUY5UC7y89dZtmlSYwmFVAxoTPXO5q/Skjk+1W/pEN
 lcZvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpXFTCnep5ufvwq2Ggo/cFMCawMbVAEatoyLTJ4IsjrDSdNqEaiQh9LzGC3tz
 z3ikBXSl4n/nuZQifzloAmvbyaE48GQE1Vrvlm/sneNtFsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbWW0bb1HRcBJG9GRF5iLJ9o4DNZWfhsBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66IPoQQP8cvLlLYoUmCgHJ8OUi3yiDAdollZ
 P+mnTuEVy5GWcyLMhLoLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCuM0H/rN9IRXhXfCdTOHwDg5EOHgJ1ClE9Qz9J5j646e5JRrGJaIwOyL+Sp
 yvtCxIAoLc97FWeQTi3hrlYQOqHdb50rG4hPDxqOlCt2nM5Zp2o4rtZfJwyFYTLPsQ/pRKoZ
 5Hpo/m9P8k=
IronPort-HdrOrdr: A9a23:t/6CYKkJo2CLColDybi+6QPu2bTpDfPOimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1F9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJrJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUUHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2XackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPW9yV0qp/1WH/ebcHkjaRny9Mws/U42uonVrdUlCvgUlLJd1pAZDyHo/I6M0k9
 gsfJ4Y0Y2mdfVmHp6VNN1xMfdfNVa9My4kEFjiV2gPR5t3ck4klfbMkcAIDaeRCdg18Kc=
X-IronPort-AV: E=Sophos;i="5.90,224,1643691600"; 
   d="scan'208";a="68034510"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5EDw//RN36Z+L0+Kj7+918lssb3tinL3H6lcd+oqvwx1sYy7Z9HJLgAa1NoVVcMvCnXFDi28CQGEloqVX3BSxV/qbNU1Nu3fnrPOTc4y8s6kn7Djyz9U9Tk1BkXfChUYw9XYNoMdUvbBBVj5bBLdejSei1npJaiGhXxpfyMDZyK/DiH7bXh32uhI+UP7XzPP0iO2yOHyLn+vYtVCXRDds/UC78fUVvkaXa4iJZS0lQ7QVLTGpfdh/BjkXOfWye6/ZKvXNd4bhqBWxPxlHHhAfV7Bp0juyox7MFZHbv+fFxJ+tTjHNCTBdW8XcTlYhXxBkUgJCEGxzxrfwZbrRaW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXUm0VfgaPvBqvudQYhLxa+evzl/IKxgQ7j114KUJM8=;
 b=dBZjbMdeXDYj9IeBjd4Dkl7il/NF3XnxNScwl+R+/Hgsr15Z3uAlY6B1iyhgrllKKauiPBNC47YyLkvKogYZcd16EAOoCNzb5EPunakm5TRr4p8PWKoOhwq57C3J3dQmRn4Oq0NYuTrE+x9S1B6CWwOr+0q59Be3oebciW+zlesZAo5d/OqaJnnFTXldrcogcQwjtmkYbTZMUsNq0rEiCjXhC/AjSRo+4H+YotdW4yRMLtivI2GM/CLVQIGkJ0MPho4hpZ4akTVeAfj9qLtYGcOem181Jj3qLToQi2uVIRbyQD2Ex1FAfe8r2Urw6oA/egy6Blswe6jS4IAQw+CzUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXUm0VfgaPvBqvudQYhLxa+evzl/IKxgQ7j114KUJM8=;
 b=RdpTynb1tlsd4gSooQMUPzqnRyhmeSX02W0K0Um+lpW9IHf3dI+rB2Y7keVEFXysAbYINpo6BFxQt6tUIPM19cpCyvk1Fj9jkjnp/lHNCM2XyzoFHPqxNfsKT7w96tsC5ei7OqaJP9zQ3fIQnAU7O2QNTOhtalufWK7IpWoyQ74=
Date: Thu, 31 Mar 2022 10:01:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Bjoern
 Doebel <doebel@amazon.de>
Subject: Re: [PATCH v2] livepatch: account for patch offset when applying NOP
 patch
Message-ID: <YkVfvW6HiST3fIgs@Air-de-Roger>
References: <772f0afc-64db-6b98-af49-bd970ac78cbb@suse.com>
 <YkSNm0mb47Vc6nGr@Air-de-Roger>
 <a6f18801-7959-8fc8-f414-8086ed74ab3a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6f18801-7959-8fc8-f414-8086ed74ab3a@suse.com>
X-ClientProxiedBy: MR1P264CA0078.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15c9949d-761f-4b8d-1442-08da12ec9c65
X-MS-TrafficTypeDiagnostic: BN7PR03MB4306:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB4306A847A4E7C7BE930C9A778FE19@BN7PR03MB4306.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pN8/DEY7N/SNxwUc8l8GxBOjeOOwavNrF6GKuLLDTdwyyTlorWB17WLeJ98ZlwiBi4N6hSL3DAgpk4zcV0vkjsKc2hsKNX/Fe2E9fAbnVPK1TBER2E2MftPMvQi+W2Tm14cMEOiZJXwLhRMrbzebIVP85k0vBvC2lsuD+UD4pUSmAjyVLilMrPsdu4eWg0tMjUPNyPo/NYtsyBC4DAdHeJ5DqPkpUwCue3xD9Se8hBgu+bBEtYqmwVQyyf/kywuhqRVg17iwDJTFJhR19wEiaLZTmBLNaWEbCFNpfU/N/nOT/8+1OjNvbn/SYx515/KRcWnMwZJQNKL022OBUQraBYXXaNq8zhrYyZ5VVekTNRt78MIX+PDTpwC01mbhVSp4ydpV8Fmfi8FaH1m3kehAE45oTMtAEnUtJcmefiZtHlisoQSq+55jFxWcq6yC2zp49F+tiImlz8aQOtkO3/FklKhzuEq+yYJDj8WVcNVRj4Ehb8r20wG5bROuGSoUYKTrhbNnGFAjgB009s1ohGuthO1vAMPz4k3+jWYVKcExy+LCOsxrZhCS454IsrUy7U2Oe6Q6VMlFkZdaIx85vQ+6w1eK7imqMUfJUlIsdvBJa2CaJaeSZsUKhSSphZl6ThDF3QMZLFiM4YUGCJ795swYoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(86362001)(186003)(83380400001)(38100700002)(6486002)(8676002)(508600001)(6916009)(26005)(66946007)(316002)(66476007)(82960400001)(66556008)(4326008)(6506007)(6512007)(33716001)(54906003)(6666004)(85182001)(53546011)(5660300002)(8936002)(9686003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmZTMXpsMWl2TXVKaTArczlnbTB4U2loNW9yaE1aZkYzZ1ZQNnZFL0pIRVov?=
 =?utf-8?B?L3FESC93eGNURmUrOWZlOUZLRktKSjZ6ZCtpYnhSaWRJbGhHRUl2cW9IMDQ3?=
 =?utf-8?B?ZnRWZ3N3TGxvbXUvNWZsV2VwTG51QW1mRG05Q2FNQmgwbmFqSVJqeXdjV1px?=
 =?utf-8?B?UmdkUEhtN2Jsb0NWU3AzZ0ZQc0E5elJRWjltb01BMVVPcHJLUjJQN2ZlUHBO?=
 =?utf-8?B?K2JrbklLTE9vQXdUMkxkSWplZ2tLeityT25iNDAvYWVLYktOeWZHL0dHQkor?=
 =?utf-8?B?SXcrV21sYVdrS0RXYjNqS0E5OExoKzFtQkIzaGYrNmJlSUREV1lDZWxvQ0lD?=
 =?utf-8?B?VWV6SXI4RXdvWWtFdVNJZXNQb1Z4UkdiUFU1NzZibDlMeDNhQ2tETWJTNWNG?=
 =?utf-8?B?U2ZaSm5Ldm55TWM4eVNrVmY0V3NndkNxNUUydUtIYjhUeHU0dmJYT1VWTkJt?=
 =?utf-8?B?UDJkUUNPSzBMbVl2cFVYTU16Vm9yQXNqU0w2bVN0VTlsQ0FKa2JjT2VPRU1F?=
 =?utf-8?B?MUlUSXFGajBzUEk1cVhUS1VYaDlLeFNwSVNlYU9rd05PWERHQW5lWlNONCtV?=
 =?utf-8?B?SzFHa3lnTlNBVWxWRGZlbGhLVXNKcEUreHpBSXVJTjd3dXJVV3RmU0VXbjU4?=
 =?utf-8?B?NkpZdkx5bHYvUWQrNTNENDVHYU5Mdm5LSURQZkFoWlFvV0RTbkdTMnc1blM2?=
 =?utf-8?B?eFhxRlBXVWxNalVjSGVZdXJZVVQ5SUI5Mnd0dmE1SjREcVhTWjdEOFhDY2lW?=
 =?utf-8?B?WUp2QTNXdWFoTFE1MlVISVU5Uy9IMis2dlM5OTRVUHpud1h0S2plYTNlUjlD?=
 =?utf-8?B?VDJLQXdKcjlLd3pmSVBKQUJxcUZhbHdjalMxaW5xM0FQR3VVakJ5VWp2YUVV?=
 =?utf-8?B?dyt1UXhvb1NuQk1zYzJTUDg1T0pOMHBiZVVoQWg4VXptUzJqNEl4YmRWZkFB?=
 =?utf-8?B?WTZQUUdtU2NkeUVnQkZCQnlLWC94Zm1KUmpXeVlMYy9mQS93N3NpaUR2S1lM?=
 =?utf-8?B?ZUI4dDFQREI0S2RZazd4Tjg3d0YwQ2c4aDV1ZkZ1b2ZMTjNHQjl4L05veFNU?=
 =?utf-8?B?UHZsMXJsODJNVTA2QnkwWEdoS2YrNld1a2Q0czE4L2VMSWtCK0tScnprbUxx?=
 =?utf-8?B?bVVDSmlOdTVrQlJTd25BNEdRTkVjd3oyQlJWZDQ5RzlDdkVmUCtIRWxkUHJa?=
 =?utf-8?B?U2I0SzJRTzVEczZQNGIrWmk2NGJXbDgvUkMraktnaUNpNVdSak5aUW1ia0pK?=
 =?utf-8?B?MzVKMzZINVVJM3Zja1BvQWdaK2ZBU2lQRkVYUnNyQnJCeFh3TFNUdGQ5VUIz?=
 =?utf-8?B?RmZTekJHVzJubnRjSjRkQjVUUzQvR0NsSWdvN0Y2eTBRVUdKSThEb3ZtTXZR?=
 =?utf-8?B?K1hYOHVLUVcrRk1vdERZRUx2QlNGb2UxY2FscUhBeXFieFRGTGwvMGRiZUtH?=
 =?utf-8?B?aUROcHVwT0FkaityOFhJenNNMHM3QkxJY1FKTUx0b05Fakp2WXFHbzdJUmZq?=
 =?utf-8?B?VXJkdXNwai9TL2VXQ29rOXlLQVppYXp3YXBoRG9CM1dVWFhVbXJZK2dsdXph?=
 =?utf-8?B?QnZKQ1JOa0VqbGcxeFFHWTgvQ3F3alFIdFYyUjhtY3h0cVVFVmpwd2hyMGRz?=
 =?utf-8?B?OWpNaExmOHRnMnhzek84VmJMM2V1RnVZTy9xSFFLRFhYNXFNeWUrbXFYSy81?=
 =?utf-8?B?Z3IvbTVNcFVFSmt1V1pGVlUyK01MUjNVY2FEV2svMUlhRXk2TVJVZnh2bEdF?=
 =?utf-8?B?QlZ6cG5VcWNEZkNGQWVpK0lUSUlaSDhSM2pGUUpJRktMc051V3hIekorN2tj?=
 =?utf-8?B?NnJnZXI1VUdyenJEMWFMYnpTTS9sVTJDQ2VHaE5IWTcvcEVmcjhRZVRURDAr?=
 =?utf-8?B?ZzZNUUk0dFAzRk12cng3YlJLeDhDRmh6TnpBNnBBNStEMXBsajdBdlIzNWc3?=
 =?utf-8?B?UlZUS0JoWE8xYzhzOTNta2c5VGNqTmNlZ2ZTU1ZPZG5nelJNdEMwTUp1bFFF?=
 =?utf-8?B?bFRZSlFINi9HV1BrUVZEd002RlN0cWNEOEc5Sm8xN1hiYXI4SUVJbjJQSEoy?=
 =?utf-8?B?dllqVmhSWk5sakQzdnNtQ2JENXNpU0R5SWI4eXNFZzhvQkFORjk5QnZBeWcy?=
 =?utf-8?B?TWtpcUx3ZlFsczVEMEFNZVlDQkpuaE50dmZpWmF4SC8wUG8rV1ZudTBXM0xw?=
 =?utf-8?B?Ly9oM0VGZkRTdlU5RzhBb1Npakhuc05ka0JxTGU3THVQUzRnUEQ2aDF3dVA2?=
 =?utf-8?B?MkRNSVpnZGkrRW13R2ZzU3dmb3Ria1QvR3JHa2JiZGFCSEp4dG5nbXgrRUp2?=
 =?utf-8?B?dXBBNVI3SmZYTHVLTWUyKzBaWVJITzlucGpxOXNHenN3OXl4WklJWm1Wd2Ir?=
 =?utf-8?Q?H0Z2Lwg+FEp3HXl4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c9949d-761f-4b8d-1442-08da12ec9c65
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 08:01:07.6016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/c+bs5blMwjCreIkNvaLhn5yram8+iiVlqd9CNDNI1PYgFBw7XgUFcg821XuHilFoPnEVZs3+XHN8p5CDQm3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4306
X-OriginatorOrg: citrix.com

On Thu, Mar 31, 2022 at 08:42:47AM +0200, Jan Beulich wrote:
> On 30.03.2022 19:04, Roger Pau Monné wrote:
> > On Wed, Mar 30, 2022 at 01:05:31PM +0200,>> --- a/xen/arch/x86/livepatch.c
> >> +++ b/xen/arch/x86/livepatch.c
> >> @@ -157,9 +157,15 @@ void noinline arch_livepatch_apply(struc
> >>       * loaded hotpatch (to avoid racing against other fixups adding/removing
> >>       * ENDBR64 or similar instructions).
> >>       */
> >> -    if ( is_endbr64(old_ptr) || is_endbr64_poison(func->old_addr) )
> >> +    if ( len >= ENDBR64_LEN &&
> > 
> > Sorry, didn't realize before, but shouldn't this check be using
> > old_size instead of len (which is based on new_size)?
> 
> Yes and no: In principle yes, but with len == func->new_size in the NOP
> case, and with arch_livepatch_verify_func() guaranteeing new_size <=
> old_size, the check is still fine for that case. Plus: If new_size was
> less than 4 _but_ there's an ENDBR64 at the start, what would we do? I
> think there's more that needs fixing in this regard. So I guess I'll
> make a v3 with this extra fix dropped and with the livepatch_insn_len()
> invocation simply moved. After all the primary goal is to get the
> stable trees unstuck.

Right, I agree to try and get the stable trees unblocked ASAP.

I think the check for ENDBR is only relevant when we are patching the
function with a jump, otherwise the new replacement code should
contain the ENDBR instruction already?

Thanks, Roger.

