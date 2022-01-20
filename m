Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CBD494BF6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 11:42:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259023.446686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAUtL-00076s-5y; Thu, 20 Jan 2022 10:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259023.446686; Thu, 20 Jan 2022 10:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAUtL-000751-2o; Thu, 20 Jan 2022 10:42:07 +0000
Received: by outflank-mailman (input) for mailman id 259023;
 Thu, 20 Jan 2022 10:42:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IXKg=SE=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nAUtJ-00074v-CZ
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 10:42:05 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9955b8e6-79dd-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 11:42:03 +0100 (CET)
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
X-Inumbo-ID: 9955b8e6-79dd-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642675322;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=kDLtlWQqNzg2kghQsdID9mdmxnN6XGhx23AX6/vcdxg=;
  b=fDjMEa/g6QIJ5IuEuSd2z+qDV9I0C/i4U7OHTQr5+LSHmNJaEEZraDL0
   E1lRG4zgHeEOZeFuZG2pBlniBlEEuBIN1lvj8KAK50ShGm/9/pxDrxeDz
   cuopENSU3fW1QMiGY0baGxaXNUO13NtE7CXus8idBeyfpAokyedlLLU52
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IHODTg/5XDj1sDEBs6bvdcn41MPViB82bWRCAPuHbrxkfblKwz3Dn0IsKXXOdzXCpiW0iSgIcS
 IQOlIuFyEJN2BrSqHb4Emqql3A79PCnlPw0Ic1itV4vCzpgB36eWbgBGjUCf8Ra/TA8mumJ8bi
 BhA+kRdY97f74j5OXtCf1GiDeHi66s8WRbroX1WSrvxrrXKDg9TXpxzZ52LOIXgtWrwLGXmY0O
 NHTb+Xiswq571ahUD93yhfzL3TafT51LMWpIS+BOUd5ILknZhPWkdgoqePEbGxYm5iGfgc9Elw
 y0h91g+qMdq6U8Efh9yshges
X-SBRS: 5.2
X-MesageID: 62796213
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HHHh2K+TDQmc0iCbRDiXDrUDDXmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 GoWC2+HMqyLMGDwed0iaN628x5V75GEz9U1SlNurSs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj2tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhxz
 ft9nq2BcDwoFbTnxtQWdgJhTShxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwMIc7xM45ZlmxmyTjBJf0nXYrCU+PB4towMDIY2JoRTKiEP
 pFxhTxHfjuaJDdiNQ0uCK03o/y4hGD7fGEBpwfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCntSj8XYcPEryk57hviVuayWEJIA0bU0Ohpvu0gVL4XMhQQ
 2QX9ysyre4580imS9D7dxviu3OeoBMGQJxbFOhS1e2W4vOKuUDDXDFCF2MfLox93CMredA0/
 l+MsePCNA1Wi7y+UFnDxryxtgrsMCdAeAfuehQ4ZQcC5tDipqQ6gRTOUstvHcaJszHlJd3j6
 2vU9XZj3t3/meZOjvzmpg6f31pAs7CQFlZtjjg7SF5J+e+QiGSNQ4WzoWbW4v9bRGpyZgnQ5
 SNU8yRyAQ1nMH1sqMBvaLlcdF1Kz6zcWNE5vbKJN8N9n9hK0yTyFb28GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510kfK+TIu1Cq6IN4omjn1NmOmvpn0Giam4hDiFraTRuftnZ
 cfznTiEUB729piLPBLpHrxAgNfHNwg1xH/JRICT8vhU+eH2WZJhcp9caAHmRrlgtMus+VyJm
 /4CaZfi40gBAYXWP3mGmaZOfAtiBSVqWvjLRzl/K7TrzvxOQj9xUpc8ANoJJuRYokiivr6Yp
 y7mAh4BlgOXaL+uAVziV02PoYjHBP5XhXk6ITYtLRCv3X0iapyo96ARa908erxPyQCp5acco
 yAtd5rSD/JRZC7A/jhBP5DxoJY7LEaghB6UPjrjaz86JsYySwvM897iXw3u6ChRUXbn6Zpg+
 +WthlHBXJ4OZwV+F8KKOvih+Ey84CoGk+VoUkqWftQKIBfw8JJnIjDah+MsJ51eMg3KwzaXj
 l7EARoRqeTXjZUy9d3F2fKNo4uzSrMsFUtGBWjLq72xMHCCrGakxIZBVseOfCzcCzyoqPnzO
 70NwqilYvMdnVtMv45tKJpRzPozt4n1urtX7gV4B3GXPV6lPaxtfyud1s5Vu6wTmrIA4VmqW
 liC88VxMKmSPJ+3C0YYIQcoY7jR1fwQnTWOv/05LF+juX1y9buDF05TIwONmGpWK74saNEpx
 uIoucg37Q2ji0V1boba334Mr2ncfGYdV6gHt40BBN65gwUm/VhOfJjAB3Kk+5qIcdhNbhEnL
 zL8aHAuXFiAKp4uq0YOKEU=
