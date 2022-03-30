Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2E94EC7B1
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 17:03:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296420.504537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZZqe-0004o1-Cv; Wed, 30 Mar 2022 15:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296420.504537; Wed, 30 Mar 2022 15:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZZqe-0004kW-9q; Wed, 30 Mar 2022 15:03:00 +0000
Received: by outflank-mailman (input) for mailman id 296420;
 Wed, 30 Mar 2022 15:02:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZQ0c=UJ=citrix.com=prvs=08136f46d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZZqc-0004kQ-Uj
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 15:02:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a8cf432-b03a-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 17:02:56 +0200 (CEST)
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
X-Inumbo-ID: 7a8cf432-b03a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648652577;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tGnGjgRWbom4UDz2P2p3niqqHw1e3PapuxVdbjnTg4Q=;
  b=hgHqgsh6C1Mz+o1DMZMgzNeYB0U+AJiPzTvykLaSbl+GxUiS0eOioR/+
   WTJ4Aweq+vBmMLdsJ/8vDUrUj53CWC2LptZLseDhCZxTLytfV0AOUDHtl
   f5emiXQ4CPoHhOp6vBzycEhp0g8fGcQEjlaE9yMv0GqvuzQkrLnYOKwno
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 69947216
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WjELl60BVndBEC6bjPbD5e1xkn2cJEfYwER7XKvMYLTBsI5bpzYHz
 zcYWz3XMveCa2bxLot1b4S18EoOup7dyt8wTgtspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUz2YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1q5Zm7ER8ENJfOu/giXQZXEDskMYh/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u15ESQqyHO
 aL1bxJvfRHNOwIREG46VrJgm6C3nnnTamVx/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 m7B8m70BjkTMdWNzjzD/n/EruzImznyVMQNFbm73vlwiVaXyyoYDxh+fVmxrOS9i0W+c8lCM
 EFS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmJrFTHnF7pqelzGRJRcbMmABf3UIaDJQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7YaFUwYnY1RvHNEghBHVb5J+i8BxkkeS9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CKyEM4oUO8IpLlfblM2LWaJ29zq3+KTLuftiU
 ap3jO72VSpKYUiZ5GTeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9eWGZimtsRtfveyC2Mq
 o43H5LTl313Db2vCgGKoNV7BQ1bchAG6WXe9pU/mhireVE9RgnMypb5nNscRmCSt/kMzr6Tp
 CDkACe1CjPX3BX6FOlDUVg6AJvHVpdjt3MreysqOFejwX84ZoizqqwYcvMKkXMPqISPEdYco
 yE5Rvi9
IronPort-HdrOrdr: A9a23:8dAnmasFNAqwpyTSNmqbsRnx7skCkoMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7EZnibhILIFvAZ0WKG+Vzd8kLFh4tgPM
 tbAsxD4ZjLfCdHZKXBkXmF+rQbsaG6GcmT7I+0pRodLnAJV0gj1XYDNu/yKDwGeOAsP+tBKH
 Pz3Lshm9L2Ek5nEPhTS0N1FNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJq5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUQHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0kN
 gsfJ4Y0I2mdfVmH56VNN1xMvdfNVa9NC4kEFjiaGgPR5t3c04klfbMkcEIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.90,222,1643691600"; 
   d="scan'208";a="69947216"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VownB+9By3ImLo70W5dHhdAt7cY65nE47m7bfH+JvVb8zgtiDrNErkDVd+a7liCfmDXLuC+ejBW8gDbZHHTuhClSByjYoFdM18LxYNPz9FHiJebiNJqE0FZQcIl7ZREMVNbSPo/1t74N/yN+c5ZFgD9Wo2KQeJ69sBh5cm400XyHSFn9+WHxwH8UGV1JLc+e8T2e2mAqM2pHimei2wg0WUvKvtZ3y+LX7A+ejS8pAn3MKHuvQdJ2oSFuW5fB/szlg/qdEFACF/dlxG4rwOu+jKP7Zfp58rPB1WtpMvliw1Nr7bgXyFMQLzG7/PQR6lMyPR/eZhtSxTnCsx4kntLDLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUnXY73EYVNDaYl1Mer9X/OrVGcW39M+NuQd5rvKIIc=;
 b=noh4/otdLSPYOiIZ8vxWOz3IvQHwZ+38YPyFO7RPrBJ/TtiblxRatzpkNrMDb/Hv6cW9+GRUXdsBt3UWxKeL9IKw0Ip0muhWB41u4+pJFOqI0/kXMV566IJCYEjmAZNrnXHdL5iRmYuebffZD59akuqjaTgaPdiR5ohTPMHPx4wbqXomW4wTPf2HPRkeqTPia9nzsb/weeRsta++cpznaCXgr+Zg9MnFhbICxrWK6MgO3N/D0dCfVBij3dRjO4aIT+yi3GXRmvvFB0pZnBuoKjeF97rPmxUGWFVdiNffBfyGNNJeqVX7rHg2Qhc12EUbbMSEw0TYwrbF6ffTbxszVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUnXY73EYVNDaYl1Mer9X/OrVGcW39M+NuQd5rvKIIc=;
 b=OGhVdWitN0x0tn+pTQDblyqxSe5bTrkp4Kog6eyWKnuIGRUcNrtZ+8f+UyCyB/fzu09i5mT3nWUAsoJYBZ1mHLQ9KttP8OGspBibSW6nOkSFdzWbzleDSCIfkhnL+k3sZwGTqBZxBmln6sOYgFZGURAjHk/fszCcm9DHw5kT5Mw=
