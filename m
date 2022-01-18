Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251234925F3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 13:46:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258475.445172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9nrk-0000MM-HK; Tue, 18 Jan 2022 12:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258475.445172; Tue, 18 Jan 2022 12:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9nrk-0000KU-DD; Tue, 18 Jan 2022 12:45:36 +0000
Received: by outflank-mailman (input) for mailman id 258475;
 Tue, 18 Jan 2022 12:45:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pp88=SC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9nrj-0000KN-6Q
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 12:45:35 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85604172-785c-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 13:45:33 +0100 (CET)
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
X-Inumbo-ID: 85604172-785c-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642509933;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4BubdTAbofzqa/SS89aNll8e3uMUBBan5kLFhgd0KSU=;
  b=XxdcKcNTlfLQDGW39viWINBT2PIvzk6OuVVMW6THT3Q0JWZYfidcMZfr
   Z59kByBQZbseSKchz+bq8lS2b3Z3J7eKsMnwPQZkaU0LkKQL9ItmmiUW1
   0cU1XyTiOjgxuKKNe1OrwmIp+7x96eMQvr7tdX0MLXzcPG2qXMHJqbcJw
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: z/U7XjDqLD4W0NKUCmKjsVj6PupdXDh2sFgP8BQ0h0E0SzOwKil+jk1x71EA8FihYBeqIecE6O
 MNR2+2lMxP3vmECvAYqc1srOWMPHkB9nnVQC7Ls9bzljdZ2PVAJWQUutgQg4+88E6UnxqChyyP
 GRiHBWCGrzMw2fJ0kwwCk6zU69Ej747j9weet5KvKMUB0454fUKo1lePCN4II3wvXMqWjYd+sd
 JUHu9t94ktwcWViyZxn0K/8WBsBiPbT3W2JxE3+FLpxBVWYoWaHbKSBa6+Jyti01uGDoFfxda8
 6btH+YnsUAduhQ7vFSovt4+q
X-SBRS: 5.2
X-MesageID: 64349220
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FVWnx6vo1DQHGQC33Bxo88ERh+fnVLdZMUV32f8akzHdYApBsoF/q
 tZmKW+Cb/mDYzT0L9p+PNvj80oG7ZWAyd5qGQBuqSlkFXsa+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx2IjhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl5LiAFh4PY5b3gu0EUhdSCjN3P/Jb0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JwVQaeEP
 ZJxhTxHbwiRYRtuMUYsMIsyjsOP3XzvYSZFtwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDZNf+oPCstn0zqXw7PV7QyAFGEGESNoPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLSfbt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb4
 xDofODEvYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0keBs1Y5hYImW0C
 KM2he+3zMUMVJdNRfUmC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmD2PLbimkUXP+efONRa9FOZeWHPTP79R0U9xiFiPm
 zqpH5HUm0w3vSyXSnS/zLP/2nhRfCdrXs6n+pUHHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu2NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:6czsOa9CuKEUd8QI2H1uk+E6db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICOgqTMyftWzd1ldAQ7sSj7cKrweQfhEWs9QtqJ
 uIEJIOduEYb2IK9PoSiTPQe71LoKjlzEnrv5an854Ed3AUV0gK1XYeNu/0KDwTeOEQbqBJaK
 Z0q/A37waISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGQ9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9wwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgjf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosPD30E1wsa7VcKM0l9
 gsBJ4Y4Y2mfvVmHJ6VO91xMvdfKla9Ny4kY1jiaGgOKsk8SgDwQtjMkfEI2N0=
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="64349220"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZ1wLv2+jV4t7ot+cvRriOhk0NXbGeicT5mcydezrl015T/4K5s/ZBweJrS3rXBFgfCDTGgbtkYfImecD5rjfpgtCSO4v/7+RsLIBcesu87CmW3nOBsWGKWFJ3JRhMDS9j5/UEMGsgcyMrB19FgMccbvnulJy76sGnEsMD1Hs4Jx/RfVqNLS7jnjvjWJ+RMF37W4Wu7zQ3fyHtD2tUZnDQifRQ78JQn2DcMsnVVJv/mg+MnfeHtDRt9u9YcCtkhiS7PU80FJKh74W8ffpeI9T5E9TULLbuVJwkW34hHjWAHGWcW8TWbNSSBJ3exunSnt9wdzcdAiAhU5EZUMMH4ZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3IhpHkgH3+YnSr4acbdkM+taRDBNemAk9nA1ypjnBc=;
 b=R/7RcgkVDR72VElFDueOLDug33lEzemEd9CuQyQ1nrcbel8SYlcBkPyB4PzQ5p2Og7obYalD9A3vt17bZywrQHngdslWDRNVVDpypnkOZXHoEgKWI2khlYcFEod1XpqlyR8tcf7C2H21gEGtXEfGxXwbn3GeKvT/ux1PKZbCkQ86wRB0e/kKGOd8v72ikVAXdiO5btcEqzzsZURT6CZg7fkWX14kvqDHHBoiVtIoKfYUNAj2bpBYG6Q4KO6eY2kcmCivK0bq3GwW6DllY7P/ex8CMocs4YyLnoZu/XiX2K6tOx42r7F4dA6PBKY4dxhZyyK0KplSKYy1H7/FB1jC+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3IhpHkgH3+YnSr4acbdkM+taRDBNemAk9nA1ypjnBc=;
 b=r+lsmuitlP4WQrPof7hpnRzBVEZpjIs2Dpt+70aOj/qCS7Gu4cH7BLBHSfs3LOMRf//3TcGj+BNPKcqbheE1CfcamdvBFMjLnRbbtGFvNmJQ7w5iyNfIzRvVmi7/ZJyhx+6otCWykHrsWxu4NElnS9va0W7nZGWC5vJ8fsSJgTU=
