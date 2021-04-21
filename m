Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9CA3667B4
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 11:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114175.217464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ8tM-0006qc-8Y; Wed, 21 Apr 2021 09:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114175.217464; Wed, 21 Apr 2021 09:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ8tM-0006qD-5b; Wed, 21 Apr 2021 09:11:28 +0000
Received: by outflank-mailman (input) for mailman id 114175;
 Wed, 21 Apr 2021 09:11:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wOap=JS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZ8tK-0006q8-Ei
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 09:11:26 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d78682fb-bb09-4650-ad4d-9590ea78b040;
 Wed, 21 Apr 2021 09:11:25 +0000 (UTC)
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
X-Inumbo-ID: d78682fb-bb09-4650-ad4d-9590ea78b040
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618996285;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Ql8PikM4+9znwimw8PJ4OaTjEEx190FMrCdg1aI5QSk=;
  b=AUoHtbYLfIip5rKc779LdWmbrcuHV+dFcvD8OgoWrr0+8/FxXxGZAncZ
   wJyMX5zIlIEl0tR51yX9IErzFiz289EEvhg8fPvEkjzsNnQABHorCHLm0
   FycG7Xx4l6ksP9vX0PAoXxvqbk7QgnFIghmw7m1fRr8/vN7kdYln+CQB8
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bNx6acyhtKistrICTYJawBDDbyO2UL2dudq6H0zXkBEthXJ9SpI4xAA09kTo52MzG008JEjPwX
 LBDKDu2GYGxRmoIN4pFZAqrH1JQsx60lkLBKyqW5ZyOFCrEEqyL9HcuNTi0FnVDxzMyq9EPRSs
 79kgVzSuMHEloUhzsED/wCjRRUaqQZR1TnJ+wjAk735WKobRXD5XNMX7CQX0PrSUBgASTIWAo0
 lJqrz1rwquwYwbR1hUQhyN0wWlqCRNtMvFQA4Iw4bbUYAwO240CknVWZQWevna9XvAfailX1bo
 02k=
X-SBRS: 5.2
X-MesageID: 42443691
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:z1DLxKmV1tE9Tlh6Mb8ry4DhJC7pDfO9j2dD5ilNYBxZY6Wkvu
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
   d="scan'208";a="42443691"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPauvDpoRyHGZGNVlSdxlKDto9MLtgxKI5ksvIwfzyFI+7hB+AAatm8LRI+RkPXe8/ZsYMODOoElt8s3ZCYhubGXFT8MXiP5KzkTbr+RaBbxIXty5/y0PZ+JuNVwqAIXnMn6WEYkUUVCGq8Wy15j/xzHWuxSLaO9KUfzEa005Eu3UZsYfy71OxNo1cGHOXW3/5vCImSLX+AeJiPlfplj6Lqn418PXlQoV+8YwuQ7u04h5xnQXUZrfcJGJUrfo1TEObtZOYTWEaON3eL5t8/VTjaWSfqK5IePzSsv8wL6lyA1pLNDi2B2eoHthmkXao1j120mD58zfOiufWh5Djvd1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DenC8vmwyz1IQMTPf6FIHDgZliHlVZISltA+ohrSrA=;
 b=Y9ug+pOGCWiNA2MY1ViAcms1EqSwcmKGhaG7KYq4H9rAiv8/6Xn1UjucVhEZ2O68nhAOc4RGIh21pilZwfSjoB18KFEkKmZeerm1v3gE9ePV00Wv/0yNL3SEVmf5+aLj1K47hvqxp7rA9z4DfcPhkMcE+AtekF0dPdzrzQmxQIfjcqX9Iz+23STEvcLveTRC+//UByfKsOUSULZyBkbo+KIRw6WraY1sakXtNQc87l6DuDeoeND0y603FWRTB+a8KuP1EAtu6m1NAAdyt7TAkynclwIzk6j9/fBJI6xesCH5JBNpleiQ4exsy0IXRtCTPtDZltmYKUhalDOjWFNAlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DenC8vmwyz1IQMTPf6FIHDgZliHlVZISltA+ohrSrA=;
 b=XG2t/G5DnvEJkrDzUynMP6mkByMXrE37wLOXkFgiX/RQsjGVlDVFAYQFiA4DUu9sK4b7pN442MnFwFKdtQzxB2eR4S55To81+lPo05OVphkai47Yf4h8eJ2X6K1Why5wlXtzSa1H4pI/cuBEytQqkEbXNhYAOAaPvHayviraOMM=