Date: Wed, 30 Mar 2022 17:02:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Bjoern
 Doebel" <doebel@amazon.de>
Subject: Re: [PATCH v2] livepatch: account for patch offset when applying NOP
 patch
Message-ID: <YkRxGGP0tCHKDLG0@Air-de-Roger>
References: <772f0afc-64db-6b98-af49-bd970ac78cbb@suse.com>
 <YkRm8oc0vQzRQ7VL@Air-de-Roger>
 <5091d7b3-18d8-1842-a65b-159299cf66e7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5091d7b3-18d8-1842-a65b-159299cf66e7@suse.com>
X-ClientProxiedBy: LO4P123CA0040.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9288fd5-0222-48c3-60aa-08da125e5cbc
X-MS-TrafficTypeDiagnostic: BN9PR03MB6074:EE_
X-Microsoft-Antispam-PRVS: <BN9PR03MB60744430D7C93D393DE9CB5D8F1F9@BN9PR03MB6074.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w+PtnVugdbw+584f6RtNAa8aYCziXALazQApoJhTUSNjrFlHhzvXkEeMX+cOtYtostubfSxeQUCLjcIl0r2uiQnbAw9vgBXXCiiZnQt5yknOOtulaD3oIEcf6PKudVkvcpwXzgsthmy2u7yx0Qp88ibTKzHC6egb8BLS44onO/EDHvzGB9Uy3i7xqFEC/IrXv9wtnjOkSDO6ieGw+1SWuE/5qhVO8cy2eQpeeBv6TVDkoJub0V+WHu3L11+QnHT/YmxJ2oqDqBwTOAB0/ieFH6i25CoiPDtITPFwlD/INlClHzVXYBC1qOEaO6EArAts9EBZD2W6ohPi79QtpSKCCtdWT6tEuwiRqI34rgdGk76CdGQ7UAi3by46QlQnU99RaQUT4k4BnPB6FBZn0e1ZQH1p48sTJGYKkg7FWqECpw/VYiFG7coSAk5idDl/O3GIYk02KPM4qn/gXsfa3/QU2VMdBMBXxfitKMQLZfTUdn4wlU4qihdBBovkX/hJS4B9a5i46DWSPhFQi7DkrP6ZmQGn6NpqKg2OnZhcEdbvFTp1xSlAw+cDNmdrB5DuVEaOpVtxIFiRG2WQFORwnwD4IXWLvb4Ui5BqbLhgN9NanW6yIC5I1wwKLRMApVhgQuySRRojPeyNimfJRSTpN1Na+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(66556008)(508600001)(54906003)(6486002)(82960400001)(66476007)(6916009)(33716001)(316002)(186003)(26005)(38100700002)(8676002)(86362001)(4326008)(5660300002)(66946007)(85182001)(2906002)(8936002)(6506007)(15650500001)(6666004)(83380400001)(6512007)(53546011)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S09xalBxTkt4NlVTTjk1MHFNRURHc2VmTEl6ZUl1WnNjUEQ2eitJUzkyc0Za?=
 =?utf-8?B?bEZMY0tDZEtiRFVPNG50ejRnSC9mamZHY0dpaHlQZVBJRVBnRUhQbjMwWEI3?=
 =?utf-8?B?VUJEaWNqR0N5UWpmVm9ZazhGMEVHVkU1dzU4NFBYcitBT2t3QWNhMVJkZlBY?=
 =?utf-8?B?VURYL1ZINHY1L2tzdmZZNXAyOGFIeW9GaGFKRFZmNzBtN0MyYktueUpmVVVW?=
 =?utf-8?B?VUpBelpjUXVZWUs3ZDQvcmRDeXN0bW9BcTBVc3BjbU5TM3YraFIwbUUxYUxQ?=
 =?utf-8?B?YmFleld1ZHBzNFAxL1prc3BpSWllei9yL01jclo4QysxdnlZRzMzSjVQdEZP?=
 =?utf-8?B?eW9EekxmZTkxWCsxRGN4eFRheFhMRkNQWiszSFVUSG9rcTRIM1VuLzd6WFpE?=
 =?utf-8?B?dldFN0RISGo2TTJkS2RIZXJLdGI1Z0J5SnViUEJVZXpLN013U0VoMmZyZG5m?=
 =?utf-8?B?UHA5ZGpmU2RmczdwOEJMRzJvNUlwZVVoeHg5ZFBaaTgxOFBOb1h4bDNsUlpH?=
 =?utf-8?B?Nk1MTGpzMjJKaVdYM05SWW9Mc2JSZ1VFd0tLVGJ0L3V5YnRSMTI3QVh6eTly?=
 =?utf-8?B?blEyRDZHRkk0anNKbVlpWDRLL3c5aE5FZFUzV2dKODE5L2NnbjFrSkluQjhO?=
 =?utf-8?B?VnVCa3BJNUxhS29YK3pnQU5GbDNwY3BQc0xRaTJXc2ViNW5hU3lqejFxQlVT?=
 =?utf-8?B?YW1FamF3MC9CQ3V4cGttbk85WjFxUzUvNkttWWlkQWp5U2dnT1JzSXQrVjhI?=
 =?utf-8?B?cFNIbm80V0s3SW1HQmRwUlpEbTRwemtubytZYmFoNlVkRzgzREYwRmRRQlJQ?=
 =?utf-8?B?OGxtQnBnTWdFa0toU3J5NEYrL1FkeUJDSnAzbUhqMWt1YTJ3cW9ubkNEMlpH?=
 =?utf-8?B?N1NUTTdUN21RNFZXTDN6NitFQjAydnppSlUybW9pdTF2OXdjU08vT2RxcTNu?=
 =?utf-8?B?MWYyc2x4cXp0ZUM2dW1Eb2VuMHE5eFd1K1p5d09JN2YrMkNWQklOWU0zdUxa?=
 =?utf-8?B?dUVxbTByZDdJb2JGeGxpVGVEcmt5QjErbG4vOVlpWkNDZEZqeENtcFAwb3Ez?=
 =?utf-8?B?cnhiMWpKRXNvWXFlcTE3eDdLclNXZWpNdFpkdmVOKzE5SXpQWDk3NStNN1hB?=
 =?utf-8?B?bUllalpKMEFPSVN3ZjJHWkliOGhOdUhIc1daMmRoWTM2T29VMlJ2czRPREJt?=
 =?utf-8?B?YjlGZm1pSGRoaVh4c2dWQ1NCYU44ckE5MTh4L2NnUlc2Q3pYYjVxa3lSNEd2?=
 =?utf-8?B?Sll3TThuM2dKWWRGeFRVUCtueEVUVmM1WUhIMlBRdDBHSmRKNnBGSkd6K2Yy?=
 =?utf-8?B?UzdoZk5mSTNZWHBaa1VaSkRBcGVhZVZHRnRBQWhJbS9DS24wTFJWNHIwUXZX?=
 =?utf-8?B?SHVZUGkyQ2dJcmhLcnhtaDBNV0VYTnNEMGZjYS85U1ZCWUY3Q1BDYkZtR28w?=
 =?utf-8?B?NEJkb3RxNHpCTGNhMWtEY3dSTHozb3V3bHZTczV6UVdTR1FMSVBVQVN1NVdY?=
 =?utf-8?B?NnQ4SHc0UUI5MG9Xd0cxYXFRWDRGSEJjc3RaN044SnAyZEM4a3RpVnpWazVC?=
 =?utf-8?B?cURyb01ob1hNcFRuaFFYMkJKUEZpci8vVEtyem0xNVR0U2s1L3Z2cHRGREJO?=
 =?utf-8?B?aGxFcjY2ZHhZWnFXNjBOQzFrRHRGb3J5Q3M2b2ZmaTdSN0tDQ1pvUExJMnZE?=
 =?utf-8?B?Sms2bnUydElBUVpjd1duNWRrOUl2OGl3Zm5xR3JzRmM5V2o5bmtNcnI2dDdJ?=
 =?utf-8?B?R2cvRGJlVVcrWURkTzh3WEVsbkZyam1Hdk50MjY1VTNkS2pMWVpuN0lzUVVV?=
 =?utf-8?B?VDZodUJmcUowdnlhOHhja1NkOE01Q0NyYWgzeEdoTDlEYkxmVFN3dzlscWVu?=
 =?utf-8?B?bWUvWnhyMTg0YUNSNWNRNG9HNHRFa2ZVZmFUdTdTNy85YmlKUk91V3lvT2JQ?=
 =?utf-8?B?TmltMVBWSWVUYStWN3NPTFhmM3V4Uzg1a081cEsrQXdmMUUzNzd6SjFDRm5F?=
 =?utf-8?B?M29PdHgvYk5MZDRUSjlPMVhicDkwQU1JSmlZQmVRQi9jQldORi9YVlFIWTFz?=
 =?utf-8?B?VW5FdjFrL2F0QzN0YUpyaHd0UzEyRXlVUjBOcmkrSFpWNkRIdXZFRUV3NmZU?=
 =?utf-8?B?RzhQaDdRTVA0QTZtZ1ZuYnF1UHdBb1RMS2creFVBZkxpOEgwdHB3cndhNzgr?=
 =?utf-8?B?cWgrV2xiRjR3VW1rSkY2Qkk5cCt4T0duL0xuUStONjRsNFpjc3B5RW5EUzlk?=
 =?utf-8?B?ODdQakpINjBIVDJPa1Y0V1ROWXNTR3pwUUZTMXJvcWFtL1o1d2J2Z1ppbHFh?=
 =?utf-8?B?azhiSWhyWVFPa0ZyVlpJNnJKRm1RbEVrOWMrVXlOc0tSRjAyR0x6MDViWUYy?=
 =?utf-8?Q?UbMJPT7qY+/pHbyY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9288fd5-0222-48c3-60aa-08da125e5cbc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 15:02:51.9827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1Sb90t/MgoBR76/Eb7QAfnj4BxRiald6g4a6g9ikQgmnyAmf2nVb3u2xk+51omPGf5erjbrmbEbSAlvxyFKZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6074