IronPort-HdrOrdr: A9a23:ZVa5WqC7/jZSQenlHemo55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG+c5x6faaslossR0b9uxoW5PhfZq/z/BICOAqVN/JMTUO01HIEKhSqafk3j38C2nf24dmpM
 JdmnFFeb7N5I5B/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,302,1635220800"; 
   d="scan'208";a="62796213"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9Lp393azELZDF4/nm0Ks/KVSYkPBTw9KMYbP/3ZnhH+WHlmKEY0NSFOeHA/ZUXRTYfFhOZEERWpxQXVG61paheQMff5nIzeqd34KuEmIisN+LqqcyG2Ms1aGe1dEJURyED6s3r91nm1hi0g6pF5p88UIJ17xUUMJYtH6TfXAJxpgT/5k356l5pGn5/BtRfKB2DaORTs0kcSpt71iq7GqDpI5jOdGMa3+djaN+6IylP7avvylNwbedc8kT22rj/f1FLno9Lcyncq9ZlGbDuHZBv/0Citwu+yqlg1PxSmhsflgGfP7zJj+kQVhEZ0GQ/dQD/KogRzJnJuQNlec8MhRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDLtlWQqNzg2kghQsdID9mdmxnN6XGhx23AX6/vcdxg=;
 b=az9c9KSXNLn7Kk0OeNxk2g9cTWvaZwcPxTj6UjLsWPStQSTrQepVK1QLw/BGYQIuFCdoXD1KacdNateSIaAMsAL4ZMNdTFXwLZnanb/saM6KEkAZqvO6Nhow0ZGEOa+oHWE2pZGV4DfqvlTF+2n34lqdhagZmL69Uwvxm1lIqKjphIfVUJR3XUsFhacJ96LFL1ahes+tJme4AfiWzwWzKxIFpVZmI6nCsC3iC6ZI31BcR6VHPHTVRXfrEZfCwJFmxvKPSLwsTREE0uKso1r1v2UOmPdEscX5OF7j1yl4ml0DI/qDdNohWRnLzG+TFGYxdu5NwYBhCq0iANGV/EPmrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDLtlWQqNzg2kghQsdID9mdmxnN6XGhx23AX6/vcdxg=;
 b=UGTbYzI2ByqCDzEMfd37GMVX7jwbEZFgrULRkXkHbWAdIEboZw9YzRQ/QFMfWE0Et3Tbh0JQqEkOfD5DcqSctov2tyBr3fhNUubC0idw8LBklhTBvQyiO9jIeu+RAd+PN8XXDDCbkCyH9rW2n4H7jUpvhMHSds3D/1Xisvfwi6E=