Date: Tue, 18 Jan 2022 13:45:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/time: further improve TSC / CPU freq calibration
 accuracy
Message-ID: <Yea2XRrFn7qCIx/h@Air-de-Roger>
References: <6c50c7b6-e521-e34f-1808-a4e2961b807e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6c50c7b6-e521-e34f-1808-a4e2961b807e@suse.com>
X-ClientProxiedBy: MR2P264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3223e6d-e345-4714-300f-08d9da8064a9
X-MS-TrafficTypeDiagnostic: DM5PR03MB3100:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB3100321A2DBF407F246745B08F589@DM5PR03MB3100.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9kPV+tUyO/GPkm22JP4DxnYxiH5iSDyojflpDLTixrdhnmIOisX7mWXI/mnGUdz6Cx2+R9vDemTaX8hqspsQrq3The5JPx7QGHwpZv0MTySt68DkzLvMB5odIlDFe0JSRT25oETExI0kgKEsiqeFBWzFfh8Ebb5EMn/G7byBy2DzD8b5tMdS1xll3KEZyWnXnbaNEzIxUlMnExAiF1ICOG5RD38sIaM0UUQPAworr7pko9zDbB9F2ILp5z+aMGR6kcWnKrrnkkFAqgWSexhk5RVc6+9Ek0GwLrjeC+JpHmtv3UzlJ9keAO9AoSl7M1zRgqxnPEanZLDQ4vqEE57AK157hxE+QZ99YKpp5UXH5FhErHAVCzxh8B5HvsxZec5HPQ+eMhzFywiG8FBTmKzAFK89PiNo91hs0xMjZgLo+dk1TvvhkT+RTqgdMk78a3MwA7OK36S/VjlY50dMkUnCltwPpCFaUjHF/BSL3ejoAUY+V/NSD/XTU7TvtAmDqRcTGDDnXqGhOCDd5JkeDq7KMWrcKPCwTU3rPGaJJyN2DlMsLzFnGS4SEmcwxCjclnsVaHuBiToV/eC8cXqwjIIltjz4TZQY1ZCyR0obnntR60UCP0STFTn2bZ+UeaERY7thmzg97TWP4nmHNAYfEJpADw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6506007)(66476007)(6916009)(86362001)(6486002)(186003)(5660300002)(66946007)(8676002)(83380400001)(4326008)(6666004)(33716001)(66556008)(8936002)(85182001)(6512007)(9686003)(508600001)(26005)(82960400001)(54906003)(2906002)(38100700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0N2MGljUDl0VVVBdSt0eElQNWhieU96NjYxRElzWjBNK1BOREtHWDZ5MTRO?=
 =?utf-8?B?NkZSU1FOVzZOZGRtbjl5NFI4Z3RVWGt3Z3gvQ09JZlFOcHh1dE5aK0QvZWxW?=
 =?utf-8?B?WGVsTjYwOVF0d09IVldqRzlOV2hlZzVFVWt6amxrR2RZZldxZWdNUlZKVnJT?=
 =?utf-8?B?QTlDeG9PM1VtcHh5TXlXWUhFSG9mVkl0YkU1WHpTek0veUZyMGN3OGorb0Fv?=
 =?utf-8?B?bFhtTkNMd0x5MkJySE8ydy91ZzdWbTNMdE9tSEljb0J2cHgxOXRPZkFuQy9U?=
 =?utf-8?B?UDI2aDdNMnZuRVV0dFRyVUhPNUVETWJ3aE9VM1h2NWJRZThycHFxaDlRN3Yv?=
 =?utf-8?B?aS9OL2ptSnliOHlxSEJ3Q3JjcExEUmpuaG51bEtlckQ5ek1JNUNIWWJIb2xr?=
 =?utf-8?B?MUFjVDhEejhpcWgvMU8wZ0FWWU5CQnJrZElrTkV6RG5TYVEyTmN2LzJ4amli?=
 =?utf-8?B?RlJsenkvYjEweUJ2MEF0ZHc4ODR3R1N4Q280dCtxRFV0WS9UWjFISzRHVkVT?=
 =?utf-8?B?TVZMOWVzL1JNUTUwcWVEQUJqemNiSnlvUEE2NXROZzFucHp3Ykh1Vk5wb2hS?=
 =?utf-8?B?d3BCOEoxUFFIdXc3S01lcHNJQlBXYUcwN3VCdG5FNkhVUkM2dklDN3FzTmZG?=
 =?utf-8?B?TGQ5d3VBWjlpNkVQWXFudGFFa2xKbzQzOUJybERTR2R2RDhKTFRaSnZCVUhG?=
 =?utf-8?B?QmRETzJianhOam1EdGVxRWlONCtFck9pQVBpN1RoamlSaUw3NzUvUzU2VlpF?=
 =?utf-8?B?dGFSbktaRW9Xa3VDV3BTb29EQXlhUjUvV01RK20wWitOTjIzK3NrZk5WQzRz?=
 =?utf-8?B?NUJRVzBMMjEza2t0eE82cFVzdnF6enU4bjV2WHlpL1dUa09VSWRwc01OQ3Ey?=
 =?utf-8?B?VFpJMEswUkkrdVNYYW5ncVc2Zm5rNkJlZElPVmxXVUc3RHVWazQxMFBuSjB4?=
 =?utf-8?B?QnFUR3NKRDdLMjZJeFVBaG9GVkhYUWE4Z3hIbWtScmJ0eTU5YytpcVU0VWk4?=
 =?utf-8?B?ajBGRDRlRXZqdEZFdFhJN3lQZzJEU0NUK1B0K1RTTUc1MlJQdThzU0JiMzdh?=
 =?utf-8?B?eE1IVzdabGNLWnBjVlkrZWM3R1RwYjhTODc1d1R6T29taGdUS1AwSWJUMzBY?=
 =?utf-8?B?M3Vvc2hrUXFCMTdrcGk2bHJVVExraTEyNFIwd00yM1BRdEduSDFpZUpFY2Rj?=
 =?utf-8?B?Rkh3eUd6UU94SURtQkNmTVRxRWh6dGEzem96QUJpSlU3N2FPc1FtUmRwZ3Ay?=
 =?utf-8?B?Tm43aWFVWFNROUs1empidjlidTcyWE84T3RBcWVRMWlxMXllTTEyQTREYkhh?=
 =?utf-8?B?YUZ5L20vZWJQWkVDbEQwQWhHTWJ6dmJBNUhDRE5WR3JyR1htelA4eEhNamVR?=
 =?utf-8?B?MnZ0VkdBOWRSc0FDTEQyWFQ2QXBvaVJkdUZGNXJ5Q25Za0VDRHpwa3Y3WDdZ?=
 =?utf-8?B?bjNPZ2o3RzllZ0VYcWh0NmhDY2d2V2hXM0NsYU9mTHRhY1ZSc2NoaSt3M1ZQ?=
 =?utf-8?B?NERKNlVSMWZZYUJJRFB1ZExXUVg3VnpXbGl6OEtwZjFGeElzOFhvZGY1WWll?=
 =?utf-8?B?V1NpemdmdThNdjRNRE5abm5VQTZjR1NEUnZVSk5DUUgwRUdJRnllSy96TEl6?=
 =?utf-8?B?SHM3NURKZEg3ZXFiL2VjeWhLKzRyWHFxTnZlaXlkKzNaUGhHUFNvOHRrZU5m?=
 =?utf-8?B?anZWRlFDZk42YVZDZVR3QWhMMjFEeVI5SnQ5dVNySHFkb0Z0SWlwbGo1bDdn?=
 =?utf-8?B?V0ZSRjVpd0NnMUVPQlk2ZWtENHJ5azBPZW5qM2pzZUp2SmcrZVNKaEE2WUlp?=
 =?utf-8?B?VFZMZkVmYlNjM2RYOXBKUDFsU0tNcStHQ2RpVndPRmIxM3dYY2JuVnF2Zjht?=
 =?utf-8?B?MEMvQnd1SWJmcW9UOStiOFZHK0trQVEvTnJjUTZKRzBsWGUrbDZXY1V5Tkd6?=
 =?utf-8?B?enYzYWF1TnZSazZ4LzdnZ3ltbkR3cjdRTUtCYWtNc1JXM2ZoZlVvdkFaYytz?=
 =?utf-8?B?SE12TEpEN3VmVi80Mzk0MEZ2OElMNGJqcHNmWU0xNE5LdURoSERtdjMyUm4v?=
 =?utf-8?B?YTVZM1FkY2RyOXhiako3c3hVb2FEL0pDT1hMa1o2SGVoMGdrN243TGF2OGNx?=
 =?utf-8?B?Q3F6L3Z6dnE1WWplRThvZDROQjlucVhiYTVUWFBGaEF1UUZIWVI5dk15dnFx?=
 =?utf-8?Q?xMHjVK05nj8iSY1VbMZoTms=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3223e6d-e345-4714-300f-08d9da8064a9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 12:45:23.1458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecVMVquuiFa2MQG8HVIDkKdHNLXFkT/SrIJVbyjZ7gjxn6OV0n3Jvxwijd6ym5B3AMnVqU8Ry51ApX9QElkriA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3100
X-OriginatorOrg: citrix.com

On Thu, Jan 13, 2022 at 02:41:31PM +0100, Jan Beulich wrote:
> Calibration logic assumes that the platform timer (HPET or ACPI PM
> timer) and the TSC are read at about the same time. This assumption may
> not hold when a long latency event (e.g. SMI or NMI) occurs between the
> two reads. Reduce the risk of reading uncorrelated values by doing at
> least four pairs of reads, using the tuple where the delta between the
> enclosing TSC reads was smallest. From the fourth iteration onwards bail
> if the new TSC delta isn't better (smaller) than the best earlier one.

Do you have some measurements as to whether this makes the frequency
detection any more accurate?

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Obviously (I think) instead of having both read_{hpet,pmtmr}_and_tsc()
> the calibration logic could be folded between HPET and PMTMR, at the

As an intermediate solution you could have a read_counter_and_tsc I
would think?

> expense of a couple more indirect calls (which may not be that much of a
> problem as this is all boot-time only). Really such folding would have
> been possible already before, just that the amount of duplicate code
> hasn't been this large so far. IOW if so desired, then perhaps the
> folding should be a separate prereq patch.

You could even pass a platform_timesource as a parameter to that
generic read counter and TSC helper.

> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -392,9 +392,36 @@ static u64 read_hpet_count(void)
>      return hpet_read32(HPET_COUNTER);
>  }
>  
> +static uint32_t __init read_hpet_and_tsc(uint64_t *tsc)
> +{
> +    uint64_t tsc_prev = *tsc = rdtsc_ordered(), tsc_min = ~0;
> +    uint32_t best = best;
> +    unsigned int i;
> +
> +    for ( i = 0; ; ++i )
> +    {
> +        uint32_t hpet = hpet_read32(HPET_COUNTER);
> +        uint64_t tsc_cur = rdtsc_ordered();
> +        uint64_t tsc_delta = tsc_cur - tsc_prev;
> +
> +        if ( tsc_delta < tsc_min )
> +        {
> +            tsc_min = tsc_delta;
> +            *tsc = tsc_cur;
> +            best = hpet;
> +        }
> +        else if ( i > 2 )
> +            break;
> +
> +        tsc_prev = tsc_cur;

Would it be better to set tsc_prev to the current TSC value here in
order to minimize the window you are measuring? Or else tsc_delta will
also account for the time in the loop code, and there's more
likeliness from being interrupted?

I guess being interrupted four times so that all loops are bad is very
unlikely.

Since this loop could in theory run multiple times, do we need to
check that the counter doesn't overflow? Or else the elapsed counter
value would be miscalculated.

Thanks, Roger.