X-OriginatorOrg: citrix.com

On Wed, Mar 30, 2022 at 04:55:52PM +0200, Jan Beulich wrote:
> On 30.03.2022 16:19, Roger Pau Monné wrote:
> > On Wed, Mar 30, 2022 at 01:05:31PM +0200, Jan Beulich wrote:
> >> While not triggered by the trivial xen_nop in-tree patch on
> >> staging/master, that patch exposes a problem on the stable trees, where
> >> all functions have ENDBR inserted. When NOP-ing out a range, we need to
> >> account for this. Handle this right in livepatch_insn_len().
> >>
> >> This requires livepatch_insn_len() to be called _after_ ->patch_offset
> >> was set. Note however that the earlier call cannot be deleted. In fact
> >> its result should have been used to guard the is_endbr64() /
> >> is_endbr64_poison() invocations - add the missing check now. While
> >> making that adjustment, also use the local variable "old_ptr"
> >> consistently.
> >>
> >> Fixes: 6974c75180f1 ("xen/x86: Livepatch: support patching CET-enhanced functions")
> > 
> > I have to admit I'm confused as to why that commit carries a Tested-by
> > from Arm.  Did Arm test the commit on x86 hardware?  Because that
> > commit only touches x86 specific code.
> 
> ;-)
> 
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > FWIW, on the original implementation, I think it would have been
> > clearer to advance old_ptr and adjust the length?
> 
> In my 1st attempt I had confined the change to the x86 file, but it
> didn't feel right that I then also had to adjust arch_livepatch_revert().
> 
> >> ---
> >> v2: Re-issue livepatch_insn_len(). Fix buffer overrun.
> >> ---
> >> Only build tested, as I don't have a live patching environment available.
> >>
> >> For Arm this assumes that the patch_offset field starts out as zero; I
> >> think we can make such an assumption, yet otoh on x86 explicit
> >> initialization was added by the cited commit.
> 
> Note how this already deals with ...
> 
> >> --- a/xen/include/xen/livepatch.h
> >> +++ b/xen/include/xen/livepatch.h
> >> @@ -90,7 +90,7 @@ static inline
> >>  unsigned int livepatch_insn_len(const struct livepatch_func *func)
> >>  {
> >>      if ( !func->new_addr )
> >> -        return func->new_size;
> >> +        return func->new_size - func->patch_offset;
> > 
> > Seeing as func->patch_offset is explicitly initialized in
> > arch_livepatch_apply for x86, do we also need to do the same on Arm
> > now that the field will be used by common code?
> > 
> > Maybe the initialization done in arch_livepatch_apply for x86 is not
> > strictly required.
> 
> ... your remark. I'd prefer if I could get away without touching Arm
> code. Hence if such initialization was needed, I think it ought to
> live in common code. If this was a requirement here, I would perhaps
> add a prereq patch doing the movement. My preference though would be
> for that to be a follow-on, unless there's an actual reason why the
> initialization has to happen; personally I think it ought to be a
> requirement on patch building that this (and perhaps other) fields
> start out as zero. I therefore view the initialization on x86 as a
> guard against the patch getting applied a 2nd time. Yet of course it
> would then also have helped (not anymore after this change) to use
> = instead of += when updating ->patch_offset.

Sorry, I didn't realize about your post-commit note. In which case:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