From: George Dunlap <George.Dunlap@citrix.com>
To: Keith Coleman <keith.coleman@n2servers.com>
CC: communitymanager <community.manager@xenproject.org>, xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Retirement of XenProject 3.4 Code Signing Key
Thread-Topic: Retirement of XenProject 3.4 Code Signing Key
Thread-Index: AQHYDepT2VbTXNP18EWm59/QsD5Z/g==
Date: Thu, 20 Jan 2022 10:41:48 +0000
Message-ID: <F388AF1F-1E62-48F5-9CB6-A4197BD6F9D4@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8530fbe-7b4f-4799-cd65-08d9dc017685
x-ms-traffictypediagnostic: DM5PR03MB2601:EE_
x-microsoft-antispam-prvs: <DM5PR03MB2601F33D446AD9365D9C65EC995A9@DM5PR03MB2601.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TnsMzCerpabgfeBwPMeUxEBfB4zK6tMvW2JqT0c2Ljdi/eBBGS9Jrm3j6FfOD9wdW8uYNnL8aqThHM7DFntc4eWShEI7s2UUUsNmh5tjS1fuhwG0Ql8rmPJ86nZ+RvK+ioPNbn90r0lgWbDS4QoZqHhMVTfHc5u6favjgTCTBmAU//oHtogN66T+tyYQVo4akTVqyBzgY2Z1G8EQs+o9dF65I3WSrsYTCL4bzThMclJI/VMZscABri13fYRkiEzU2fnI40cRswfCxK0ydADXcr9WW9TByxxm4e6p9Lwrx7iNs/6wq0sSmyFAyAvze0NJp0G3dlg/wPrb5Azn1ZsalIUDUI+xfgraqH+pJvKn9E5M1RjhoXCyEWFIcc5+0Y+Mz/upNqj7HfqcYN1ooeCqCDQ6fPkG3NYQpNbnu7jC/eMZXKwvoOOe8adoLj66Lo33ZBhgNKvafS1ma/TOAzeE2TLwuepA9GUp1gADpIdQh2rsW7yGfkrgmivIo3hrhzKwWvLP8JC4eFwu9ibyy0uiB+GcbQjLJF9sNiztYtKTOUT9bxW5HKeHG64HkFVzChYS9fNVHhuwNtGQ+aFel6J7uJ198wzICdy5zE040ta0b/ksD/1LlLPX3aDisvR0pRR8dvmLQffelUFaSFSHSsVuvr+wqKSgW09yPJnnzQJs3n1YnG06oSqbBwuH7eI7HBtFeTm8a8XSmuLVZgQYXsbLeqzFdUZzssUcLM0Nm5kxEW1OMlfyWhRIum6D7aH7ZmePQP99C6W66OZ8Fi2XtM5Ka28IQKahReoD5s/OBVvxWaCe6/mSDLe8HS+/xBZZjij/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(83380400001)(6486002)(38100700002)(54906003)(2616005)(122000001)(64756008)(5660300002)(4326008)(71200400001)(2906002)(8676002)(508600001)(91956017)(8936002)(316002)(186003)(38070700005)(76116006)(6512007)(82960400001)(4744005)(26005)(86362001)(33656002)(966005)(66446008)(36756003)(6506007)(66556008)(66476007)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVNUd3RFQjZJQzg4K0pJZER0N2V0OWptakZPeG5QeFJ4Mi8zZFo0dHNwanZH?=
 =?utf-8?B?Z2Qvc2hXL2RucGVhelQrM1MveEpIV3pGMVRkbmFrN2Rnc0g2dEZ2Q295YXlv?=
 =?utf-8?B?NFBRNjd0STJ2em1CTEJQcVJtR2VLSU16NVBCMm5VZmo1N3Vpc2pZOFN5R2dP?=
 =?utf-8?B?KzdzeVJTUyswODRuaGxJeTVUdzYwQmozRGpkc3ZWRDc5dmJiWDdIcEVGVkZD?=
 =?utf-8?B?OTIxcHozU2VZVEw5dUtGU3VNVlFKL1JnbXQwUi9BUXVCTmkwNkp1bzBJRHps?=
 =?utf-8?B?djBtWWxEYnIvamU1OFBMZG9jdFExYjJFb2xqQUo0U0xReUJadEZnUmpsdEQr?=
 =?utf-8?B?elpQOEgyQjhTdE5MeWhlZmsyNTVWVmE3LzFuL1p5U0NmanlELy8vclh1RTNW?=
 =?utf-8?B?Q1dxa0Yzbk1yWjRFVXJtVXM2cTlPY0JLMlU4cVYwQVZmSjZvZlY3ZCtibmo0?=
 =?utf-8?B?clVTdzBqcGRkaktHYmRIYWxod05Ddm9vR2ZIVU9lN05sM2xlVmxlRFc4Szly?=
 =?utf-8?B?bEI0c09uc0VNVmxEL1ptMWZPa1lEeWpIM3Q1UExUK0YvZm1hRkhPQXF2ZzFh?=
 =?utf-8?B?d1hrbUV0eUhMaVozQnQyUHFhaTdhZmJ5ZmNXYXJyR0NXQzc1Tm4zdk4rOWU4?=
 =?utf-8?B?Z3YrMEo2b21oYnk4cnFPVFVpTGVMWUcrMmhydkJVYUphSnhUaHRhM0xqLzA2?=
 =?utf-8?B?RFlZT3BjdnlqTWFYdVVwRUc2V0lXOXYyRGNCQmJvdGJBNFRqOFpXZDg0bnR1?=
 =?utf-8?B?VGtNTDlRMmsxV3NFbXh6WEg4TnZkczJuYUdEWHc3dWtrdy9KUzNjU3NMWEVn?=
 =?utf-8?B?cDR6OFVSa3ZIaVlGT1ZnTHNOQTlOVnVCRThMT0QrTEgrYjJWU3MzNnh3VVBS?=
 =?utf-8?B?Tlo3ZlhsYkRheng3dmFrbkpIaE5kRUlPYzdmcjFEMXRPK2tISGRMcGlabVZJ?=
 =?utf-8?B?R25zaGdiNFZjOENLMnhMOFpoYkh3RXBuV2xYeHQ3d1dUZUUwVUwzK1BjZG9a?=
 =?utf-8?B?NytnWm1kZS9BeHNhc1BGWURhQUhPZjJqT0d2TFJaKzVuR3RMMXhpNC9TM3J3?=
 =?utf-8?B?U0hJV1JEOEhST1Qzclp1MENwU0E1UnB2bjhQT01BeW5BTUJIdHNHdVJnZ3R4?=
 =?utf-8?B?L0sxbit3RXAzaFY3eURKRXJqaWNoVVB6b09ZNEpmcHBLZ0tRS2pzMmZtbTlD?=
 =?utf-8?B?M2NpRnRiWEN4NlNLVnpNRjlibUZlQUFlZzgwajZZaGZoZHpRelNWTnlNUDZK?=
 =?utf-8?B?TE1ESGxxMGM0eVpQWWdMaThXMks5OHA2NVJxQTM2aDlPSFNPRGFwVFNESTUv?=
 =?utf-8?B?OU9kRS9UUGJCOWVQWU1pVGNnMnNTcVU5VTdoQTMrNFdmaTlNelhnOWZUUFQz?=
 =?utf-8?B?ZmN5eDZyb3FaUFo0cXQ4TFpEeXZQc21nTmRubjhQZ2FlMnM5OTMwMWs0cTZZ?=
 =?utf-8?B?cS9jOElKQXg1ekE5M0txMTJSSTFPVkFMN1RPMEpEUmxYbHNCWitma053WWNU?=
 =?utf-8?B?ZUZ6Y284ZXB1dWNpS0JMdkdxd3VoR1Z4R3dlQXJ5bzZSSFFNbjBPWit4Ykxr?=
 =?utf-8?B?MnVmOGJDendaR2l0eEtqaHUrL09SUW1peG0xQWYyZEhDclR0UnU4ZlR0MG8v?=
 =?utf-8?B?RmROY1VrMXhmSjBpUUFFRHFsS3ZWbWRqKzZ3L2pONDZ6Z0tVNGJrdGJBNCtN?=
 =?utf-8?B?SEh4bGJsbnI1OGxXUm9wMmRCY1dlY2o2Z0c5ME1xSnZ3ZnJWYjcvMU8vS2Vt?=
 =?utf-8?B?NzlFNEVJVnRNRUw4akhiVVFJZEZOMEZ2MmRUeWZjSCtpSzVNRWk2TVRveUJw?=
 =?utf-8?B?Z212Q01TUHd0MUJ6bWpHWVdESFBUZzZJTElqQ0xCbWxyREZhRThLbEErdGxh?=
 =?utf-8?B?T3FrSU1CK2MrTkNaUXoyUE85MWVUS1FCSnBTakwxZ3ZmQXRZT3lHTHVMTTFl?=
 =?utf-8?B?NDdUNWVQN3RkZEk0Tk56MVltckZ0bHRsVjJYRHE5Z3JHMW8yS3lZUjZQcHR6?=
 =?utf-8?B?bTN0QW43WDNsV0dtWWppSmVzd0lFYUJ2K1NGZ2JLUDJEWHZaUERYU2hZY21S?=
 =?utf-8?B?N2hWaWJFR3NDenFhTHFoSGZjK0NUVmpPQUdZOHplS21zMmJ6ZnZvZHB2NXE4?=
 =?utf-8?B?RHExYkZZQWRhNFFXQXUyaHdYRVZWR2pTbitwenVOT0NxRGNIR1RpUXRUSTN0?=
 =?utf-8?B?R3p1VC9NUnFMWUpPV291R3hZZEFDd3FwVlhldFNmZHdaSDErVkFaaG56OTlj?=
 =?utf-8?Q?qpt84JngpYZr20+x8rNAXwb11naflKOo+MfyTj7EIw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48B26BAF3E6C6C4582AA3F47A1DDDCAF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8530fbe-7b4f-4799-cd65-08d9dc017685
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 10:41:49.0100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gHrMjaaAFrphK/zkpK7IQLyxbzrYufKW5ctnqy1YH8NfAfIttVKo0JEPhVgFW8yqWiiufNFI4w66XHegexrs5BIwMqltvUCzSN7uG/tUBqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2601
X-OriginatorOrg: citrix.com