Date: Wed, 21 Apr 2021 11:11:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/8] x86/EFI: program headers are an ELF concept
Message-ID: <YH/sLn+g/7wsZUDy@Air-de-Roger>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <017478f9-76d2-4dc4-de93-b662c4552968@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <017478f9-76d2-4dc4-de93-b662c4552968@suse.com>
X-ClientProxiedBy: MR1P264CA0014.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90d76448-ad81-47ce-5daa-08d904a56d6e
X-MS-TrafficTypeDiagnostic: DM6PR03MB4763:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4763B63076FF2081DD02A3888F479@DM6PR03MB4763.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AEDuagWZTexCZ5/3MjrRGrP2GByp4rSxTEAdQx/OQE1TZPsNuyEmuGnQF6AbdhXQDvxMfiAwTj03k5/03UkVHPF9sYhzEIrWGFO6SpVTpf3SlD2SG4D72SZgXUJzduf5IrXnGOY84zTKQCPuqEYWiql+wXZeOHKMcttzbOMs1gabndGAwEwnkkPfw8/8r2rYdh5bVdF9hV0BlFltTWPG4Avb43ftxV4+QJpu7tCryEMZaAh6WTzf6twkvV2P6n37Xe+UTz3UB5hwTtPDE7XeMn9WC8/Msla4XG1Ncs7mnyVWJ+bYhEhzFqdEqwOdVoAXg2dTnHDDcyYVRA/L62y7oyA6vyZk1PHJsyX8mnY49t0jqO1v0EEelvW8bDc4tZtUd7JeJT9eMlwBEc4EDVHZ1onMY+Ec28GVCxy3eDeFx1agALowYWbmNpz/GRKftAtkPATAb5EH7Ty29aFgJ1+Am+MmNNER3dFdWaoJNEVZDZHgUZjvdv/tPvTalmy+2U8hH8Nf57ZZFXBRo9+J79+nGAxFpY8TUrhUSShohF+40V4WxX9sXaPAmxaxA2XeH1kOA5uRMAZgpfJUpIuCVTivhnBQRslH8lYcWsDmTBPRATE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(86362001)(6916009)(33716001)(38100700002)(6486002)(8676002)(2906002)(4326008)(9686003)(6666004)(478600001)(54906003)(66476007)(85182001)(66946007)(6496006)(5660300002)(4744005)(8936002)(16526019)(186003)(956004)(26005)(66556008)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K3hFU0p3VnZvdGsyYlJMa2VJM1ZRWFJEM0poc2NCdUVXUkJVREVPcTkzUHRS?=
 =?utf-8?B?aUVCRnBsQmRyaXU2UmlpZ1I3clU2OExXVlF5MzJER1h4TTNRTjJrZEFSZUZk?=
 =?utf-8?B?Tnc3WXpXRTdCMnc0amppaHFZYmVvOUt2N1YxaVc4Y2lYNFlSazdxTHgraFJQ?=
 =?utf-8?B?L3gyRVRlbThsMmNubTM1QVg3dE5lTEZEcW5BRFJ6MXZwQUlnamxmWmI4U0tL?=
 =?utf-8?B?TnN0NmJMb1lGaHlBUTVpS1E3Q0NjRU56TXVaNkJsUDVmQ216Vmh0NWt6SFF6?=
 =?utf-8?B?SUpJblZjbXlnd0hESXlyakplR0ZjVEErbmtrZCt1WW5IUk5odnF0bUdhUm0v?=
 =?utf-8?B?ZFFaVDJheStBeC9DL2JzUFdHUHA0NFB3MVcxWk1oK2QwekVPMTBpbHFlcUNP?=
 =?utf-8?B?TTBnUldPakxqVXpDUUw2eVRmMFpjSE1IZ3NZcHU2cWZQSFZHeGVQcnRCaVRD?=
 =?utf-8?B?NXdiUld6RTBMcDFKSkpxSmpiblJPM0QvZTFzMW5vd1ZJbDV3NFNCUDdGSzNN?=
 =?utf-8?B?RTdFL2ZHMDk0bGg0NW9qQ1NKVWtyOS9pMmpSazlScXVxQS9LblZnTHU4NXhs?=
 =?utf-8?B?cE1XVGxiSnJOMlRJTHNFb3Q1LzdMTDFqcFpSaFUwMDlKWXlldHlVUTEwcHFL?=
 =?utf-8?B?UjRIaFRIcVhzOWplL3hxS1FSaFZaSHlMeEpTUEdaSWNwSkYrNmgwL0lNbk5W?=
 =?utf-8?B?eFVyeWtORjc0YlF3cHlDRW5XRFlkMkc3cEE0ZmIraDVmTjhpNnhsUUJWZGVB?=
 =?utf-8?B?VWVEcEd0T01kSHdVbS8xVm9VNlJ0OU9wKzQ4c2NHU0NKYllINTVMYit4NHNm?=
 =?utf-8?B?SGZHNnV0RUxmZEcrZWVnRHJaQ1FMQnRwYzc4cXZNQlQ4TTI2cjFjWnBtbFZD?=
 =?utf-8?B?MURVZHl0S3Bka1J0ZU5sQ1VTVFVramx4VHA4STJkSW1UQ1c3UEFXUjk5UCtZ?=
 =?utf-8?B?Z1N4bWp5RGVHRkxMaEhYYXlMYmR1cVFUaHlpdmZOWDdkbFQwWXNxWnNWR3RB?=
 =?utf-8?B?RXYwUmhXZ2pKQjR5aGZXS2VTbWoxaVRXT2FOM1p2MHJKaitNZ0NFT1BBNjJn?=
 =?utf-8?B?TmJSY3N1ZC8wUmx3M05Uak04K3VSQzJHMzhOL3d2RzVvN2xqYkVxVjFjdXQ4?=
 =?utf-8?B?Y0o2Y0ltNVgxWm5ncWlaOEpoOHBrdGtIdWFnY21mV1Ava0dpWkpxR2g1TmF3?=
 =?utf-8?B?UWxpdnVyTWFnZjB0aXd1ZFZCZ0ZnQWs1SWFNMmZCbjFFNEp6alRjQ1l4VmlU?=
 =?utf-8?B?TDl5Ty94RnhoVU03NlpkUGpwcit4bW9xQlFRWFRXejdVMFhLSVdDOG1OTXpQ?=
 =?utf-8?B?Q04wZ0RNakdhODNKUU80Wi8yd2UvZzRQeUxZcFM5Um91cE1BUFAyYWY0djhs?=
 =?utf-8?B?MUVEY1pPUmdzdzdTZk9VVnRlNnNkZjhsNjZXQXlid3BlV0d4UHNaSnROUkpP?=
 =?utf-8?B?WVJjRU03cDVabitRSUNRS01zMFJhWThwajA4dzJjdEpwU3p6TlpDVGxlSGlr?=
 =?utf-8?B?VVkvYk1XRWJJd296eG1CRVQxNzh2c1plbzZyL0wyMU1xaEMrMmNnSjFvS0N1?=
 =?utf-8?B?VlVtQ1lyUHVZdWRQMitWY3BXaGhUNDJrTDIzZHVsNjFFUUhRRDVHbE1QRDlK?=
 =?utf-8?B?d0gzeVF6ajhocjcwb1lZTGVMNncvc1RiVGxjcWljRmRweEtXZ25saHdpQk10?=
 =?utf-8?B?VytnVmlIb2d4c1R3RE5XdWFWL0pWN2hTVGh1UEcyWHlEeURWaE01K2E4NDNX?=
 =?utf-8?Q?ZlX2mp5wyoaWrIY+/robB1VQ+R2IqLbjo1tJ67R?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d76448-ad81-47ce-5daa-08d904a56d6e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 09:11:20.2765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5ZU7n2aN8PWZiQjLHAUMD5EkcrKSQTc9DoIRWnoz+uISSBm48kR7PjyTfq2VQ7gdx/foB+7YEWSNfcQIMVcrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4763
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 11:45:09AM +0200, Jan Beulich wrote:
> While they apparently do no harm when building xen.efi, their use is
> potentially misleading. Conditionalize their use to be for just the ELF
> binary we produce.
> 
> No change to the resulting binaries.

The GNU Linker manual notes that program headers would be ignored when
not generating an ELF file, so I'm not sure it's worth us adding more
churn to the linker script to hide something that's already ignored by
ld already.

Maybe adding a comment noting program headers are ignored when not
generating an ELF output would be enough?

Thanks, Roger.

