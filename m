Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FC1366853
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 11:47:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114242.217647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9RY-0002fn-Lo; Wed, 21 Apr 2021 09:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114242.217647; Wed, 21 Apr 2021 09:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9RY-0002fO-IN; Wed, 21 Apr 2021 09:46:48 +0000
Received: by outflank-mailman (input) for mailman id 114242;
 Wed, 21 Apr 2021 09:46:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wOap=JS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZ9RW-0002fJ-Co
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 09:46:46 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09ee9c64-40d0-43fd-bff3-e0b4f0b565a4;
 Wed, 21 Apr 2021 09:46:44 +0000 (UTC)
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
X-Inumbo-ID: 09ee9c64-40d0-43fd-bff3-e0b4f0b565a4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618998404;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2ExYo5GYk0ZYCjB2m6wa1qY23SFn9W0dEsKeB2MJQcI=;
  b=c6wYPqGc24t193iDbN7fv+xJwLnlrD4GkVbpjc1cM9a1UawRFzUIouq0
   68r74IGqTaSl5ptrcwcQvMg9a79qYlzJJQV2CIeRHEXa7wZBOGSddhfXy
   lLwy7AL+eIQ5ZEasNJVjqsbg3HgsZXLEuiIzjeSKaMXcdPJ0BX4G2UK60
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OHDzpqKF4BzdPwMHKx37PegB+bepLn2ilThgvhvjci5F4fsxm/0VGFeL2JxdOtT35VB3FbxPcW
 joRHSn70fIEtjBCi67bnbsrakIYYlLy8/tM+jJeBAAq/0g7PesS0TKX1JOAY+Bu4zYdmanaqCe
 glpZ80vr4LN4YoQkCKg7fIJPlZh9Gi2ICmNUjeQcmLEqC6QfEnYbYRc59r9G+g0sDOXQP8cTsv
 ECf7IMKhOt6dRfrg0I+adxiz6bKf7Fn/dtYRUmyz33ocrX9O8Lb0bKL+V7ol9kmQvMZZdKK1jV
 Jb4=
X-SBRS: 5.2
X-MesageID: 42064409
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:kYAuq6kX4bb5ch0+e4CGrXKhsRDpDfO9j2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN/AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 tdWoBEIpnLAVB+5PyW3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0ZNi+wOCRNNW57LLA+E4
 eR4dcCijq7YHIMbtm6AH5tZZm4m/TgkpX6bRkaQyM28QXmt0LS1JfWMTi9mi0fXTRG3Ks4/Q
 H+/TDRy62/v5iAu33h/kDJ6ZA+oqqF9vJiA4i2htEROnHQjG+TFflccpmjmBxwn+218lYtl7
 D30mYdFuB+8WnYcG3wgTaF4XiY7B8U53XvyUCVjBLYyKSTLlJKaLszuatjfhTU8EYmtt1nuZ
 g7p16xjJZLEQjG2B30+tmgbWAVqmOPvXEgneQP5kYvN7c2Vbk5l/16wGplVL0EHC789bk9Fv
 hvAMz29J9tACynRkGckW91zNO2WHMvWj+AX0gZo8SQlwNbhXZj0iIjtYEit0ZF0Kh4Z4hP5u
 zCPKgtvLZSTvUOZaY4IOsaW8O4BkHEXBqkChPfHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHtFqG8bYSvVeIyz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykvGnv+4UDqTgKr
 iOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+dEmJpu7NN432ps3WePveP9PWYHUZc1K6Jk
 FGcCn4Jc1G4EzucGT/mgLtV3TkfVG63Z8YKtmZw8EjjKw2cqFcuAkcjlq0ouuRLydZj6AwdE
 xiZJfukqaxo3iK7X/Fhl8ZfyZ1PwJw2vHNQnlKrQgFPwffarAYoeiSfmhUwT+hKgJgSdjVVC
 pSvU5+967yD5H4/1FsN/uXdkahy1cDrnODSJkR3oeZ493+R58+BpE6HIprFQvKEBRxsR1wqH
 hKbTIFQkO3LEKvtYyVyLgvQM3Pfdh1hwmmZeROr2jEiEmarcYzAkcAUyWWSs6RiwY2Tz9yjl
 l8mpVvxIaoqHKKEy8Ske44OFpDZCCyDKhdBAqIXolSh4vmYRp9V2uMmDychSwiY2aCzTRjuk
 XRaQmvPd3bCFtUvX5Vlpzn9155bU2xVUN9YHISi/w0KU32/lJIlcObbKu61GWcLmYYyuYGKT
 fffH85OQV13e260xaThRePHXgr3Y8VI+TYFbgvGoujnU+FGcmtr+UrDvVU9JFqOJTSqecNS/
 uYYBLQAzXiCe8lsjbl0UoNCW1Rkj0Dnvzp0hG+szT98347HPbIIFNpA5scOMqR6mD4R/COlL
 V15OhFyNeYAyHUUJqhz6qSUhtobjX0ikSyR/szqZ9Vsbkp3YEDVqXzYH/t7jV/wB46LM3Ij0
 sQT6Rw3aDZNuZUDr4vUhMc2mBsqc+GI0QquDHnG+MSfVkiiHnAItOCioC43YYHMwmkpAHqP0
 OY/DAY1/DZXzGb3bpyMdN6HU1mLGw94m9l5uWMasn5DxirbfhK+B6fPmWmeLFQDIiDFrN4lG
 cx3/i428uWfTH/wgbeoH9SJb9P6X+uRYeKOz23cNQ4heCSCBCrmaul4Mm6kTfxR3+aUi0j9P
 F4XH1VSN9ChDkkhJAwyQ6oRMXM0wQYr2c=