SGVsbG8gS2VpdGgsDQoNCknigJltIGN1cnJlbnRseSB0aGUgY29tbXVuaXR5IG1hbmFnZXIgZm9y
IHRoZSBYZW5Qcm9qZWN0LiAgV2hpbGUgZ29pbmcgdGhyb3VnaCB0aGUgbGlzdCBvZiBYZW5Qcm9q
ZWN0IGtleXMgWzFdIEkgbm90ZWQgdGhhdCB3ZSBzdGlsbCBsaXN0IGEgY29kZSBzaWduaW5nIGtl
eSBmb3IgMy40LiAgU2luY2UgdGhlcmUgYXBwZWFyIHRvIGhhdmUgYmVlbiBubyBjb21taXRzIG9u
IHRoaXMgYnJhbmNoIHNpbmNlIE5vdmVtYmVyIDIwMTIgWzJdLCBJIHBsYW4gdG8gcmVtb3ZlIHRo
ZSBwdWJsaWMga2V5IGZyb20gdGhlIHdlYiBwYWdlIHVubGVzcyBJIGhlYXIgYW55IG9iamVjdGlv
bnMgYnkgMTAgRmVicnVhcnkuDQoNClRoYW5rcywNCiAtR2VvcmdlIER1bmxhcA0KDQpbMV0gaHR0
cHM6Ly94ZW5wcm9qZWN0Lm9yZy9kZXZlbG9wZXJzL3RlYW1zL3hlbi1oeXBlcnZpc29yL29wZW5w
Z3Ata2V5cy8NClsyXSBodHRwOi8veGVuYml0cy54ZW5zb3VyY2UuY29tL2hnL3hlbi0zLjQtdGVz
dGluZy5oZy8=