X-IronPort-AV: E=Sophos;i="5.82,238,1613451600"; 
   d="scan'208";a="42064409"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAvZqldqcsJnEyNR2eRF8g0tmC86dWJiLJspnBRtzucbyvgsjJpFF2qhV4zJ0vnCRTfICNt+PyQWUtczd4CWR/lhjy7VsevJVsXP8moPuvwgVASpOu1tl3nzgouB2ckOQb2AFSoAN7wOAZpwY613vv2VlhEb0ZdPQ3cQhonOv4P8cF8oq3MS5PsrcWXHj67tNjvmSqMoYmtMzRzAbsTBDR7YnMrabYaSF8CB5FHIb1Oqp45QPkuUyAOxdtQ5t6aZSgvkgCkyY4d0weLVvlLJippn2WENebF0OTJaVDAqgKVthSdB390ojjJpZ4vTfqV3uxdm+wAAecVn7cILI9RYVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ExYo5GYk0ZYCjB2m6wa1qY23SFn9W0dEsKeB2MJQcI=;
 b=azuDUepteBEoBX2Wsz+2hxJIDQK0KyE5y4NfNyxS47D/jqvfkpwrP1vTYRrkuNZPX9GMp5Epr+mKLulRJWeVX15wWAFCx1O6VNVLKs3HycbB0sPChM98ErRoY1y51cEr0aSgZ0w0ymfUjOSnko0EDK2daaQHkOpUjPxtXfhXMdBl+HKFX6QVUqybLngBlL59UVVqImeqtACdU4pqk9deVTiEQ8ex2xFDTcZzfO7wvKEpLsULEMauqdYAli/hxq3Hr09mbJSmGQkNleGXEKw43YYxH8YCbC7DQho46jqrEKLuZaVcTg3ZBRbm3OMlzJ5WYyVTVDd3PtZHl1+5gihWvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ExYo5GYk0ZYCjB2m6wa1qY23SFn9W0dEsKeB2MJQcI=;
 b=vwAK5EnDXjNDdxIhStwb7hsz5UmsdSsxeurdiAM7QmxD/Bei3/3pQ7KvBENxStxuzWMAkzIPiO1o6HjL87EAcMbb27E8GPFNlvIATRejHOtRZSiX4vgyJC9IeGoZj9YqtlZEKLZOLG4tf4+Vj/DC5pVGwddYieAl5hRnLgQhzGg=
Date: Wed, 21 Apr 2021 11:46:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 4/8] x86/EFI: redo .reloc section bounds determination
Message-ID: <YH/0dzlPxwWF1PA2@Air-de-Roger>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <b886eb2c-cabc-f195-4996-aae1fc3c61d9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b886eb2c-cabc-f195-4996-aae1fc3c61d9@suse.com>
X-ClientProxiedBy: MRXP264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 734a921c-3df7-4304-aacf-08d904aa5c16
X-MS-TrafficTypeDiagnostic: DM6PR03MB3484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3484E903A810B6BF0FF5F2EB8F479@DM6PR03MB3484.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C2M5mQ4IwnFspSAV5SCcqUPVO40tAI9q8XliODkdAObTnG6Efyn6sPKCDG5sUoNqaPP09prsn70rLIbFx/cKmTWWgfeloyIuNuBq+xH75oPvUuVsu0w4hwB7Cu7yRC9q/gfuJPNOZbmqtLZu+dcBrEVC93XKgSaEf5EvmJUtqM50on2uf+lry4ztFnm0OR/NSXpnqO3msbvDN7VlPBNMReltykQbZDEHto/wIFd33rcwKl9LCOXzlGWM49ZwNdoo3qaC6TzaInriKhJR34zfERts+7ACq34GbVTy0ekuXoVQ9xZwtX85AxwsRCfFRu8b2La+QhMXQCFO7nPj1sIAO/3UN68SfKQTa28w0b9WjMI/8bhJc0GndaQEcH/rAZMs4yQ+wZN/LullwWPUWCMVW9whSOjCxR5KQlZ5VX8RHvYOjxl2l8ZsggwDnobV9pgvgCKM/tsQ7e8A9hEsqRVwqFTrgICFFgzNyfEQm2HR2O/R9NYvHI1DZZMC+XGTeVmmf2f7KjhcNdPXiLxGA2SWupTMOeqxbuYXYWhy8thCdtA/oNjFfAyA5ruzqp6ftTzcwhk/g/l3/+i1Uk7EY+0IYxQgoofBX8a6JSPgNx4wzDPLLDFLLwWlJMT6WYld74XjVUwM28JDZaUMT1Ywf4fLX+dcX3P5oHWMh4ATzlUQV3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(6666004)(9686003)(33716001)(5660300002)(956004)(66946007)(8676002)(6496006)(316002)(66556008)(478600001)(2906002)(83380400001)(66476007)(38100700002)(6916009)(86362001)(8936002)(26005)(186003)(6486002)(16526019)(85182001)(54906003)(4326008)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ejREOWU3blBpYjBqVGFhdXdWb2s2MzZsKzRkNnRzUm95Y3lNUlg3ekZ0RVRV?=
 =?utf-8?B?Skx5QTR0RHNGbytTaDZEYVk1ek9XTzdxRmxQZUQwLzdPZ0dTVkVmUUZ2VmZM?=
 =?utf-8?B?UzkzL0ROM2Y0VEdjWG40ZVNGdmFtUUh4SHdTMnUzMFVPRE0xOEd2TWNYWkps?=
 =?utf-8?B?YXkzbTNadUFLWUtHcUUvSUJuZXRRV1p5aWZCbDFqNGhsTkxRc3UxZlhpam5q?=
 =?utf-8?B?Rk9WMFBXa0hQMEFkaWpoc1Q0STR0ZG1XVElJNHAzaVFVanVWNk1iSzJIcXFs?=
 =?utf-8?B?SFo1MkN0dHlVYlVvalRGektRMG5OQi9tOVpZN3FoeElPa0FqWXNySUNWMkNL?=
 =?utf-8?B?NjU3VlQ2cDN0UnBMYzNNK21jMGxCakR0ZThwS1dwL0gwWHlRVU9HVFkrMlJ4?=
 =?utf-8?B?Q08xU2J5anA4QUVEZzFobVF2ZlE5YjVkVjUxa2MzTzBqelI1b1JvaStYNS8z?=
 =?utf-8?B?K1I1VytZaExMSjN1TVB4dVdxZnpRcDdJemFNUEltOHgvQjhVOUVCTW5zNk54?=
 =?utf-8?B?VG9tZ2lRMnF4b3Fsck5HRkNaa2Q2SVhseDhpZjNUa25HdmJiZkcwM2poNDBZ?=
 =?utf-8?B?WEc3UTZONlNSaStjc3A5eEhSRmlwdVhIbU5uMzRWZkhZRUhqdEs5Q250VUlH?=
 =?utf-8?B?ZDFieFphY09OemVqV1lERkhvTzZqeXVBS3pHUGl5bDNZa2hUNngyN0pRRFkw?=
 =?utf-8?B?KzlRdWZubHNYQ3k2S0JTTmVYN3N2bWY2MHVhc0VSaEJtOVk4ZGF2OTBsOTJB?=
 =?utf-8?B?NldPenVZdzViNVZLOXRFYm1FNW4rZ2ZwOWF6aUdRdHdiMFhHRDBoZUFsYkJB?=
 =?utf-8?B?OHNDVUYzZkdPc2J2V3VYYTJ5WFI2WkErcUQrNzBIOVpVa09HcUZucnJ3V2Jm?=
 =?utf-8?B?aENYa2M5NDFmaTA0YTdKZzhPOXVoSjNTKzVmaEVYMURML0pzNW5tWE1ab095?=
 =?utf-8?B?aFFjQ0orR2lFWXR6a3hXR2paMmpwc1BFeHlwOVpLWDhhQ3RXMWZkbldoUThM?=
 =?utf-8?B?Sk5DaEhNZGlta21IMmFWcHZrK1loR3MyOVNRUlpDN0k0OTFiK1IzR0VmTDQw?=
 =?utf-8?B?MGpTbFJFbno5dkRaRjhOZXJrV1hnT1hWYnBMcFIvL21rNGUyWHdvV1JKZVAr?=
 =?utf-8?B?UitjVXpxbEEzUUE5WUVqRTlRalRtYWZ6OXQ3ZmVQcmQzTkJRZmpQY2M3QnNo?=
 =?utf-8?B?OU5ZQXV5UTJHdTBNN0VWdHpPeEpCM1pVYkd6M2MyWC9PSExrMlVqdUxadnUv?=
 =?utf-8?B?dEpMek5GcGczV1RDUm1DVisrTUNEN0ViYVA0U3I5Z29aK3JMSGlpb21JcVp0?=
 =?utf-8?B?ZWRlWStmRHh6WTRHYks4L0oveWpxc2JYZGZDNFcxYTdmUGFoZ0J4UTZ1OGlm?=
 =?utf-8?B?cHBwUGU4SGZkUHRXQy9wNG9yN2hybkxRVDFBQmNLVWpjZm1NL0J0WUFJNVUv?=
 =?utf-8?B?TWNiZVZrNmVyQU5tQzNUWFlHV0dyb1E3VjBmWE1xQXRoSXQyTDhPRnUrSFBo?=
 =?utf-8?B?ajRKbjRueG1FaWpQMFVMajdJTzRuYWovV0pEcXJ5NXVqeGlUc1dHckFuMVFP?=
 =?utf-8?B?KzZWQ2RqRHJGemx4bVRCVWh6T05FZDdiNzN0Y0haNUppK0I0QVdweFVtcmJN?=
 =?utf-8?B?Q3laQSt1c2h0bGxRYXAvNUNzb21sbmhmQURwVEFYWVpqbDJMRGZLNGhOVWRS?=
 =?utf-8?B?eDc5ekhCTWVTMlp6L1VKTk9FV2ZPbWkxNERXNnJ0RU1GU2NTaUlBZm5TMzdr?=
 =?utf-8?Q?2puirlSquiitTh15WDqfibbR3e5xYDLdqNY99nR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 734a921c-3df7-4304-aacf-08d904aa5c16
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 09:46:38.8075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mroLKLzUqSFPy/31+xY7WFYFmC1440Mnpgp/OvaCR4jjTVHkw/F8Nhp4JDulE2iAbNFCyRA9NLHealFM49TOig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3484
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 11:45:38AM +0200, Jan Beulich wrote:
> There's no need to link relocs-dummy.o into the ELF binary. The two
> symbols needed can as well be provided by the linker script. Then our
> mkreloc tool also doesn't need to put them in the generated assembler
> source.

Maybe I'm just dense today, but I think the message needs to be
expanded a bit to mention that while the __base_relocs_{start,end} are
not used when loaded as an EFI application, they are used by the EFI
code in Xen when booted using the multiboot2 protocol for example, as
they are used by efi_arch_relocate_image.

I think relocation is not needed when natively loaded as an EFI
application, as then the load address matches the one expected by
Xen?

I also wonder, at some point there where plans for providing a single
binary that would work as multiboot{1,2} and also be capable of being
loaded as an EFI application (ie: have a PE/COFF header also I assume
together with the ELF one), won't the changes here make it more
difficult to reach that goal or require reverting later on, as I feel
they are adding more differences between the PE binary and the ELF
one.

The code LGTM, but I think at least I would like the commit message to
be expanded.

Thanks, Roger.

